import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../edit/presentation/edit_page.dart';

class GalleryButton extends StatefulWidget {
  const GalleryButton({super.key});

  @override
  State<GalleryButton> createState() => _GalleryButtonState();
}

class _GalleryButtonState extends State<GalleryButton> {
  File? _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.image_search,
            size: 40,
            color: Colors.white,
            weight: 40,
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Text(
            textAlign: TextAlign.center,
            'Selecione uma imagem',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
      onPressed: () {
        // pega a imagem da galeria
        loadImage(ImageSource.gallery);
        // pega a imagem da camera do celular
        // loadImage(ImageSource.camera);
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
