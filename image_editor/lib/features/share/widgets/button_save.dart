import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final void Function() callbackFunction;

  const SaveButton({
    super.key,
    required this.callbackFunction,
  });

  /// TO-DO: tem que criar uma funcao que permita 
  /// criar um novo nome para a imagem antes de salvar
  /// deve ser preenchida com o nome correspondente ao
  /// nome-original-tempoDesde1974. O usuário pode renomear!

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
