import 'dart:io';
import 'package:flutter/material.dart';
import 'package:simple_image_editor/features/share/widgets/button_share.dart';
import 'package:simple_image_editor/features/share/widgets/show_image.dart';
import '../widgets/background.dart';
import '../widgets/button_save.dart';

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
            Column(children: [
              ShowImage(imageFile: image),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShareButton(),
                  SaveButton(),
                ],
              )
            ]),
          ], // bottomNavigationBar: ,
        ));
  }
}
