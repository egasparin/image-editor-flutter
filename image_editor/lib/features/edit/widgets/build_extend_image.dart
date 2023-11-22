import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../controller/aspect_ratio_controller.dart';
import '../controller/editor_key_controller.dart';
import '../controller/page_index_controller.dart';

class ExtendImage extends StatelessWidget {
  final BuildContext context;
  final File image;
  final EditorKeyController editorKeyController;
  final AspectRatioController aspectRatioController;
  final PageIndexController pageIndexController;

  const ExtendImage({
    super.key,
    required this.context,
    required this.image,
    required this.editorKeyController,
    required this.aspectRatioController,
    required this.pageIndexController,
  });

  @override
  Widget build(BuildContext context) {
    return ExtendedImage(
        // controle do tamanho da imagem
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.contain,
        // controla a rotacao da imagem
        extendedImageEditorKey: editorKeyController.editorKey,
        image: ExtendedFileImageProvider(
          image, // Habilita o cache da imagem
          cacheRawData: true,
        ),
        mode: pageIndexController.equalTo(5)
            ? ExtendedImageMode.none
            : ExtendedImageMode.editor,
        initEditorConfigHandler: (ExtendedImageState? state) {
          return EditorConfig(
            maxScale: 8.0,
            cropRectPadding: const EdgeInsets.all(20.0),
            hitTestSize: 20.0,
            cropAspectRatio: aspectRatioController.value,
          );
        });
  }
}
