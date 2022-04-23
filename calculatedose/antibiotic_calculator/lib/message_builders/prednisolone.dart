import 'package:flutter/material.dart';

import 'package:antibiotic_calculator/final_message.dart';

class Prednisolone extends StatelessWidget {
  final int weight;
  const Prednisolone({Key? key, required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrugOutput(
            name: "Prednisolone 5mg/mL (Acute Asthma)",
            administration: "ONCE daily with food for 3-5 days.",
            concentration: 5,
            standard: 1,
            range: 2,
            severe: 0,
            weight: weight),
        const Divider(
          color: Colors.blue,
          height: 20,
          thickness: 0.5,
          endIndent: 40,
        ),
        DrugOutput(
            name: "Prednisolone 5mg/mL (Croup)",
            administration:
                "ONCE, then repeated after 12-24 hours as required.",
            concentration: 5,
            standard: 1,
            range: 0,
            severe: 0,
            weight: weight),
      ],
    );
  }
}
