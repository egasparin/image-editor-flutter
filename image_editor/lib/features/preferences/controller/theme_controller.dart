import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_controller.g.dart';

class ThemeStore = ThemeStoreBase with _$ThemeStore;

abstract class ThemeStoreBase with Store {
  late SharedPreferences _prefs;

  ThemeStoreBase() {
    _loadTheme();
  }

  @observable
  ThemeData currentTheme = ThemeData.light();

  @action
  void changeTheme() {
    currentTheme = (currentTheme == ThemeData.light())
        ? ThemeData.dark()
        : ThemeData.light();
    _saveTheme();
  }

  Future<void> _loadTheme() async {
    _prefs = await SharedPreferences.getInstance();
    final isDarkMode = _prefs.getBool('isDarkMode') ?? false;

    currentTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();
  }

  Future<void> _saveTheme() async {
    await _prefs.setBool('isDarkMode', currentTheme == ThemeData.dark());
  }
}
