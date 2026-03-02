import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flip_card/flip_card.dart';
import '../settings/app_settings.dart';
import '../services/podcast_manager.dart';
import 'package:just_audio/just_audio.dart';
import 'article_web_screen.dart';

class PodcastPanel extends StatefulWidget {
  final List<Map<String, dynamic>> articles;
  final int initialIndex;
  final AudioPlayer player;
  final VoidCallback onClose;

  const PodcastPanel({
    super.key,
    required this.articles,
    required this.initialIndex,
    required this.player,
    required this.onClose,
  });

  @override
  State<PodcastPanel> createState() => _PodcastPanelState();
}

class _PodcastPanelState extends State<PodcastPanel> {
  late int currentIndex;
  bool isPlaying = false;
  double speed = 1.0;

  Duration totalDuration = Duration.zero;
  Duration currentPosition = Duration.zero;

  AudioPlayer get _player => widget.player;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    totalDuration = Duration(
      seconds: widget.articles[currentIndex]['duration'] ?? 0,
    );

    _player.positionStream.listen((pos) {
      setState(() => currentPosition = pos);
    });

    _player.playerStateStream.listen((state) {
      setState(() => isPlaying = state.playing);
    });
  }

  Future<void> _loadAudio(int index, {bool autoPlay = true}) async {
    final audioAsset = widget.articles[index]['audioAsset'] ?? '';
    if (audioAsset.isEmpty) return;

    await _player.stop();
    await _player.setAsset(audioAsset);
    await _player.setSpeed(speed);

    setState(() {
      currentIndex = index;
      totalDuration =
          Duration(seconds: widget.articles[currentIndex]['duration'] ?? 0);
      currentPosition = Duration.zero;
    });

    if (autoPlay) await _player.play();
  }

  void _playPause() async {
    if (_player.playing) {
      await _player.pause();
    } else {
      final duration = _player.duration;
      if (duration == null || currentPosition == Duration.zero) {
        await _loadAudio(currentIndex, autoPlay: true);
      } else {
        await _player.play();
      }
    }
  }

  void _prev() async {
    if (currentIndex > 0) {
      await _loadAudio(currentIndex - 1);
    }
  }

  void _next() async {
    if (currentIndex < widget.articles.length - 1) {
      await _loadAudio(currentIndex + 1);
    }
  }

  void _setSpeed(double val) {
    setState(() => speed = val);
    _player.setSpeed(speed);
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final article = widget.articles[currentIndex];

    return SlidingUpPanel(
      minHeight: 80,
      maxHeight: MediaQuery.of(context).size.height * 0.9,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      panelBuilder: (_) => _buildPanel(article),
      collapsed: _buildCollapsed(article),
    );
  }

  Widget _buildPanel(Map<String, dynamic> article) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Container(
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 60),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          article['image'] ?? 'assets/images/logo.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Slider(
                          min: 0,
                          max: totalDuration.inSeconds.toDouble(),
                          value: currentPosition.inSeconds
                              .clamp(0, totalDuration.inSeconds)
                              .toDouble(),
                          onChanged: (value) async {
                            final newPosition = Duration(seconds: value.toInt());
                            await _player.seek(newPosition);
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_formatDuration(currentPosition)),
                            Text(_formatDuration(totalDuration)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 36,
                        icon: const Icon(Icons.skip_previous),
                        onPressed: _prev,
                      ),
                      IconButton(
                        iconSize: 70,
                        icon: Icon(
                          isPlaying ? Icons.pause_circle : Icons.play_circle,
                        ),
                        onPressed: _playPause,
                      ),
                      IconButton(
                        iconSize: 36,
                        icon: const Icon(Icons.skip_next),
                        onPressed: _next,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Скорость:"),
                      const SizedBox(width: 8),
                      PopupMenuButton<double>(
                        initialValue: speed,
                        onSelected: _setSpeed,
                        itemBuilder: (context) => const [
                          PopupMenuItem(value: 1.0, child: Text("1x")),
                          PopupMenuItem(value: 1.25, child: Text("1.25x")),
                          PopupMenuItem(value: 1.5, child: Text("1.5x")),
                          PopupMenuItem(value: 2.0, child: Text("2x")),
                        ],
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text("${speed}x"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16), // убрали крестик здесь
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCollapsed(Map<String, dynamic> article) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(
            value: totalDuration.inSeconds > 0
                ? currentPosition.inSeconds / totalDuration.inSeconds
                : 0,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            minHeight: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    article['image'] ?? 'assets/images/logo.jpg',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    article['title']!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                // кнопка закрытия панели здесь
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    _player.stop(); // останавливаем аудио
                    widget.onClose(); // закрываем панель
                  },
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(8),
                ),
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  onPressed: _prev,
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(8),
                ),
                IconButton(
                  icon: Icon(isPlaying ? Icons.pause_circle : Icons.play_circle),
                  iconSize: 32,
                  onPressed: _playPause,
                  padding: const EdgeInsets.all(4),
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  onPressed: _next,
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(8),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FloatingPodcastButton extends StatelessWidget {
  const FloatingPodcastButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PodcastManager>(
      builder: (_, manager, __) {
        if (manager.isPanelVisible) return const SizedBox.shrink();
        return Positioned(
          bottom: 24,
          right: 24,
          child: FloatingActionButton(
            mini: true,
            backgroundColor: Colors.brown.shade300,
            onPressed: () => manager.showPanel(),
            child: const Icon(Icons.podcasts),
          ),
        );
      },
    );
  }
}

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  static final List<Map<String, String>> architectureCards = const [
    {
      'image': 'assets/images/logo.jpg',
      'description':
          'Предлагаем Вам поближе познакомиться с финансовой архитектурой Нижнего Новгорода. Листайте карточки и узнайте, почему город называли «карманом России» — центром торговли и капитала XIX века.'
    },
    {
      'image': 'assets/images/fair_cards.png',
      'description':
          'Нижегородская ярмарка — крупнейший торговый центр России XIX века. После переноса из Макарьева в 1817 году она стала главным местом встречи купцов Европы и Азии. Здесь заключались многомиллионные сделки, формировались цены на зерно, чай и ткани. Ярмарка сыграла ключевую роль в развитии банковского дела, торговли и превращении Нижнего Новгорода в финансовую столицу страны.'
    },
    // остальные карточки
  ];

  static final List<Map<String, String>> characterCards = const [
    {'image': 'assets/images/alex.png', 'name': 'Александр Бугров', 'description': 'Главный герой истории'},
    {'image': 'assets/images/hero.png', 'name': 'Герой 2', 'description': 'Другой персонаж'},
  ];

  static final List<Map<String, dynamic>> articleCards = [
    {
      'title': 'Строили для истории',
      'url': 'https://museum.cbr.ru/articles/stroili-dlya-istorii/',
      'text': 'first',
      'image': 'assets/images/first_article.png',
      'audioAsset': 'assets/audio/first_article.mp3',
      'duration': 115,
      'readTime': 24,
    },
    {
      'title': 'Банк с привидениями и другие легенды',
      'url': 'https://museum.cbr.ru/articles/bank-s-privideniyami-i-drugie-legendy/',
      'text': 'second',
      'image': 'assets/images/second_article.png',
      'audioAsset': 'assets/audio/second_article.mp3',
      'duration': 113,
      'readTime': 9,
    },
  ];

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  void _openPodcastPanel(int index) {
    Provider.of<PodcastManager>(context, listen: false).showPanel(index);
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<AppSettings>();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Stack(
          children: [
            SafeArea(
              top: false,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                      color: settings.backgroundColor,
                      child: TabBar(
                        labelColor: settings.textColor,
                        unselectedLabelColor: settings.textColor.withOpacity(0.6),
                        tabs: const [
                          Tab(text: 'Архитектура'),
                          Tab(text: 'Персонажи'),
                          Tab(text: 'Статьи'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Architecture
                        PageView.builder(
                          controller: PageController(viewportFraction: 0.7),
                          itemCount: HelpScreen.architectureCards.length,
                          itemBuilder: (context, index) {
                            final card = HelpScreen.architectureCards[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                              child: Center(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.65,
                                  child: AspectRatio(
                                    aspectRatio: 3.5 / 5,
                                    child: FlipCard(
                                      direction: FlipDirection.HORIZONTAL,
                                      front: _buildCardFront(card['image']!),
                                      back: _buildCardBackCentered(card['description']!, settings),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        // Characters
                        GridView.builder(
                          padding: const EdgeInsets.all(16),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          itemCount: HelpScreen.characterCards.length,
                          itemBuilder: (context, index) {
                            final char = HelpScreen.characterCards[index];
                            return FlipCard(
                              direction: FlipDirection.HORIZONTAL,
                              front: _buildCharacterFront(char['image']!, char['name']!),
                              back: _buildCardBackCentered(char['description']!, settings),
                            );
                          },
                        ),
                        // Articles
                        // Articles
                        ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: HelpScreen.articleCards.length,
                          itemBuilder: (context, index) {
                            final article = HelpScreen.articleCards[index];
                            final duration = Duration(seconds: article['duration'] ?? 0);

                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 4,
                              margin: const EdgeInsets.only(bottom: 16),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {
                                  // Переход на статью
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ArticleWebScreen(
                                        title: article['title']!,
                                        url: article['url']!,
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          article['image'] ?? 'assets/images/logo.jpg',
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // Название с фиксированной высотой
                                            SizedBox(
                                              height: 40,
                                              child: Text(
                                                article['title']!,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            // Время чтения
                                            Row(
                                              children: [
                                                const Icon(Icons.access_time, size: 16, color: Colors.grey),
                                                const SizedBox(width: 4),
                                                Text(
                                                  "${article['readTime']} мин",
                                                  style: const TextStyle(color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const FloatingPodcastButton(),
            Consumer<PodcastManager>(
              builder: (_, manager, __) {
                if (!manager.isPanelVisible) return const SizedBox.shrink();
                return PodcastPanel(
                  articles: manager.articles,
                  initialIndex: manager.currentIndex,
                  player: manager.player,
                  onClose: manager.hidePanel,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterFront(String imagePath, String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildCardFront(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
    );
  }

  Widget _buildCardBackCentered(String description, AppSettings settings) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFD2B48C), width: 2),
      ),
      padding: const EdgeInsets.all(16),
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16 * settings.textScale),
          ),
        ),
      ),
    );
  }
}