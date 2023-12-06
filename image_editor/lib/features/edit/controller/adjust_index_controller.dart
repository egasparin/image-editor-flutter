import 'package:mobx/mobx.dart';
part 'adjust_index_controller.g.dart';

class AdjustIndexController = AdjustIndexControllerBase
    with _$AdjustIndexController;

abstract class AdjustIndexControllerBase with Store {
  @observable
  int value = 0;

  @action
  setValue(int newValue) {
    value = newValue;
  }

  @action
  equalTo(int anyIntValue) {
    return (value == anyIntValue);
  }
}
