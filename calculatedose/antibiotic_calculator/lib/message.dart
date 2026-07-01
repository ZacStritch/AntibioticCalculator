import 'package:flutter/material.dart';

import 'default_message.dart';
import 'dose.dart';

class Message extends StatelessWidget {
  final String medication;
  final int input;
  final bool shouldCalculate;

  const Message({
    Key? key,
    required this.medication,
    required this.input,
    required this.shouldCalculate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!shouldCalculate || medication.isEmpty || input == 0) {
      return const DefaultMessage();
    }

    if (input >= 200) {
      return const Text(
        'Input weight too high.',
        style: TextStyle(color: Colors.red, fontSize: 18),
        textAlign: TextAlign.left,
      );
    }

    return dose(medication, input);
  }
}
