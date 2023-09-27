import 'package:crop_image/crop_image.dart';
import 'package:flutter/material.dart';

class RotatePage extends StatefulWidget {
  const RotatePage({Key? key}) : super(key: key);

  @override
  State<RotatePage> createState() => _RotatePageState();
}

class _RotatePageState extends State<RotatePage> {
  final controller = CropController();
  final image = Image.asset('./images/imagem.jpg');

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
        child: _buildBodyRotate(),
      ));

  Widget _buildBodyRotate() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: CropImage(
            controller: controller,
            image: Image.asset('./images/imagem.jpg'),
            paddingSize: 25.0,
            // desabilitando a cor do grid
            gridColor: Colors.transparent,
            scrimColor: Colors.grey.withOpacity(0),
          )),
          _buildRotateButtons(),
        ],
      );

  Widget _buildRotateButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.settings_backup_restore),
            onPressed: () {
              controller.rotation = CropRotation.up;
            },
          ),
          IconButton(
            icon: const Icon(Icons.rotate_90_degrees_ccw_outlined),
            onPressed: _rotateLeft,
          ),
          IconButton(
            icon: const Icon(Icons.rotate_90_degrees_cw_outlined),
            onPressed: _rotateRight,
          ),
          IconButton(
            icon: const Icon(Icons.check_outlined),
            onPressed: _finished,
          ),
        ],
      );

  Future<void> _rotateLeft() async => controller.rotateLeft();

  Future<void> _rotateRight() async => controller.rotateRight();

  Future<void> _finished() async {
    final image = await controller.croppedImage();
    // aqui tem que fazer apresenta a imagem editada
    // ignore: use_build_context_synchronously
    await showDialog<bool>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(6.0),
          titlePadding: const EdgeInsets.all(8.0),
          children: [
            const SizedBox(height: 5),
            image,
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
