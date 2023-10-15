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
                nameOfParameter: 'Saturation',
                adjustControlerParameter: saturationController),
            BuildSlider(
                nameOfParameter: 'Brightness',
                adjustControlerParameter: brightnessController),
            BuildSlider(
                nameOfParameter: 'Contrast',
                adjustControlerParameter: contrastController),
          ],
        ));
  }
}
