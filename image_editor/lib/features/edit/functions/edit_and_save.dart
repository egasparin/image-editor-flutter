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
  final ExtendedImageEditorState? state =
      editorKeyController.editorKey.currentState;
  final EditActionDetails? action = state!.editAction;

  // define uma imagem com base no existente no state
  final Uint8List editedImage = state.rawImageData;
  final ImageEditorOption option = ImageEditorOption();

  // captura as operações de crop, rotação e espelhamento realizadas na imagem
  final Rect? rectCrop = state.getCropRect();
  final double? radianRotate = action?.rotateAngle;
  final bool flipHorizontal = action!.flipY;
  final bool flipVertical = action.flipX;

  // aplica as operações de corte, espelhamento, rotação e ajuste de cores
  option.addOption(ClipOption.fromRect(rectCrop!));
  option.addOption(
      FlipOption(horizontal: flipHorizontal, vertical: flipVertical));
  option.addOption(RotateOption(radianRotate!.toInt()));
  option.addOption(ColorOption.saturation(saturationController.value));
  option.addOption(ColorOption.brightness(brightnessController.value));
  option.addOption(ColorOption.contrast(contrastController.value));

  // definindo o formato de saída da imagem com a mesma qualidade de entrada
  option.outputFormat = const OutputFormat.jpeg(100);

  // aplicando a edição com base nas optios coletadas
  final finalImage = await ImageEditor.editImage(
    image: editedImage,
    imageEditorOption: option,
  );
  image.writeAsBytesSync(finalImage!);

  // enviando a imagem para a tela de salvamento/compartilhamento
  WidgetsBinding.instance.addPostFrameCallback(
    (value) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SaveImage(
                image: image,
              )),
    ),
  );
}
