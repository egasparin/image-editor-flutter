import 'package:flutter/material.dart';
import 'gallery_button.dart';
import 'camera_button.dart';
// import 'central_button.dart';

// tem que refatorar a pagina e os botões
// colocar todos herdando de uma classe apenas
// usar mobx para controle do estado da imagem?

class SelectImage extends StatelessWidget {
  const SelectImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 0.15 * MediaQuery.of(context).size.height,
            width: 0.9 * MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.4),
              border: Border.all(
                color: Colors.green,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            // child: const CentralButton());
            child: const GalleryButton()),
        Container(
            height: 0.15 * MediaQuery.of(context).size.height,
            width: 0.9 * MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.4),
              border: Border.all(
                color: Colors.green,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            // child: const CentralButton());
            child: const CameraButton()),
      ],
    );
  }
}
