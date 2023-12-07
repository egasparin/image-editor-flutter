import 'package:flutter/material.dart';
import '../controller/editor_key_controller.dart';

class BuildPositions extends StatelessWidget {
  final EditorKeyController editorKeyController;

  const BuildPositions({
    super.key,
    required this.editorKeyController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            child: const Column(children: [Icon(Icons.flip), Text('Espelhar')]),
            onPressed: () => editorKeyController.flip(),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            child: const Column(children: [
              Icon(Icons.rotate_90_degrees_ccw_outlined),
              Text('Girar')
            ]),
            onPressed: () => editorKeyController.rotateRight(),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            child: const Column(children: [
              Icon(Icons.rotate_90_degrees_cw_outlined),
              Text('Girar')
            ]),
            onPressed: () => editorKeyController.rotateLeft(),
          ),

          /// sem o texto sob o icone
          // IconButton(
          //   icon: const Icon(Icons.flip),
          //   onPressed: () => editorKeyController.flip(),
          // ),
          // IconButton(
          //   icon: const Icon(Icons.rotate_90_degrees_ccw_outlined),
          //   onPressed: () => editorKeyController.rotateRight(),
          // ),
          // IconButton(
          //   icon: const Icon(Icons.rotate_90_degrees_cw_outlined),
          //   onPressed: () => editorKeyController.rotateLeft(),
          // ),
        ],
      ),
    );
  }
}
