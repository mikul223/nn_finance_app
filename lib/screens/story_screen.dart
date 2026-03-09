import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../settings/currency_manager.dart';
import '../widgets/currency_bar.dart';
import '../settings/story_progress.dart';
import '../settings/app_settings.dart';
import '../models/story_model.dart';
import 'map_screen.dart';

class StoryScreen extends StatefulWidget {
  final Story story;

  const StoryScreen({super.key, required this.story});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  int _characterKeyCounter = 0;
  int _cachedGold = 0;
  int _cachedSilver = 0;
  late FlutterTts _tts;
  bool _isAudioMode = false;
  bool _isDisposed = false;
  bool _isSpeaking = false;
  bool _isOnMapPage = false;

  Set<int> _selectedIndexes = {};
  bool _taskAnswered = false;
  bool _taskWasCorrect = false;

  late PageController _pageController;

  bool _endStoryProcessed = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _initTts();
  }

  void _goToStoryPage() {
    _pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _initTts() async {
    _tts = FlutterTts();
    await _tts.setLanguage("ru-RU");
    var voices = await _tts.getVoices;
    for (var v in voices) debugPrint("TTS Voice: $v");

    await _tts.setVoice({"name": "ru-ru-x-rue-local", "locale": "ru-RU"});
    await _tts.setVolume(1.0);
    _tts.awaitSpeakCompletion(true);

    _tts.setCompletionHandler(() {
      _isSpeaking = false;
      if (_isAudioMode && !_isDisposed && mounted) {
        _playNextLine();
      }
    });
  }

  @override
  void dispose() {
    _isDisposed = true;
    _tts.stop();
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _speakLine(StoryLine line) async {
    if (!mounted) return;
    if (_isSpeaking) return;

    _isSpeaking = true;
    await _tts.stop();

    String textToSpeak;
    if (line.isInfoCard && line.infoDescription != null) {
      textToSpeak = line.infoDescription!;
    } else {
      textToSpeak = line.text;
    }

    if (line.isNarration) {
      await _tts.setSpeechRate(0.38);
      await _tts.setPitch(0.95);
    } else if (line.isMainHero) {
      await _tts.setSpeechRate(0.42);
      await _tts.setPitch(1.1);
    } else {
      await _tts.setSpeechRate(0.44);
      await _tts.setPitch(1.05);
    }

    await _tts.speak("… $textToSpeak");
  }

  void _playNextLine() async {
    if (!mounted) return;
    final progress = context.read<StoryProgress>();
    final lines = widget.story.lines;

    progress.next(widget.story.id, lines.length);
    final newIndex = progress.getIndex(widget.story.id);

    if (newIndex < lines.length) {
      await _speakLine(lines[newIndex]);
    }
  }

  void _toggleAudioMode(StoryProgress progress) async {
    if (!mounted) return;
    setState(() => _isAudioMode = !_isAudioMode);

    final lines = widget.story.lines;
    final index = progress.getIndex(widget.story.id);

    if (_isAudioMode && index < lines.length) {
      await _speakLine(lines[index]);
    } else {
      await _tts.stop();
      _isSpeaking = false;
    }
  }

  String _getCharacterId(String characterName) {
    switch(characterName) {
      case 'Александр Бугров': return 'alex';
      case 'Николай Бугров': return 'bugrov';
      case 'Громов': return 'gromov';
      case 'Продавщица': return 'saleswoman';
      case 'Отец Серафим': return 'seraphim';
      case 'Иван Терентьев': return 'terentev';
      case 'Семён Кротов': return 'semen';
      default: return characterName.toLowerCase().replaceAll(' ', '_');
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = context.watch<StoryProgress>();
    final settings = context.watch<AppSettings>();
    final lines = widget.story.lines;
    final isEnd = progress.isCompleted(widget.story.id, lines.length);

    if (isEnd && !_endStoryProcessed) {
      // final currency = context.read<CurrencyManager>();
      // const int goldEarned = 5;
      // const int silverEarned = 10;
      // currency.addGold(goldEarned);
      // currency.addSilver(silverEarned);
      _endStoryProcessed = true;
    }

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() => _isOnMapPage = index == 1);
              },
              children: [
                isEnd
                    ? _buildEndStory(context, settings, progress)
                    : _buildStoryContent(
                        context,
                        lines[progress.getIndex(widget.story.id)],
                        settings,
                        progress,
                      ),
                MapScreen(onBackToStory: _goToStoryPage),
              ],
            ),

            if (!_isOnMapPage && !isEnd)
              Positioned(
                top: MediaQuery.of(context).padding.top + 12,
                left: 12,
                right: 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CurrencyBar(),
                    Row(
                      children: [
                        Material(
                          color: Colors.white,
                          shape: const CircleBorder(),
                          elevation: 4,
                          child: IconButton(
                            icon: const Icon(Icons.close, color: Colors.black),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Material(
                          color: Colors.white,
                          shape: const CircleBorder(),
                          elevation: 4,
                          child: IconButton(
                            icon: Icon(
                              _isAudioMode ? Icons.headphones : Icons.menu_book,
                              color: Colors.black,
                            ),
                            onPressed: () => _toggleAudioMode(progress),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(StoryLine current, AppSettings settings) {
  return Stack(
    children: [
      if (current.backgroundImage != null)
        Positioned.fill(
          child: Image.asset(
            current.backgroundImage!,
            fit: BoxFit.cover,
          ),
        ),
      Container(color: Colors.black.withOpacity(0.6)),
      Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFD2B48C), width: 3),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (current.infoImage != null)
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(21),
                    ),
                    child: Image.asset(
                      current.infoImage!,
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        current.infoTitle ?? 'Справка',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5D3A1A),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        current.infoDescription ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          if (!mounted) return;
                          context.read<StoryProgress>().next(
                                widget.story.id,
                                widget.story.lines.length,
                              );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD2B48C),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            'Понятно',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}


  Widget _buildStoryContent(BuildContext context, StoryLine current,
      AppSettings settings, StoryProgress progress) {

    if (current.isInfoCard) {
      return _buildInfoCard(current, settings);
    }

    if (current.task != null) {
      return _buildInteractiveTask(context, current.task!, progress, settings);
    }

    if (settings.imagesEnabled && current.image != null && current.character != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_isDisposed && mounted) {
          String charId = _getCharacterId(current.character!);
          progress.markCharacterAsMet(charId);
        }
      });
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        if (!_isAudioMode) {
          await _tts.stop();
          if (!mounted) return;
          progress.next(widget.story.id, widget.story.lines.length);
        }
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: current.backgroundImage != null && settings.imagesEnabled
                  ? SizedBox.expand(
                      key: ValueKey(current.backgroundImage),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        child: Image.asset(current.backgroundImage!),
                      ),
                    )
                  : settings.imagesEnabled && widget.story.coverImage != null
                      ? SizedBox.expand(
                          key: const ValueKey('story_cover'),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            child: Image.asset(widget.story.coverImage!),
                          ),
                        )
                      : Container(color: settings.backgroundColor),
            ),
          ),
          Positioned.fill(
            child: Container(
              color: settings.darkTheme
                  ? Colors.black.withOpacity(0.55)
                  : Colors.black.withOpacity(0.35),
            ),
          ),

          if (settings.imagesEnabled && current.image != null)
            Align(
              alignment: current.isMainHero ? Alignment.bottomRight : Alignment.bottomLeft,
              child: Transform.translate(
                offset: current.isMainHero 
                    ? const Offset(40, 0)
                    : const Offset(-40, 0),
                child: Image.asset(
                  current.image!,
                  height: MediaQuery.of(context).size.height * 0.88,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

          if (current.isNarration)
            Center(child: _buildNarrationBubble(context, current, settings)),
          if (!current.isNarration && current.text.isNotEmpty)
            _buildCharacterBubble(context, current, settings),
        ],
      ),
      
    );
    
  }

