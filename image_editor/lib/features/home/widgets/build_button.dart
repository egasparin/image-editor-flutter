import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../functions/select_source.dart';
import 'content_button.dart';
import '../../edit/presentation/edit_page.dart';
import '../functions/select_icon.dart';
import '../functions/select_text.dart';

/// tem que ver como construir e fazer  construcao do botao separado
/// para cada funcionalidade: galeria e camara : Feito

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
    return Container(
        // formatação e estilo do botão
        height: 0.15 * MediaQuery.of(context).size.height,
        width: 0.9 * MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.4),
          border: Border.all(
            color: Colors.green,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        // conteudo e ação do botão
        child: IconButton(
          icon: ContentButton(
            textOfButton: selectText(widget.sourceImage),
            iconOfButton: selectIcon(widget.sourceImage),
          ),
          onPressed: () {
            loadImage(selectSource(widget.sourceImage));
            // pega a imagem da galeria
            // loadImage(ImageSource.gallery);
            // pega a imagem da camera do celular
            // loadImage(ImageSource.camera);
          },
        ));
  }

  Future loadImage(ImageSource sourceImage) async {
    final file = await picker.pickImage(source: sourceImage);

    if (file != null) {
      setState(() {
        _image = File(file.path);
      });

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
