import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../settings/app_settings.dart';
import '../services/podcast_manager.dart';

class PodcastScreen extends StatefulWidget {
  const PodcastScreen({super.key});

  @override
  State<PodcastScreen> createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<AppSettings>();
    final podcastManager = context.watch<PodcastManager>();

    return Scaffold(
      appBar: AppBar(title: const Text('Подкасты')),
      body: Stack(
        children: [
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  labelColor: settings.textColor,
                  unselectedLabelColor: settings.textColor.withOpacity(0.6),
                  tabs: const [Tab(text: 'Архитектура'), Tab(text: 'Статьи')],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildPodcastList(HelpScreen.architectureCards, podcastManager),
                      _buildPodcastList(HelpScreen.articleCards, podcastManager),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (podcastManager.isPanelVisible)
            PodcastPanel(manager: podcastManager, onClose: () => podcastManager.hidePanel()),
        ],
      ),
    );
  }

  Widget _buildPodcastList(List<Map<String, dynamic>> list, PodcastManager manager) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        final isPlaying = manager.currentIndex == index && manager.player.playing;

        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.only(bottom: 16),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                item['image'] ?? 'assets/images/logo.jpg',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(item['title'] ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: item['readTime'] != null
                ? Text("${item['readTime']} мин")
                : null,
            trailing: Icon(
              isPlaying ? Icons.pause_circle : Icons.play_circle,
              size: 50,
              color: Colors.brown.shade300,
            ),
            onTap: () => manager.open(list, index),
          ),
        );
      },
    );
  }
}

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  static final List<Map<String, dynamic>> architectureCards = [
    {
      'title': 'Нижегородская ярмарка',
      'image': 'assets/images/fair_cards.png',
      'description': 'Нижегородская ярмарка — крупнейший торговый центр России XIX века. После переноса из Макарьева в 1817 году она стала главным местом встречи купцов Европы и Азии. Здесь заключались многомиллионные сделки, формировались цены на зерно, чай и ткани. Ярмарка сыграла ключевую роль в развитии банковского дела, торговли и превращении Нижнего Новгорода в финансовую столицу страны.',
      'audioAsset': 'assets/audio/fair.mp3',
      'duration': 120,
    },
    {
      'title': 'Староярмарочный Спасский собор',
      'image': 'assets/images/old_fair_spassky_cathedral.jpg',
      'description': 'Староярмарочный Спасский собор построен в 1822 году как главный храм Нижегородской ярмарки. Он стал духовным центром крупнейшего торгового пространства России, объединяя купцов со всей страны. Собор символизировал связь торговли, веры и деловой этики, подчёркивая значение ярмарки не только как экономического, но и культурного центра города.',
      'audioAsset': 'assets/audio/fair.mp3',
      'duration': 120,
    },
    {
      'title': 'Пакгауз',
      'image': 'assets/images/warehouse.png',
      'description': 'Пакгауз — складское здание ярмарки XIX века, где купцы хранили товары для продажи и транспортировки. Он обеспечивал надёжное хранение зерна, тканей и других ценных грузов, упрощал логистику и ускорял торговлю. Пакгауз символизировал организованность и профессионализм купеческого сообщества Нижнего Новгорода.',
      'audioAsset': 'assets/audio/fair.mp3',
      'duration': 120,
    },
    {
      'title': 'Нижегородская биржа',
      'image': 'assets/images/nizny_novgorod_stock_exchange.jpg',
      'description': 'Нижегородская биржа, построенная в 1896 году, была центром торговли ценными бумагами, зерном и промтоварами. Здесь купцы и банкиры заключали сделки, формировали курсы и кредиты. Биржа символизировала финансовую зрелость города и способствовала превращению Нижнего Новгорода в «карман России».',
      'audioAsset': 'assets/audio/fair.mp3',
      'duration': 120,
    },
    {
      'title': 'Соляная биржа',
      'image': 'assets/images/salt_exchange.png',
      'description': 'Соляная биржа, образованная в середине XIX века, служила местом оборота и контроля поставок соли — важнейшего товара для России. Здесь регулировались цены, заключались оптовые сделки и хранились сведения о поставках. Биржа подчёркивала стратегическую роль Нижнего Новгорода в снабжении страны ключевыми товарами и поддержке торговли.',
      'audioAsset': 'assets/audio/fair.mp3',
      'duration': 120,
    },
    {
      'title': 'Блиновский пассаж',
      'image': 'assets/images/blinovsky_passage.png',
      'description': 'Блиновский пассаж, построенный в 1910-х годах, был коммерческим зданием с магазинами и офисами для купцов. Здесь сосредоточились торговля, банки и склады, обеспечивая комфорт и безопасность бизнеса. Пассаж стал символом модернизации городской торговли.',
      'audioAsset': 'assets/audio/fair.mp3',
      'duration': 120,
    },
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
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<AppSettings>();
    final podcastManager = context.watch<PodcastManager>();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Stack(
          children: [
            SafeArea(
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
                        _buildArchitecturePage(settings),
                        _buildCharactersPage(settings),
                        _buildArticlesPage(podcastManager),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const FloatingPodcastButton(),
            if (podcastManager.isPanelVisible)
              PodcastPanel(manager: podcastManager, onClose: () => podcastManager.hidePanel()),
          ],
        ),
      ),
    );
  }

  Widget _buildArchitecturePage(AppSettings settings) {
    return PageView.builder(
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
    );
  }

  Widget _buildCharactersPage(AppSettings settings) {
    return GridView.builder(
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
    );
  }

  Widget _buildArticlesPage(PodcastManager manager) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: HelpScreen.articleCards.length,
      itemBuilder: (context, index) {
        final article = HelpScreen.articleCards[index];
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          margin: const EdgeInsets.only(bottom: 16),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => manager.open(HelpScreen.articleCards, index),
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
                        SizedBox(
                          height: 40,
                          child: Text(
                            article['title']!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.access_time, size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text("${article['readTime']} мин", style: const TextStyle(color: Colors.grey)),
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
    );
  }

  Widget _buildCharacterFront(String imagePath, String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(imagePath, width: double.infinity, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.center),
      ],
    );
  }

  Widget _buildCardFront(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 6, offset: const Offset(0, 3))],
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
          child: Text(description, textAlign: TextAlign.center, style: TextStyle(fontSize: 16 * settings.textScale)),
        ),
      ),
    );
  }
}

