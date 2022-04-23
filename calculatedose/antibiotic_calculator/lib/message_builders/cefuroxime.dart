import 'package:flutter/material.dart';

import 'package:antibiotic_calculator/final_message.dart';

class Cefuroxime extends StatelessWidget {
  final int weight;
  const Cefuroxime({Key? key, required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrugOutput(
            name: '''Cefuroxime 25mg/mL 
(3 Months - 2 Years)''',
            administration: "With food twice a day (Max. 125mg).",
            concentration: 25,
            standard: 10,
            range: 15,
            severe: 0,
            weight: weight),
        const Divider(
          color: Colors.blue,
          height: 20,
          thickness: 0.5,
          endIndent: 40,
        ),
        DrugOutput(
            name: '''Cefuroxime 25mg/mL 
(2 - 12 Years)''',
            administration:
                "With food twice a day (Max. 250mg); Up to 500mg has been administered before.",
            concentration: 50,
            standard: 10,
            range: 15,
            severe: 0,
            weight: weight),
      ],
    );
  }
}
