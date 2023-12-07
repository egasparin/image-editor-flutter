// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../widgets/background.dart';
import '../widgets/select_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Editor de Imagem'),
          centerTitle: true,
          backgroundColor: Colors.green.shade500,
        ),
        body: const Stack(alignment: Alignment.center, children: <Widget>[
          Background(),
          SelectImage(),
        ]), // bottomNavigationBar: ,
      );
    });
  }
}
