import 'dart:io';
import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {
  final File imageFile;
  const ShowImage({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Exibe a imagem
        SizedBox(
            width: 0.9 * MediaQuery.of(context).size.width,
            height: 0.7 * MediaQuery.of(context).size.height,
            child: Image.file(
              imageFile,
              fit: BoxFit.scaleDown,
            )),
      ],
    );
  }
}
