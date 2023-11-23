import 'package:image_picker/image_picker.dart';

// funcao criada para garantir que o retorno esteja
// dentro das opções camera/gallery

String selectText(ImageSource sourceImage) {
  if (sourceImage == ImageSource.camera) {
    return 'Tire uma foto';
  }
  return 'Selecione na galeria';
}
