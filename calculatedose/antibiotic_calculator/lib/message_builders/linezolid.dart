import 'package:flutter/material.dart';

import 'package:antibiotic_calculator/final_message.dart';

class Linezolid extends StatelessWidget {
  final int weight;
  const Linezolid({Key? key, required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrugOutput(
            name: "Linezolid 20mg/mL",
            administration: "Every 8 hours (Max. 600mg).",
            concentration: 20,
            standard: 10,
            range: 0,
            severe: 0,
            weight: weight),
        const Divider(
          color: Colors.blue,
          height: 20,
          thickness: 0.5,
          endIndent: 40,
        ),
        const Text(
            "Avoid foods rich in tyramine (e.g. mature cheese, soy sauce, yeast extracts) when taking this medication. Treatment >28 days is not recommended.",
            style: TextStyle(fontSize: 15, color: Colors.red)),
      ],
    );
  }
}
