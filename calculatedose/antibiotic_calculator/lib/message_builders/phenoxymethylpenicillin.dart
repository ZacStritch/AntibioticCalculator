import 'package:flutter/material.dart';

import 'package:antibiotic_calculator/final_message.dart';

class Phenoxymethylpenicillin extends StatelessWidget {
  final int weight;
  const Phenoxymethylpenicillin({Key? key, required this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrugOutput(
            name: "Phenoxymethylpenicillin 25mg/mL",
            administration: "",
            concentration: 25,
            standard: 10,
            range: 12.5,
            severe: 0,
            weight: weight),
        const Divider(
          color: Colors.blue,
          height: 20,
          thickness: 0.5,
          endIndent: 40,
        ),
        DrugOutput(
            name: "Phenoxymethylpenicillin 30mg/mL",
            administration: "",
            concentration: 30,
            standard: 10,
            range: 12.5,
            severe: 0,
            weight: weight),
        const Divider(
          color: Colors.blue,
          height: 20,
          thickness: 0.5,
          endIndent: 40,
        ),
        DrugOutput(
            name: "Phenoxymethylpenicillin 50mg/mL",
            administration: "",
            concentration: 50,
            standard: 10,
            range: 12.5,
            severe: 0,
            weight: weight),
        const Divider(
          color: Colors.blue,
          height: 20,
          thickness: 0.5,
          endIndent: 40,
        ),
        const Text(
          "Interval of Administration:",
          style: TextStyle(fontSize: 15, color: Colors.blue),
        ),
        const Text("1 month to 18 years; every 6 hours (Max. 500mg)."),
      ],
    );
  }
}
