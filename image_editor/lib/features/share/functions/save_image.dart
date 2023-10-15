import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:simple_image_editor/features/share/widgets/alert_image_saved.dart';

Future<void> saveImage(BuildContext context, File image) async {
  // salva a imagem na galeria, e por meio do then
  // passa o contexto correto para o construtor do
  // AlertDialog retornar para a pagina correta.
  await ImageGallerySaver.saveFile(image.path).then((result) {
    if (result != null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertImageSaved(image: image);
          });
    }
  });
}
