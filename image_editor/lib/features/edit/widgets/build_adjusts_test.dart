import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:simple_image_editor/features/edit/controller/adjust_index_controller.dart';
import 'package:simple_image_editor/features/edit/controller/page_index_controller.dart';
import 'build_slider.dart';
import '../controller/adjust_controller.dart';

/* 
  realizei varios testes, mas a utilização e apresentação dos tres
  ajustes na pagina ao mesmo tempo, parece ser a forma mais adequada, 
  portanto, é preferivel deixar essa função sem uso
*/

// ignore: must_be_immutable
class BuildAdjustsTestes extends StatelessWidget {
  final AdjustController saturationController;
  final AdjustController brightnessController;
  final AdjustController contrastController;
  final PageIndexController pageIndexController;
  final AdjustIndexController adjustIndexController = AdjustIndexController();

  BuildAdjustsTestes({
    super.key,
    required this.saturationController,
    required this.brightnessController,
    required this.contrastController,
    required this.pageIndexController,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      adjustIndexController.value;
      pageIndexController.value;

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: !adjustIndexController.equalTo(0),
            child: Container(
              height: 50,
              color: Colors.green.shade50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // IconButton(
                  //     onPressed: () => adjustIndexController.setValue(0),
                  //     icon: Icon(Icons.crop_free_outlined)),
                  Visibility(
                    visible: adjustIndexController.equalTo(1),
                    child: BuildSlider(
                        nameOfParameter: 'Saturation',
                        adjustControlerParameter: saturationController),
                  ),
                  Visibility(
                    visible: adjustIndexController.equalTo(2),
                    child: BuildSlider(
                        nameOfParameter: 'Brightness',
                        adjustControlerParameter: brightnessController),
                  ),
                  Visibility(
                    visible: adjustIndexController.equalTo(3),
                    child: BuildSlider(
                        nameOfParameter: 'Contrast',
                        adjustControlerParameter: contrastController),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: adjustIndexController.equalTo(0),
            child: Container(
                height: 50,
                color: Colors.green.shade50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        child: const Icon(Icons.crop_free_outlined),
                        onTap: () {
                          adjustIndexController.setValue(1);
                        }),
                    GestureDetector(
                        child: const Icon(Icons.crop_din_outlined),
                        onTap: () {
                          adjustIndexController.setValue(2);
                        }),
                    GestureDetector(
                        child: const Icon(Icons.crop_portrait_outlined),
                        onTap: () {
                          adjustIndexController.setValue(3);
                        }),
                  ],
                )),
          ),
        ],
      );
    });
  }
}
