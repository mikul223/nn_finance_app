import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/podcast_manager.dart';
import 'help_screen.dart';

class PodcastsScreen extends StatefulWidget {
  const PodcastsScreen({super.key});

  @override
  State<PodcastsScreen> createState() => _PodcastsScreenState();
}

class _PodcastsScreenState extends State<PodcastsScreen>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final manager = context.watch<PodcastManager>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Подкасты"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Статьи"),
            Tab(text: "Архитектура"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildPlaylist(HelpScreen.articleCards, manager),
          _buildPlaylist(HelpScreen.architectureCards, manager),
        ],
      ),
      bottomNavigationBar: _buildPlayer(manager),
    );
  }

  Widget _buildPlaylist(
      List<Map<String, dynamic>> items,
      PodcastManager manager,
      ) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item['image'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(item['title'] ?? "Без названия"),
            subtitle: Text("${item['duration'] ?? 0} сек"),
            trailing: const Icon(Icons.play_circle),
            onTap: () {
              manager.open(items, index);
            },
          ),
        );
      },
    );
  }

  Widget _buildPlayer(PodcastManager manager) {
    if (!manager.isPanelVisible) return const SizedBox.shrink();

    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 4)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.skip_previous),
            onPressed: manager.prev,
          ),
          IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () => manager.player.play(),
          ),
          IconButton(
            icon: const Icon(Icons.skip_next),
            onPressed: manager.next,
          ),
        ],
      ),
    );
  }
}