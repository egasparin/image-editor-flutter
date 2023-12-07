import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final void Function() callbackFunction;

  const SaveButton({
    super.key,
    required this.callbackFunction,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
          foregroundColor: Colors.white),
      icon: const Icon(Icons.save),
      label: const Text('Salvar'),
      onPressed: () {
        callbackFunction();
      },
    );
  }
}
