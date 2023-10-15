import 'package:mobx/mobx.dart';
part 'page_index_controller.g.dart';

class PageIndexController = PageIndexControllerBase with _$PageIndexController;

abstract class PageIndexControllerBase with Store {
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