class FloatingPodcastButton extends StatelessWidget {
  const FloatingPodcastButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24,
      right: 24,
      child: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.brown.shade300,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const PodcastScreen()),
          );
        },
        child: const Icon(Icons.podcasts),
      ),
    );
  }
}

class PodcastPanel extends StatefulWidget {
  final PodcastManager manager;
  final VoidCallback onClose;

  const PodcastPanel({super.key, required this.manager, required this.onClose});

  @override
  State<PodcastPanel> createState() => _PodcastPanelState();
}

class _PodcastPanelState extends State<PodcastPanel> {
  double speed = 1.0;
  Duration currentPosition = Duration.zero;

  @override
  void initState() {
    super.initState();

    widget.manager.player.positionStream.listen((pos) {
      setState(() => currentPosition = pos);
    });
    widget.manager.player.playerStateStream.listen((state) {
      setState(() {});
    });
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final manager = widget.manager;
    final article = manager.items[manager.currentIndex];
    final totalDuration = Duration(seconds: article['duration'] ?? 0);
    final isPlaying = manager.player.playing;

    return SlidingUpPanel(
      minHeight: 80,
      maxHeight: MediaQuery.of(context).size.height * 0.8,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      controller: manager.panelController,
      onPanelClosed: () {},
      panelBuilder: (_) => _buildPanel(article, manager, totalDuration, isPlaying),
      collapsed: _buildCollapsed(article, manager, isPlaying),
    );
  }

  Widget _buildPanel(Map<String, dynamic> article, PodcastManager manager, Duration totalDuration, bool isPlaying) {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  article['image'] ?? 'assets/images/logo.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  article['title'] ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 4,
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                  ),
                  child: Slider(
                    min: 0,
                    max: totalDuration.inSeconds.toDouble(),
                    value: currentPosition.inSeconds
                        .clamp(0, totalDuration.inSeconds)
                        .toDouble(),
                    onChanged: (value) async {
                      await manager.player.seek(Duration(seconds: value.toInt()));
                    },
                    activeColor: Colors.brown.shade300,
                    inactiveColor: Colors.brown.shade100,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(_formatDuration(currentPosition)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(_formatDuration(totalDuration)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.skip_previous),
                    iconSize: 36,
                    onPressed: manager.currentIndex > 0 ? () => manager.prev() : null,
                  ),
                  IconButton(
                    icon: Icon(isPlaying ? Icons.pause_circle : Icons.play_circle),
                    iconSize: 70,
                    onPressed: () => isPlaying ? manager.player.pause() : manager.player.play(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next),
                    iconSize: 36,
                    onPressed: manager.currentIndex < manager.items.length - 1 ? () => manager.next() : null,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Скорость: "),
                  PopupMenuButton<double>(
                    initialValue: speed,
                    onSelected: (val) {
                      setState(() => speed = val);
                      manager.player.setSpeed(val);
                    },
                    itemBuilder: (context) => const [
                      PopupMenuItem(value: 1.0, child: Text("1x")),
                      PopupMenuItem(value: 1.25, child: Text("1.25x")),
                      PopupMenuItem(value: 1.5, child: Text("1.5x")),
                      PopupMenuItem(value: 2.0, child: Text("2x")),
                    ],
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text("${speed}x"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCollapsed(Map<String, dynamic> article, PodcastManager manager, bool isPlaying) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24)), boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)]),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.skip_previous),
            onPressed: manager.currentIndex > 0 ? () => manager.prev() : null,
          ),
          ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset(article['image'] ?? 'assets/images/logo.jpg', width: 60, height: 60)),
          const SizedBox(width: 8),
          Expanded(child: Text(article['title'] ?? '', maxLines: 1, overflow: TextOverflow.ellipsis)),
          IconButton(icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow), onPressed: () => isPlaying ? manager.player.pause() : manager.player.play()),
          IconButton(
            icon: const Icon(Icons.skip_next),
            onPressed: manager.currentIndex < manager.items.length - 1 ? () => manager.next() : null,
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () async {
              await manager.player.stop();
              manager.hidePanel();
              manager.panelController.close();
            },
          ),
        ],
      ),
    );
  }
}