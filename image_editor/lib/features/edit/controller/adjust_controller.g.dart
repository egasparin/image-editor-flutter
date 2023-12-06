// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adjust_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdjustController on AdjustControllerBase, Store {
  Computed<String>? _$viewStringValueComputed;

  @override
  String get viewStringValue => (_$viewStringValueComputed ??= Computed<String>(
          () => super.viewStringValue,
          name: 'AdjustControllerBase.viewStringValue'))
      .value;
  Computed<double>? _$viewDoubleValueComputed;

  @override
  double get viewDoubleValue => (_$viewDoubleValueComputed ??= Computed<double>(
          () => super.viewDoubleValue,
          name: 'AdjustControllerBase.viewDoubleValue'))
      .value;

  late final _$valueAtom =
      Atom(name: 'AdjustControllerBase.value', context: context);

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

  late final _$AdjustControllerBaseActionController =
      ActionController(name: 'AdjustControllerBase', context: context);

  @override
  dynamic setValue(double newValue) {
    final _$actionInfo = _$AdjustControllerBaseActionController.startAction(
        name: 'AdjustControllerBase.setValue');
    try {
      return super.setValue(newValue);
    } finally {
      _$AdjustControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reset() {
    final _$actionInfo = _$AdjustControllerBaseActionController.startAction(
        name: 'AdjustControllerBase.reset');
    try {
      return super.reset();
    } finally {
      _$AdjustControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
viewStringValue: ${viewStringValue},
viewDoubleValue: ${viewDoubleValue}
    ''';
  }
}
