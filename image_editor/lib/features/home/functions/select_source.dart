import 'package:image_picker/image_picker.dart';

ImageSource selectSource(ImageSource sourceImage) {
  if (sourceImage == ImageSource.camera) {
    return ImageSource.camera;
  }
  return ImageSource.gallery;
}
