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
                }),
            IconButton(
                icon: const Icon(Icons.crop_din_outlined),
                onPressed: () {
                  aspectRatioController.setValue(1.0);
                }),
            IconButton(
                icon: const Icon(Icons.crop_portrait_outlined),
                onPressed: () {
                  aspectRatioController.setValue(3.0 / 4.0);
                })
          ],
        ));
  }
}
