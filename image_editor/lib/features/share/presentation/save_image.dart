import 'dart:io';
import 'package:flutter/material.dart';

import '../functions/save_image.dart';
import '../functions/share_image.dart';
import '../widgets/button_save.dart';
import '../widgets/button_share.dart';
import '../widgets/show_image.dart';
import '../widgets/background.dart';

class SaveImage extends StatefulWidget {
  final List arguments;
  const SaveImage({super.key, required this.arguments});

  @override
  State<SaveImage> createState() => _SaveImageState();
}

class _SaveImageState extends State<SaveImage> {
  late File image;
  @override
  void initState() {
    super.initState();
    image = widget.arguments[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // para remover o botão de voltar, basta usar o 'false'
          // automaticallyImplyLeading: false,
          
          title: const Text("Share and Save"),
          centerTitle: true,
          backgroundColor: Colors.green.shade500,
          actions: <Widget>[
            // botão que levará para a pagina de configuração
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ]),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          const Background(),
          ShowImage(imageFile: image),
        ], // bottomNavigationBar: ,
      ),
      bottomNavigationBar: Container(
        color: Colors.green.shade500,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SaveButton(callbackFunction: () => saveImage(context, image)),
            ShareButton(callbackFunction: () => shareImage(image)),
          ],
        ),
      ),
    );
  }
}
