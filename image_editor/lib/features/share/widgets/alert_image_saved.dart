import 'dart:io';

import 'package:flutter/material.dart';

class AlertImageSaved extends StatelessWidget {
  final File image;

  const AlertImageSaved({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Imagem salva com sucesso!'),
        content: Image.file(image),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o diálogo
            },
            child: const Text('Fechar'),
          ),
        ]);
  }
}
