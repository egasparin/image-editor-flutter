import 'package:flutter/material.dart';
import '../controller/aspect_ratio_controller.dart';

class BuildCropOptions extends StatelessWidget {
  final AspectRatioController aspectRatioController;

  const BuildCropOptions({
    super.key,
    required this.aspectRatioController,
  });

  @override
  Widget build(BuildContext context) {
    // tem que ver pra adicionar um widget, pois atualmente nao tenho
    // nenhum valor definido para tamanho, apenas o livre
    return Container(
        color: Colors.green.shade50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                icon: const Icon(Icons.crop_free_outlined),
                onPressed: () {
                  aspectRatioController.setValue(0.0);
                  print('free: ${aspectRatioController.value}');
                }),
            IconButton(
                icon: const Icon(Icons.crop_din_outlined),
                onPressed: () {
                  aspectRatioController.setValue(1.0);
                  print('1:1: ${aspectRatioController.value}');
                }),
            IconButton(
                icon: const Icon(Icons.crop_portrait_outlined),
                onPressed: () {
                  aspectRatioController.setValue(3.0 / 4.0);
                  print('3:4: ${aspectRatioController.value}');
                })
          ],
        ));
  }
}
