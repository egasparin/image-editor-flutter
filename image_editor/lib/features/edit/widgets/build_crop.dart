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
    return Container(
        color: Colors.green.shade50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: const Column(
                  children: [Icon(Icons.crop_free_outlined), Text('Livre')],
                ),
                onPressed: () => aspectRatioController.setValue(0.0)),
            TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: const Column(
                  children: [Icon(Icons.crop_portrait), Text('3:4')],
                ),
                onPressed: () => aspectRatioController.setValue(3.0 / 4.0)),
            TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: const Column(
                  children: [Icon(Icons.crop_din_outlined), Text('1:1')],
                ),
                onPressed: () => aspectRatioController.setValue(1.0)),
            //
            /// Opção sem o texto sob o botão
            /// a opção com o texto é mais intuitiva, de acorod com os testes
            // IconButton(
            //     icon: const Icon(Icons.crop_free_outlined),
            //     onPressed: () {
            //       aspectRatioController.setValue(0.0);
            //     }),
            // IconButton(
            //     icon: const Icon(Icons.crop_din_outlined),
            //     onPressed: () {
            //       aspectRatioController.setValue(1.0);
            //     }),
            // IconButton(
            //     icon: const Icon(Icons.crop_portrait_outlined),
            //     onPressed: () {
            //       aspectRatioController.setValue(3.0 / 4.0);
            //     })
          ],
        ));
  }
}
