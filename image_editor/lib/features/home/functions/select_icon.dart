import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

IconData selectIcon(ImageSource sourceImage) {
  if (sourceImage == ImageSource.camera) {
    return Icons.camera_alt_outlined;
  }
  return Icons.image_search;
}
