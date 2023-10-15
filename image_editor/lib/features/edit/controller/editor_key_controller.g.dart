// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editor_key_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditorKeyController on EditorKeyControllerBase, Store {
  late final _$editorKeyAtom =
      Atom(name: 'EditorKeyControllerBase.editorKey', context: context);

  @override
  GlobalKey<ExtendedImageEditorState> get editorKey {
    _$editorKeyAtom.reportRead();
    return super.editorKey;
  }

  @override
  set editorKey(GlobalKey<ExtendedImageEditorState> value) {
    _$editorKeyAtom.reportWrite(value, super.editorKey, () {
      super.editorKey = value;
    });
  }

  late final _$EditorKeyControllerBaseActionController =
      ActionController(name: 'EditorKeyControllerBase', context: context);

  @override
  dynamic build(BuildContext context) {
    final _$actionInfo = _$EditorKeyControllerBaseActionController.startAction(
        name: 'EditorKeyControllerBase.build');
    try {
      return super.build(context);
    } finally {
      _$EditorKeyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getCrop() {
    final _$actionInfo = _$EditorKeyControllerBaseActionController.startAction(
        name: 'EditorKeyControllerBase.getCrop');
    try {
      return super.getCrop();
    } finally {
      _$EditorKeyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic flip() {
    final _$actionInfo = _$EditorKeyControllerBaseActionController.startAction(
        name: 'EditorKeyControllerBase.flip');
    try {
      return super.flip();
    } finally {
      _$EditorKeyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic rotateLeft() {
    final _$actionInfo = _$EditorKeyControllerBaseActionController.startAction(
        name: 'EditorKeyControllerBase.rotateLeft');
    try {
      return super.rotateLeft();
    } finally {
      _$EditorKeyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic rotateRight() {
    final _$actionInfo = _$EditorKeyControllerBaseActionController.startAction(
        name: 'EditorKeyControllerBase.rotateRight');
    try {
      return super.rotateRight();
    } finally {
      _$EditorKeyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reset() {
    final _$actionInfo = _$EditorKeyControllerBaseActionController.startAction(
        name: 'EditorKeyControllerBase.reset');
    try {
      return super.reset();
    } finally {
      _$EditorKeyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
editorKey: ${editorKey}
    ''';
  }
}
