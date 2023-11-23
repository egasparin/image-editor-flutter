import 'package:flutter/material.dart';

class ContentButton extends StatelessWidget {
  final String textOfButton;
  final IconData iconOfButton;

  const ContentButton({
    super.key,
    required this.textOfButton,
    required this.iconOfButton,
  });

  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconOfButton,
          size: 40,
          color: Colors.white,
          weight: 40,
        ),
        const SizedBox(width: 20),
        Text(
          textAlign: TextAlign.center,
          textOfButton,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
