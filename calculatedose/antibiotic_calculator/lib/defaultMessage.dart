import 'package:flutter/material.dart';

class DefaultMessage extends StatelessWidget {
  const DefaultMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Input a medication & weight.",
        style: TextStyle(color: Colors.grey, fontSize: 18),
        textAlign: TextAlign.left);
  }
}
