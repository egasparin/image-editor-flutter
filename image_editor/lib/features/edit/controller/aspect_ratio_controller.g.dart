// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aspect_ratio_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AspectRatioController on AspectRatioControllerBase, Store {
  late final _$valueAtom =
      Atom(name: 'AspectRatioControllerBase.value', context: context);

  @override
  double get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(double value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$AspectRatioControllerBaseActionController =
      ActionController(name: 'AspectRatioControllerBase', context: context);

  @override
  dynamic setValue(dynamic newValue) {
    final _$actionInfo = _$AspectRatioControllerBaseActionController
        .startAction(name: 'AspectRatioControllerBase.setValue');
    try {
      return super.setValue(newValue);
    } finally {
      _$AspectRatioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reset() {
    final _$actionInfo = _$AspectRatioControllerBaseActionController
        .startAction(name: 'AspectRatioControllerBase.reset');
    try {
      return super.reset();
    } finally {
      _$AspectRatioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}