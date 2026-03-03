import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PodcastManager extends ChangeNotifier {
  final AudioPlayer player = AudioPlayer();
  final PanelController panelController = PanelController();

  List<Map<String, dynamic>> _items = [];
  int currentIndex = 0;
  bool isPanelVisible = false;

  List<Map<String, dynamic>> get items => _items;

  void open(List<Map<String, dynamic>> items, int index) {
    _items = items;
    currentIndex = index;
    if (!isPanelVisible) {
      isPanelVisible = true;
    }
    _loadAudio(currentIndex, autoPlay: true);
    notifyListeners();
  }

  void hidePanel() {
    isPanelVisible = false;
    player.stop();
    notifyListeners();
  }

  Future<void> _loadAudio(int index, {bool autoPlay = true}) async {
    if (_items.isEmpty) return;
    final audioAsset = _items[index]['audioAsset'] ?? '';
    if (audioAsset.isEmpty) return;

    await player.stop();
    await player.setAsset(audioAsset);

    if (autoPlay) await player.play();
    notifyListeners();
  }

  void next() {
    if (currentIndex < _items.length - 1) {
      currentIndex++;
      _loadAudio(currentIndex, autoPlay: true);
      notifyListeners();
    }
  }

  void prev() {
    if (currentIndex > 0) {
      currentIndex--;
      _loadAudio(currentIndex, autoPlay: true);
      notifyListeners();
    }
  }

  void togglePlayPause() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
    notifyListeners();
  }

  bool get hasNext => currentIndex < _items.length - 1;
  bool get hasPrev => currentIndex > 0;
}