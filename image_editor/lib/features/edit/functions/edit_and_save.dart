import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:image_editor/image_editor.dart';

import '../../share/presentation/save_image.dart';
import '../controller/adjust_controller.dart';
import '../controller/editor_key_controller.dart';

Future<void> editAndSave(
  File image,
  AdjustController saturationController,
  AdjustController brightnessController,
  AdjustController contrastController,
  EditorKeyController editorKeyController,
  BuildContext context,
) async {
  // captura todas as operações realizadas na imagem por meio do metodo state
  final EditActionDetails? action =
      editorKeyController.editorKey.currentState!.editAction;
  final Rect? rectCrop =
      editorKeyController.editorKey.currentState!.getCropRect();
  final Uint8List editedImage =
      editorKeyController.editorKey.currentState!.rawImageData;

  // cria a lista de opções a serem passadas ao editor
  final ImageEditorOption option = ImageEditorOption()
    ..addOption(ColorOption.saturation(saturationController.value))
    ..addOption(ColorOption.brightness(brightnessController.value))
    ..addOption(ColorOption.contrast(contrastController.value))
    ..addOption(ClipOption.fromRect(rectCrop!))
    ..addOption(RotateOption(action!.rotateAngle.toInt()))
    ..addOption(FlipOption(horizontal: action.flipX, vertical: action.flipY))
    ..outputFormat = const OutputFormat.jpeg(100);

  // aplicando a edição com base nas optios e operações coletadas
  final finalImage = await ImageEditor.editImage(
    image: editedImage,
    imageEditorOption: option,
  );
  image.writeAsBytesSync(finalImage!);

  // enviando a imagem para a tela de salvamento/compartilhamento
  if (context.mounted) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SaveImage(
                image: image,
              )),
    );
  }
}
