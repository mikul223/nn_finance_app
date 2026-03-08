import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/currency_bar.dart';
import '../repositories/story_repository.dart';
import '../settings/app_settings.dart';
import 'story_screen.dart';
import 'settings_screen.dart';
import 'accessibility_screen.dart';
import 'story_details_screen.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = StoryRepository.allStories;
    final settings = context.watch<AppSettings>();

    return Scaffold(
      backgroundColor: settings.backgroundColor,

      appBar: AppBar(
        backgroundColor: settings.backgroundColor,
        foregroundColor: settings.textColor,
        elevation: 0,
        title: Text(
          "",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22 * settings.textScale,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.visibility),
            tooltip: "Версия для слабовидящих",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AccessibilityScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: "Настройки",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: settings.backgroundColor,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: settings.backgroundColor,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Все истории",
                  style: TextStyle(
                    fontSize: 24 * settings.textScale,
                    fontWeight: FontWeight.bold,
                    color: settings.textColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  final story = stories[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => StoryDetailsScreen(story: story),
                          ),
                        );
                      },
                      child: Container(
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            if (story.coverImage != null)
                              Positioned.fill(
                                child: Image.asset(
                                  story.coverImage!,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.7),
                                      Colors.black.withOpacity(0.2),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 12,
                              right: 12,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFAC876D),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "${index + 1}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 16,
                              right: 16,
                              bottom: 16,
                              child: Text(
                                story.title,
                                style: TextStyle(
                                  fontSize: 20 * settings.textScale,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),

          Center(
            child: CurrencyBar(),
          ),

          const SizedBox(height: 12),

          Expanded(
            child: _StoriesStackView(stories: stories),
          ),
        ],
      ),
    );
  }
}

class _StoriesStackView extends StatefulWidget {
  final List stories;

  const _StoriesStackView({required this.stories});

  @override
  State<_StoriesStackView> createState() => _StoriesStackViewState();
}

class _StoriesStackViewState extends State<_StoriesStackView> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.78,
    );
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<AppSettings>();

    return PageView.builder(
      controller: _controller,
      scrollDirection: Axis.vertical,
      itemCount: widget.stories.length,
      itemBuilder: (context, index) {
        final story = widget.stories[index];

        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            double value = 1.0;

            if (_controller.position.haveDimensions) {
              value = (_controller.page ?? 0) - index;
              value = (1 - (value.abs() * 0.15)).clamp(0.85, 1.0);
            }

            return Transform.scale(
              scale: value,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => StoryDetailsScreen(story: story),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        if (story.coverImage != null)
                          Center(
                            child: Image.asset(
                              story.coverImage!,
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 24,
                          left: 16,
                          right: 16,
                          child: Text(
                            story.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22 * settings.textScale,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}