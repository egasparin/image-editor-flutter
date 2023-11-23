import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_image_editor/features/home/widgets/content_button.dart';
import '../../edit/presentation/edit_page.dart';

/// tem que ver como construir e fazer  construcao do botao separado
/// para cada funcionalidade: galeria e camara

class BuildButton extends StatefulWidget {
  final ImageSource sourceImage;

  const BuildButton({
    super.key,
    required this.sourceImage,
  });

  @override
  State<BuildButton> createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {
  File? _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const ContentButton(
          textOfButton: 'Tire uma foto',
          iconOfButton: Icons.camera_alt_outlined),
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
