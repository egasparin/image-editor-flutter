import 'dart:io';
import 'package:image_picker/image_picker.dart';

// ver como fazer essa função carregar a imagem e retornar ela
// tambem tem que verificar como fazer pra navegar pra outra pagina

Future loadImage(ImageSource sourceImage, File image) async {
  final picker = ImagePicker();

  final file = await picker.pickImage(source: sourceImage);

  if (file != null) {
    setState(() {
      image = File(file.path);
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
