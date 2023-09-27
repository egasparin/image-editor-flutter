import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // colocar aqui a funcao para salvar na galeria
      },
      child: const Row(children: [
        Icon(Icons.save),
        SizedBox(
          width: 15,
        ),
        Text('Save'),
      ]),
    );
  }
}
