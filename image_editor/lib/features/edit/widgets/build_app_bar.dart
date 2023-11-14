import 'dart:io';

import 'package:flutter/material.dart';
import 'package:simple_image_editor/features/edit/controller/editor_key_controller.dart';
import 'package:simple_image_editor/features/edit/functions/edit_and_save.dart';

import '../controller/adjust_controller.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AdjustController saturationController;
  final AdjustController brightnessController;
  final AdjustController contrastController;
  final EditorKeyController editorKeyController;
  final File image;

  const BuildAppBar({
    super.key,
    required this.saturationController,
    required this.brightnessController,
    required this.contrastController,
    required this.editorKeyController,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Edition"),
      centerTitle: true,
      backgroundColor: Colors.green.shade500,
      actions: <Widget>[
        // tem que ver se precisa o botão de retorno Navigator pop
        // criar o botão que volta aos valores originais
        IconButton(
          icon: const Icon(Icons.settings_backup_restore),
          // na funcao onpressed deve-se restaurar a imagem original
          onPressed: () {
            editorKeyController.reset();
            contrastController.reset();
            brightnessController.reset();
            saturationController.reset();
          },
        ),
        // esse botão deve enviar para a proxima pagina, salvando as mudancas na foto
        IconButton(
          icon: const Icon(Icons.check_outlined),
          // na funcao onpressed deve-se ir para a proxima janela (compartilhamento)
          onPressed: () => editAndSave(
            image,
            saturationController,
            brightnessController,
            contrastController,
            editorKeyController,
            context,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
