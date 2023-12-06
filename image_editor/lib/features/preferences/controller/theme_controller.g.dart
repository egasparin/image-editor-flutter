// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeStore on ThemeStoreBase, Store {
  late final _$currentThemeAtom =
      Atom(name: 'ThemeStoreBase.currentTheme', context: context);

  @override
  ThemeData get currentTheme {
    _$currentThemeAtom.reportRead();
    return super.currentTheme;
  }

  @override
  set currentTheme(ThemeData value) {
    _$currentThemeAtom.reportWrite(value, super.currentTheme, () {
      super.currentTheme = value;
    });
  }

  late final _$ThemeStoreBaseActionController =
      ActionController(name: 'ThemeStoreBase', context: context);

  @override
  void changeTheme() {
    final _$actionInfo = _$ThemeStoreBaseActionController.startAction(
        name: 'ThemeStoreBase.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$ThemeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTheme: ${currentTheme}
    ''';
  }
}
