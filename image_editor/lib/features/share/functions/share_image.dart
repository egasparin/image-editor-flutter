import 'dart:io';
import 'package:share_plus/share_plus.dart';

Future<void> shareImage(File image) async {
  // se a imagem existe ..
  if (await image.exists()) {
    // obtem o caminho da imagem editada
    final imagePath = image.path;

    // compartilha a imagem com o shareXfiles
    await Share.shareXFiles(
      [XFile(imagePath)],
      text: 'Compartilhando a imagem editada',
    );
  }
}
