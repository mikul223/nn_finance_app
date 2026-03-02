import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PodcastManager extends ChangeNotifier {
  final AudioPlayer player = AudioPlayer();
  final List<Map<String, dynamic>> articles;

  int currentIndex = 0;
  bool isPanelVisible = false;

  PodcastManager({required this.articles});

  void showPanel([int? index]) {
    if (index != null) currentIndex = index;
    isPanelVisible = true;
    _loadAudio(currentIndex, autoPlay: true);
    notifyListeners();
  }

  void hidePanel() {
    isPanelVisible = false;
    notifyListeners();
  }

  Future<void> _loadAudio(int index, {bool autoPlay = true}) async {
    final audioAsset = articles[index]['audioAsset'] ?? '';
    if (audioAsset.isEmpty) return;

    await player.stop();
    await player.setAsset(audioAsset);

    if (autoPlay) await player.play();
  }

  void togglePlayPause() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
    notifyListeners();
  }

  void next() {
    if (currentIndex < articles.length - 1) {
      currentIndex++;
      _loadAudio(currentIndex);
      notifyListeners();
    }
  }

  void prev() {
    if (currentIndex > 0) {
      currentIndex--;
      _loadAudio(currentIndex);
      notifyListeners();
    }
  }
}