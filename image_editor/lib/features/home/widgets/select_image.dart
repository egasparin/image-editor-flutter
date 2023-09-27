import 'package:flutter/material.dart';
import 'central_button.dart';

class SelectImage extends StatelessWidget {
  const SelectImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 0.4 * MediaQuery.of(context).size.height,
        width: 0.7 * MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.4),
          border: Border.all(
            color: Colors.green,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const CentralButton());
  }
}
