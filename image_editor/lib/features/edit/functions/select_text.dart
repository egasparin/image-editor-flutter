
String selectText(String nameOfParameter) {
  if (nameOfParameter == 'Saturation' || nameOfParameter == 'Saturação') {
    return 'Saturação';
  }
  if (nameOfParameter == 'Contrast' || nameOfParameter == 'Contraste') {
    return 'Contraste';
  }
  if (nameOfParameter == 'Brightness' || nameOfParameter == 'Brilho') {
    return 'Brilho';
  }
  return nameOfParameter.toString();
}
