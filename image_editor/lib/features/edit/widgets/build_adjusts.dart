import 'package:flutter/material.dart';
import 'build_slider.dart';
import '../controller/adjust_controller.dart';

class BuildAdjusts extends StatelessWidget {
  final AdjustController saturationController;
  final AdjustController brightnessController;
  final AdjustController contrastController;

  const BuildAdjusts({
    super.key,
    required this.saturationController,
    required this.brightnessController,
    required this.contrastController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green.shade50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BuildSlider(
                nameOfParameter: 'Saturação',
                adjustControlerParameter: saturationController),
            BuildSlider(
                nameOfParameter: 'Brilho',
                adjustControlerParameter: brightnessController),
            BuildSlider(
                nameOfParameter: 'Contraste',
                adjustControlerParameter: contrastController),
          ],
        ));
  }
}
