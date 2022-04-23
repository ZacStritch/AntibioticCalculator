import 'package:flutter/material.dart';

import 'package:antibiotic_calculator/final_message.dart';

class AmoxWithClav extends StatelessWidget {
  final int weight;
  const AmoxWithClav({Key? key, required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrugOutput(
            name: '''Amoxycillin/Clavulanic Acid 
25mg/mL''',
            administration: "With food every 8 hours (Max. 500mg).",
            concentration: 25,
            standard: 7.5,
            range: 15,
            severe: 20,
            weight: weight),
        const Divider(
          color: Colors.blue,
          height: 20,
          thickness: 0.5,
          endIndent: 40,
        ),
        DrugOutput(
            name: '''Amoxycillin/Clavulanic Acid 
80mg/mL''',
            administration: "With food every 12 hours (Max. 875mg).",
            concentration: 80,
            standard: 22.5,
            range: 0,
            severe: 0,
            weight: weight),
      ],
    );
  }
}
