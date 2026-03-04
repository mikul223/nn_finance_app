import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrencyManager extends ChangeNotifier {
  int _gold = 0;
  int _silver = 0;

  int get gold => _gold;
  int get silver => _silver;

  CurrencyManager() {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    _gold = prefs.getInt('goldCoins') ?? 0;
    _silver = prefs.getInt('silverCoins') ?? 0;
    notifyListeners();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('goldCoins', _gold);
    await prefs.setInt('silverCoins', _silver);
  }

  Future<void> addGold(int amount) async {
    _gold += amount;
    await _save();
    notifyListeners();
  }

  Future<void> addSilver(int amount) async {
    _silver += amount;
    await _save();
    notifyListeners();
  }

  Future<void> spendGold(int amount) async {
    if (_gold >= amount) {
      _gold -= amount;
      await _save();
      notifyListeners();
    }
  }

  Future<void> spendSilver(int amount) async {
    if (_silver >= amount) {
      _silver -= amount;
      await _save();
      notifyListeners();
    }
  }
}