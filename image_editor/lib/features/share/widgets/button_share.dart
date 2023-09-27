import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          // colocar aqui a funcao para compartilhar
        },
        child: const Row(children: [
          Icon(Icons.share),
          SizedBox(
            width: 15,
          ),
          Text('Share')
        ]));
  }
}
