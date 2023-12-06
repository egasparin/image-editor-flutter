// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_index_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PageIndexController on PageIndexControllerBase, Store {
  late final _$valueAtom =
      Atom(name: 'PageIndexControllerBase.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$PageIndexControllerBaseActionController =
      ActionController(name: 'PageIndexControllerBase', context: context);

  @override
  dynamic setValue(int newValue) {
    final _$actionInfo = _$PageIndexControllerBaseActionController.startAction(
        name: 'PageIndexControllerBase.setValue');
    try {
      return super.setValue(newValue);
    } finally {
      _$PageIndexControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic equalTo(int anyIntValue) {
    final _$actionInfo = _$PageIndexControllerBaseActionController.startAction(
        name: 'PageIndexControllerBase.equalTo');
    try {
      return super.equalTo(anyIntValue);
    } finally {
      _$PageIndexControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
