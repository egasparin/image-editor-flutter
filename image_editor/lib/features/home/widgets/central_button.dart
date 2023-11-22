import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../edit/presentation/edit_page.dart';

class CentralButton extends StatefulWidget {
  const CentralButton({super.key});

  @override
  State<CentralButton> createState() => _CentralButtonState();
}

class _CentralButtonState extends State<CentralButton> {
  File? _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_search,
            size: 100,
            color: Colors.white,
            weight: 100,
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Text(
            textAlign: TextAlign.center,
            'Selecione\numa imagem',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
      onPressed: () {
        // pega a imagem da galeria
        // loadImage(ImageSource.gallery);
        // pega a imagem da camera do celular
        loadImage(ImageSource.camera);
      },
    );
  }

  Future loadImage(ImageSource sourceImage) async {
    final file = await picker.pickImage(source: sourceImage);

    if (file != null) {
      setState(() {
        _image = File(file.path);
      });

      // Future.delayed(const Duration(seconds: 0)).then(

      WidgetsBinding.instance.addPostFrameCallback(
        (value) => Navigator.push(
          context,
          MaterialPageRoute(
            // tem que implementar a nova pagina para envio do contexto
            builder: (context) => EditPage(
              arguments: [_image],
            ),
          ),
        ),
      );
    }
  }
}
