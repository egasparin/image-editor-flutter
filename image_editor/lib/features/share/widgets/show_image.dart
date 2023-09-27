import 'dart:io';
import 'package:flutter/material.dart';

class ShowImage extends StatefulWidget {
  final File imageFile;
  const ShowImage({super.key, required this.imageFile});

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Exibe a imagem em um widget Image
        Image.file(widget.imageFile),
      ],
    );
  }
}
