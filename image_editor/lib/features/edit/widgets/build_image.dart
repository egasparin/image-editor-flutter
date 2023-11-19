import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controller/aspect_ratio_controller.dart';
import '../controller/page_index_controller.dart';
import '../controller/adjust_controller.dart';
import '../controller/editor_key_controller.dart';
import '../presentation/color_filter.dart';

/* 
  Nao adianta tentar aplicar alterações via multiplicação de matriz
  pois ao fazer isso, todos os parametros sao alterados, o que afeta
  a apresentacao. Neste caso a ordem importa para aplicação dos 
  parametros. Deve-se atentar tambem ao mobx, e lembrar que ele somente
  controla as variaveis declaradas em seu contexto
*/

class BuildImage extends StatelessWidget {
  final File image;
  final AdjustController saturationController;
  final AdjustController brightnessController;
  final AdjustController contrastController;
  final EditorKeyController editorKeyController;
  final AspectRatioController aspectRatioController;
  final PageIndexController pageIndexController;

  const BuildImage({
    super.key,
    required this.image,
    required this.saturationController,
    required this.brightnessController,
    required this.contrastController,
    required this.editorKeyController,
    required this.aspectRatioController,
    required this.pageIndexController,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      // variaveis observadas pelo observer
      // tem que ser declarada aqui pois somente é acessada
      // fora do contexto deste widget
      aspectRatioController.value;

      return ColorFiltered(
          // aplica o filtro de ajuste de brilho (tem que ajustar)
          colorFilter: ColorFilter.matrix(
              ColorFilterGenerator.brightnessAdjustMatrix(
                  brightness: brightnessController.value)),
          child: ColorFiltered(
            colorFilter: ColorFilter.matrix(
                ColorFilterGenerator.contrastAdjustMatrix(
                    contrast: contrastController.value)),
            // aplica o filtro de ajuste de saturação
            child: ColorFiltered(
                colorFilter: ColorFilter.matrix(
                    ColorFilterGenerator.saturationAdjustMatrix(
                        saturation: saturationController.value)),
                // gera a imagem na tela do aplicativo
                child: ExtendedImage(
                    image: ExtendedFileImageProvider(
                      image, // Habilita o cache da imagem
                      cacheRawData: true,
                    ),
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    extendedImageEditorKey: editorKeyController.editorKey,
                    mode: pageIndexController.equalTo(0)
                        ? ExtendedImageMode.none
                        : ExtendedImageMode.editor,
                    fit: BoxFit.contain,
                    initEditorConfigHandler: (ExtendedImageState? state) {
                      return EditorConfig(
                        maxScale: 8.0,
                        cropRectPadding: const EdgeInsets.all(20.0),
                        hitTestSize: 20.0,
                        cropAspectRatio: aspectRatioController.value,
                      );
                    })),
          ));
    });
  }
}