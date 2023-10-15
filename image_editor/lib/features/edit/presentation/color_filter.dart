// Esse filtro foi construido com base na resposta de BananaNeil, 
// no forum Stackoverflow (https://stackoverflow.com/questions/64639589/how-to-adjust-hue-saturation-and-brightness-of-an-image-or-widget-in-flutter)

class ColorFilterGenerator {

  static List<double> identityMatrix =  [
                                          1,0,0,0,0,
                                          0,1,0,0,0,
                                          0,0,1,0,0,
                                          0,0,0,1,0,
                                        ]; 

  static List<double> brightnessAdjustMatrix({required double brightness}) {

    return List<double>.from(<double>[
      1, 0, 0, 0, brightness,
      0, 1, 0, 0, brightness, 
      0, 0, 1, 0, brightness, 
      0, 0, 0, 1, 0
    ]).map((i) => i.toDouble()).toList();
  }

  static List<double> contrastAdjustMatrix({required double contrast}) {
    final double adjustContrast = (1 - contrast) * 127.5;

    return List<double>.from(<double>[
      contrast, 0, 0, 0, adjustContrast,
      0, contrast, 0, 0, adjustContrast, 
      0, 0, contrast, 0, adjustContrast, 
      0, 0, 0, 1, 0
    ]).map((i) => i.toDouble()).toList();
  }

  static List<double> saturationAdjustMatrix({required double saturation}) {

    final invertSaturation = 1-saturation;
    final R = 0.213 * invertSaturation;
    final G = 0.715 * invertSaturation;
    final B = 0.072 * invertSaturation;

    return List<double>.from(<double>[
      R + saturation, G, B, 0, 0,
      R, G + saturation, B, 0, 0,
      R, G, B + saturation, 0, 0,
      0, 0, 0, 1, 0,
    ]).map((i) => i.toDouble()).toList();
  }

}