import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controller/aspect_ratio_controller.dart';
import '../controller/editor_key_controller.dart';
import '../controller/page_index_controller.dart';
import '../controller/adjust_controller.dart';

import 'build_crop.dart';
import 'build_positions.dart';
import 'build_adjusts.dart';

class PageOptions extends StatelessWidget {
  final PageIndexController pageIndexController;
  final AspectRatioController aspectRatioController;
  final EditorKeyController editorKeyController;
  final AdjustController saturationController;
  final AdjustController brightnessController;
  final AdjustController contrastController;

  const PageOptions({
    super.key,
    required this.saturationController,
    required this.brightnessController,
    required this.contrastController,
    required this.aspectRatioController,
    required this.editorKeyController,
    required this.pageIndexController,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      pageIndexController.value;
      return Column(
        // alinha todas as linhas ao fundo da coluna
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Visibility(
            visible: pageIndexController.equalTo(0),
            child: BuildAdjusts(
              saturationController: saturationController,
              brightnessController: brightnessController,
              contrastController: contrastController,
            ),
          ),
          Visibility(
            visible: pageIndexController.equalTo(1),
            child: BuildCropOptions(
              aspectRatioController: aspectRatioController,
            ),
          ),
          Visibility(
            visible: pageIndexController.equalTo(2),
            child: BuildPositions(
              editorKeyController: editorKeyController,
            ),
          )
        ],
      );
    });
  }
}
