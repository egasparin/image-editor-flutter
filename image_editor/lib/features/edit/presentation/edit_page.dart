import 'dart:io';

import 'package:flutter/material.dart';

import '../widgets/build_app_bar.dart';
import '../widgets/build_image.dart';
import '../widgets/build_botton_navigation_bar.dart';
import '../controller/adjust_controller.dart';
import '../controller/aspect_ratio_controller.dart';
import '../controller/editor_key_controller.dart';
import '../controller/page_index_controller.dart';
import '../widgets/build_page_options.dart';

// TO-DO: Alterar de stateful para stateless

class EditPage extends StatelessWidget {
  final File image;

  EditPage({super.key, required this.image});

  // declaração de todos os controladores utilizados
  final PageIndexController pageIndexController = PageIndexController();
  final AspectRatioController aspectRatioController = AspectRatioController();
  final EditorKeyController editorKeyController = EditorKeyController();
  final AdjustController saturationController = AdjustController();
  final AdjustController brightnessController = AdjustController();
  final AdjustController contrastController = AdjustController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(
        saturationController: saturationController,
        brightnessController: brightnessController,
        contrastController: contrastController,
        editorKeyController: editorKeyController,
        aspectRatioController: aspectRatioController,
        image: image,
      ),

      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: BuildImage(
                  image: image,
                  saturationController: saturationController,
                  brightnessController: brightnessController,
                  contrastController: contrastController,
                  editorKeyController: editorKeyController,
                  aspectRatioController: aspectRatioController,
                  pageIndexController: pageIndexController),
            ),
            //colocar a barra de edicao de atributos ou posição
            PageOptions(
              saturationController: saturationController,
              brightnessController: brightnessController,
              contrastController: contrastController,
              aspectRatioController: aspectRatioController,
              editorKeyController: editorKeyController,
              pageIndexController: pageIndexController,
            )
          ]),
      bottomNavigationBar: BuildBottonNavigationBar(
        pageIndexController: pageIndexController,
      ), // bottomNavigationBar: ,
    );
  }
}
