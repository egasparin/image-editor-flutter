import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../functions/load_image.dart';
import '../functions/select_source.dart';
import 'content_button.dart';
import '../functions/select_icon.dart';
import '../functions/select_text.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      // formatação e estilo do botão
      height: 0.15 * MediaQuery.of(context).size.height,
      width: 0.9 * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.7),
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
          onPressed: () async {
            await loadImage(selectSource(widget.sourceImage), context);
          }),
    );
  }
}

/// Comentarios sobre o carregamento da imagem
/// pegar a imagem da galeria
/// loadImage(ImageSource.gallery);
/// pegar a imagem da camera do celular
/// loadImage(ImageSource.camera);
