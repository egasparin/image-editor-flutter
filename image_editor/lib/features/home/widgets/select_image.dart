import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'build_button.dart';
// import 'central_button.dart';

// tem que refatorar a pagina e os botões
// colocar todos herdando de uma classe apenas
// usar mobx para controle do estado da imagem? Não é necessário

class SelectImage extends StatelessWidget {
  const SelectImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BuildButton(sourceImage: ImageSource.camera),
        SizedBox(height: 10),
        BuildButton(sourceImage: ImageSource.gallery),
      ],
    );
  }
}
