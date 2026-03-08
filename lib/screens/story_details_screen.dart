import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/story_model.dart';
import '../settings/app_settings.dart';
import 'story_screen.dart';

class StoryDetailsScreen extends StatelessWidget {
  final Story story;

  const StoryDetailsScreen({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<AppSettings>();
    final isReady = story.status == 'ready';

    return Scaffold(
      backgroundColor: settings.backgroundColor,
      body: Stack(
        children: [

          if (story.coverImage != null)
            Positioned.fill(
              child: Image.asset(
                story.coverImage!,
                fit: BoxFit.cover,
              ),
            ),
          

          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          story.title,
                          style: TextStyle(
                            fontSize: 32 * settings.textScale,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        
                        const SizedBox(height: 16),

                    
                        Text(
                          story.description,
                          style: TextStyle(
                            fontSize: 16 * settings.textScale,
                            color: Colors.white.withOpacity(0.9),
                            height: 1.5,
                          ),
                        ),

                        const SizedBox(height: 24),

                        
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color(0xFFD2B48C).withOpacity(0.5),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildInfoItem(
                                icon: Icons.location_on,
                                value: '${story.routePoints}',
                                label: 'точек',
                              ),
                              _buildInfoItem(
                                icon: Icons.access_time,
                                value: '${story.routeTime}',
                                label: 'минут',
                              ),
                              _buildInfoItem(
                                icon: Icons.flag,
                                value: story.status == 'ready' ? 'Доступно' : 'Скоро',
                                label: '',
                                color: story.status == 'ready' 
                                    ? Colors.green 
                                    : Colors.orange,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 32),

                        
                        if (isReady)
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => StoryScreen(story: story),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFD2B48C),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 48,
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text(
                                'Начать историю',
                                style: TextStyle(
                                  fontSize: 18 * settings.textScale,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String value,
    required String label,
    Color color = Colors.white,
  }) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFFD2B48C), size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}