Widget _buildInteractiveTask(BuildContext context, InteractiveTask task,
    StoryProgress progress, AppSettings settings) {

  return StatefulBuilder(
    builder: (context, setState) {
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                task.question,
                style: TextStyle(
                  fontSize: 18 * settings.textScale,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              ...List.generate(task.options.length, (index) {
                final option = task.options[index];
                final isSelected = _selectedIndexes.contains(index);

                Color bgColor = Colors.grey.shade200;
                Color textColor = Colors.black87;

                if (_taskAnswered) {
                  if (option.isCorrect) {
                    bgColor = Colors.green.shade400;
                    textColor = Colors.white;
                  } else if (isSelected) {
                    bgColor = Colors.red.shade400;
                    textColor = Colors.white;
                  }
                } else if (isSelected) {
                  bgColor = Colors.blue.shade300;
                  textColor = Colors.white;
                }

                return GestureDetector(
                  onTap: _taskAnswered 
                      ? null
                      : () {
                          setState(() {
                            if (isSelected) {
                              _selectedIndexes.remove(index);
                            } else if (_selectedIndexes.length <
                                task.requiredCorrect) {
                              _selectedIndexes.add(index);
                            }
                          });
                        },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      option.text,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16 * settings.textScale,
                      ),
                    ),
                  ),
                );
              }),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: _taskAnswered
                  ? () {
                      setState(() {
                        _selectedIndexes.clear();
                        _taskAnswered = false;
                        _taskWasCorrect = false;
                      });

                      progress.next(widget.story.id, widget.story.lines.length);
                    }
                    : _selectedIndexes.length == task.requiredCorrect
                        ? () async {
                            final currency =
                                context.read<CurrencyManager>();

                            bool allCorrect =
                                _selectedIndexes.every((i) =>
                                        task.options[i].isCorrect) &&
                                    task.options
                                            .where((o) => o.isCorrect)
                                            .length ==
                                        _selectedIndexes.length;

                            setState(() {
                              _taskAnswered  = true;
                              _taskWasCorrect  = allCorrect;
                            });

                            if (allCorrect) {
                              if (task.isOnline) {
                                const int silverEarned = 10;
                                await currency.addSilver(silverEarned);
                                progress.addSilver(
                                    widget.story.id, silverEarned);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Вы правильно ответили и получили 10 серебряных монет!'),
                                  ),
                                );
                              } else {
                                const int goldEarned = 5;
                                await currency.addGold(goldEarned);
                                progress.addGold(widget.story.id, goldEarned);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Вы правильно ответили и получили 5 золотых монет!'),
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Ответ неверный. Правильные варианты показаны.'),
                                ),
                              );
                            }
                          }
                        : null,
                child: Text(_taskAnswered? 'Продолжить' : 'Подтвердить'),
              ),
            ],
          ),
        ),
      );
    },
  );
}

  Widget _buildNarrationBubble(
      BuildContext context, StoryLine current, AppSettings settings) {
    final textScale =
        MediaQuery.of(context).textScaleFactor * settings.textScale;

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.85),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFD2B48C), width: 2),
        ),
        child: Text(
          current.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20 * textScale,
            color: settings.textColor,
            height: 1.5,
          ),
        ),
      ),
    );

    
  }

  Widget _buildCharacterBubble(
      BuildContext context, StoryLine current, AppSettings settings) {
    final textScale =
        MediaQuery.of(context).textScaleFactor * settings.textScale;
    final screenWidth = MediaQuery.of(context).size.width;
    final alignment =
        current.isMainHero ? Alignment.bottomRight : Alignment.bottomLeft;
    final marginLeft = current.isMainHero ? screenWidth * 0.2 : 20.0;
    final marginRight = current.isMainHero ? 20.0 : screenWidth * 0.2;

    return Align(
      alignment: alignment,
      child: Container(
        margin:
            EdgeInsets.only(left: marginLeft, right: marginRight, bottom: 80),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: screenWidth * 0.65),
          child: IntrinsicWidth(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border:
                    Border.all(color: const Color(0xFFD2B48C), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (current.character != null)
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD2B48C),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        current.character!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  Text(
                    current.text,
                    style: TextStyle(
                      fontSize: 18 * textScale,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
Widget _buildEndStory(BuildContext context, AppSettings settings, StoryProgress progress) {
  final currency = context.watch<CurrencyManager>();
  final int goldEarned = progress.getGoldEarned(widget.story.id);
  final int silverEarned = progress.getSilverEarned(widget.story.id);
  const goldColor = Colors.amber;
  const silverColor = Colors.grey;

  return Stack(
    children: [
      if (widget.story.coverImage != null && settings.imagesEnabled)
        Positioned.fill(
          child: FittedBox(
            fit: BoxFit.cover,
            alignment: Alignment.center,
            child: Image.asset(widget.story.coverImage!),
          ),
        )
      else
        Positioned.fill(child: Container(color: settings.backgroundColor)),
      Positioned.fill(child: Container(color: Colors.black.withOpacity(0.65))),

      Positioned(
        top: MediaQuery.of(context).padding.top + 12,
        left: 12,
        child: Material(
          color: Colors.white,
          shape: const CircleBorder(),
          elevation: 4,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () async {
              _isSpeaking = false;
              await _tts.stop();
              if (!mounted) return;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!mounted) return;
                Navigator.of(context).pop();
              });
            },
          ),
        ),
      ),

      Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Конец истории',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28 * settings.textScale,
                  fontWeight: FontWeight.bold,
                  color: settings.textColor,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  progress.reset(widget.story.id);
                  _pageController.jumpToPage(0);
                },
                child: const Text('Начать заново'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: goldColor,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '+$goldEarned',
                          style: TextStyle(
                            fontSize: 14 * settings.textScale,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Всего: ${currency.gold}',
                        style: TextStyle(
                          fontSize: 14 * settings.textScale,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 40),
                  Column(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: silverColor,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '+$silverEarned',
                          style: TextStyle(
                            fontSize: 14 * settings.textScale,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Всего: ${currency.silver}',
                        style: TextStyle(
                          fontSize: 14 * settings.textScale,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
}