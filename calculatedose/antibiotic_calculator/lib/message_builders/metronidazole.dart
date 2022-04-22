import 'package:flutter/material.dart';

import '../main.dart';

class Metronidazole extends StatelessWidget {
  final int weight;
  const Metronidazole({Key? key, required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrugOutput(
            name: "Metronidazole 40mg/mL",
            administration:
                "With food every 8 hours for 7-10 days (Max. 800mg).",
            concentration: 40,
            standard: 15,
            range: 0,
            severe: 0,
            weight: weight),
      ],
    );
  }
}
