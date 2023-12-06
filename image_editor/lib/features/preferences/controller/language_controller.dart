import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_controller.g.dart';

class LanguageStore = LanguageStoreBase with _$LanguageStore;

abstract class LanguageStoreBase with Store {
  late SharedPreferences _prefs;

  LanguageStoreBase() {
    _loadLanguage();
  }

  @observable
  String language = 'pt-br';

  @action
  void changeLanguage() {
    language = (language == 'pt-br') ? 'en-us' : 'pt-br';
    _saveLanguage();
  }

  Future<void> _loadLanguage() async {
    _prefs = await SharedPreferences.getInstance();
    final isEnglish = _prefs.getBool('isEnglish') ?? false;

    language = isEnglish ? 'en-us' : 'pt-br';
  }

  Future<void> _saveLanguage() async {
    await _prefs.setBool('isEnglish', (language == 'en-us'));
  }
}
