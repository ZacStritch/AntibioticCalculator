import 'package:flutter/material.dart';

import '../main.dart';

class Erythromycin extends StatelessWidget {
  final int weight;
  const Erythromycin({Key? key, required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrugOutput(
            name: "Erythromycin 40mg/mL",
            administration: "",
            concentration: 40,
            standard: 10,
            range: 0,
            severe: 0,
            weight: weight),
        const Text(""),
        DrugOutput(
            name: "Erythromycin 80mg/mL",
            administration: "",
            concentration: 80,
            standard: 10,
            range: 0,
            severe: 0,
            weight: weight),
        const Text(""),
        const Text(
          "Interval of Administration:",
          style: TextStyle(fontSize: 15, color: Colors.blue),
        ),
        const Text(
            "Take 1 hour before or 2 hours after meals every 6 hours (Max. 500mg). In cases of severe infection (Max. 4 grams daily)"),
      ],
    );
  }
}
