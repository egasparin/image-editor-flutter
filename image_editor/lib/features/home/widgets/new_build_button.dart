import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../functions/load_image.dart';
import '../functions/select_source.dart';
import 'content_button.dart';
import '../functions/select_icon.dart';
import '../functions/select_text.dart';

/// Quando uso o stateless, algumas vezes ocorre
/// uma falha no carregamento, aparecendo uma tela nao
/// renderizada por alguns milesimos de segundo, porem
/// perceptivel ao usuario
/// Desta forma, não farei uso dessa.

class NewBuildButton extends StatelessWidget {
  final ImageSource sourceImage;

  const NewBuildButton({super.key, required this.sourceImage});

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
            textOfButton: selectText(sourceImage),
            iconOfButton: selectIcon(sourceImage),
          ),
          onPressed: () async {
            await loadImage(selectSource(sourceImage), context);
          }),
    );
  }
}

/// Comentarios sobre o carregamento da imagem
/// pegar a imagem da galeria
/// loadImage(ImageSource.gallery);
/// pegar a imagem da camera do celular
/// loadImage(ImageSource.camera);
