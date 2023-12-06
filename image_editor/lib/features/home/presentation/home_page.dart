// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:simple_image_editor/features/preferences/controller/language_controller.dart';
import '../../preferences/controller/language_strings.dart';
import '../widgets/background.dart';
import '../widgets/select_image.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  LanguageStore languageStore = LanguageStore();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      languageStore.language;
      StringLanguage stringLanguage = StringLanguage(languageStore);

      return Scaffold(
        appBar: AppBar(
            title: Text(stringLanguage.title()),
            centerTitle: true,
            backgroundColor: Colors.green.shade500,
            actions: <Widget>[
              // botão que levará para a pagina de configuração
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  languageStore.changeLanguage();
                },
              ),
            ]),
        body: const Stack(alignment: Alignment.center, children: <Widget>[
          Background(),
          SelectImage(),
        ]), // bottomNavigationBar: ,
      );
    });
  }
}
