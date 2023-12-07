import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../edit/presentation/edit_page.dart';


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
          image: image,
        ),
      ),
    );
  }
}
