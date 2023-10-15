import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  final void Function() callbackFunction;

  const ShareButton({
    super.key,
    required this.callbackFunction,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(foregroundColor: Colors.white),
      icon: const Icon(Icons.share),
      label: const Text('Compartilhar'),
      onPressed: () {
        callbackFunction();
      },
    );
  }
}
