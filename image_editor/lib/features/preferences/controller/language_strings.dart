import 'package:simple_image_editor/features/preferences/controller/language_controller.dart';

class StringLanguage {
  LanguageStore languageStore = LanguageStore();

  StringLanguage(this.languageStore);

  static String titulo(StringLanguage language){
    return (language.languageStore.language == 'pt-br')
        ? 'Editor de Imagem'
        : 'Simple Editor';
  }

  String title() {
    return (languageStore.language == 'pt-br')
        ? 'Editor de Imagem'
        : 'Simple Editor';
  }
}
