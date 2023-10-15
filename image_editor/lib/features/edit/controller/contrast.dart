// import 'package:mobx/mobx.dart';
// part 'contrast.g.dart';

// class Contrast = ContrastBase with _$Contrast;

// abstract class ContrastBase with Store {
//   @observable
//   double value = 1;

//   @action
//   setValue(newValue) {
//     // como defini o intervalo entre -1 e 1
//     // tem que somar um no valor do slider para
//     // obter o valor correto do parametro
//     value = newValue + 1;
//   }

//   @action
//   reset() {
//     value = 1;
//   }

//   @computed
//   // como defini o intervalo entre -1 e 1
//   // tem que subtrair um no valor do parametro
//   // para exibir o valor correto no slider
//   String get viewValue => (value - 1).toStringAsFixed(2);
// }
