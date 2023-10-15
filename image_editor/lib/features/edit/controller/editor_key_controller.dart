// construir a classe abstrata com os atributos e metodos
// combinar a classe com a classe store
// combinar a classe criada com a gerada pelo mobx em uma
// nova classe

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'editor_key_controller.g.dart';

class EditorKeyController = EditorKeyControllerBase with _$EditorKeyController;

abstract class EditorKeyControllerBase with Store {
  @observable
  GlobalKey<ExtendedImageEditorState> editorKey =
      GlobalKey<ExtendedImageEditorState>();

  @action
  build(BuildContext context) {
    editorKey.currentState?.build(context);
  }

  @action
  getCrop() {
    editorKey.currentState?.getCropRect;
  }

  @action
  flip() {
    editorKey.currentState?.flip();
  }

  @action
  rotateLeft() {
    editorKey.currentState?.rotate(right: false);
  }

  @action
  rotateRight() {
    editorKey.currentState?.rotate(right: true);
  }

  @action
  reset() {
    editorKey.currentState?.reset();
  }
}
