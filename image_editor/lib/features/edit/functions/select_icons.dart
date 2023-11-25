import 'package:flutter/material.dart';

IconData selectIcons(String nameOfParameter) {
    if (nameOfParameter == 'Saturation' || nameOfParameter == 'Saturação') {
      return Icons.invert_colors;
    }
    if (nameOfParameter == 'Contrast' || nameOfParameter == 'Contraste') {
      return Icons.contrast_outlined;
    }
    if (nameOfParameter == 'Brightness' || nameOfParameter == 'Brilho') {
      return Icons.brightness_5_rounded;
    }
    return Icons.brush_rounded;
  }
