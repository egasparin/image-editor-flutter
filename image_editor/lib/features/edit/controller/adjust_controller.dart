import 'package:mobx/mobx.dart';
part 'adjust_controller.g.dart';

// ao inves de ter uma classe para cada parametro
// posso utilizar somente esta, criando uma instancia
// para cada parametro (brilho, saturação e contrast),
// visto que consegui sintetizar uma única lógica de negócio

class AdjustController = AdjustControllerBase with _$AdjustController;

abstract class AdjustControllerBase with Store {
  @observable
  double value = 1;

  // como defini o intervalo entre -1 e 1
  // tem que somar um no valor do slider para
  // obter o valor correto do parametro
  @action
  setValue(double newValue) {
    value = newValue + 1;
  }

  // quando usa o botão de reset, deve-se retornar ao
  // valor inicial do parametro de ajuste (1)
  @action
  reset() {
    value = 1;
  }

  // como defini o intervalo entre -1 e 1
  // tem que subtrair um no valor do parametro
  // para exibir o valor correto no slider
  // tanto como string no label, quanto o double
  @computed
  String get viewStringValue => (value - 1).toStringAsFixed(2);

  @computed
  double get viewDoubleValue => (value - 1);
}
