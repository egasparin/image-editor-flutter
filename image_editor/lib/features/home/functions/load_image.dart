import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../edit/presentation/edit_page.dart';

// ver como fazer essa função carregar a imagem e retornar ela
// tambem tem que verificar como fazer pra navegar pra outra pagina

Future loadImage(ImageSource sourceImage, context) async {
  final picker = ImagePicker();
  final file = await picker.pickImage(source: sourceImage);
  File image;

  if (file != null) {
    image = File(file.path);

    Navigator.push(
      context,
      MaterialPageRoute(
        // tem que implementar a nova pagina para envio do contexto
        builder: (context) => EditPage(
          arguments: [image],
        ),
      ),
    );
  }
}
