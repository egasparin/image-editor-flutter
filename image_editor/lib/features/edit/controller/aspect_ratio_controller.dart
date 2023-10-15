import 'package:mobx/mobx.dart';
part 'aspect_ratio_controller.g.dart';

class AspectRatioController = AspectRatioControllerBase
    with _$AspectRatioController;

abstract class AspectRatioControllerBase with Store {
  @observable
  double value = 1.0;

  @action
  setValue(double newValue) {
    value = newValue;
  }

  @action
  reset() {
    value = 1.0;
  }
}
