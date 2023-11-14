import 'dart:io';

import 'package:flutter/material.dart';
import 'package:simple_image_editor/features/edit/widgets/build_app_bar.dart';
import 'package:simple_image_editor/features/edit/widgets/build_image.dart';
import '../widgets/build_botton_navigation_bar.dart';

import '../controller/adjust_controller.dart';
import '../controller/aspect_ratio_controller.dart';
import '../controller/editor_key_controller.dart';
import '../controller/page_index_controller.dart';
import '../widgets/build_page_options.dart';

// TO-DO: Alterar de stateful para stateless

class NewEditPage extends StatefulWidget {
  final List arguments;
  const NewEditPage({super.key, required this.arguments});

  @override
  State<NewEditPage> createState() => _NewEditPageState();
}

class _NewEditPageState extends State<NewEditPage> {
  late File image;
  @override
  void initState() {
    super.initState();
    image = widget.arguments[0];
  }

  // declaração de todos os controladores utilizados
  PageIndexController pageIndexController = PageIndexController();
  AspectRatioController aspectRatioController = AspectRatioController();
  EditorKeyController editorKeyController = EditorKeyController();
  AdjustController saturationController = AdjustController();
  AdjustController brightnessController = AdjustController();
  AdjustController contrastController = AdjustController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(),
      appBar: BuildAppBar(
        saturationController: saturationController,
        brightnessController: brightnessController,
        contrastController: contrastController,
        editorKeyController: editorKeyController,
        image: image,
      ),

      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              // child: buildImage(),
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
