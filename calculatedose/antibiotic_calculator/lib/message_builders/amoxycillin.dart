import 'package:flutter/material.dart';

import '../main.dart';

class Amoxycillin extends StatelessWidget {
  final int weight;
  const Amoxycillin({Key? key, required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrugOutput(
            name: "Amoxycillin 125mg/5mL",
            administration: "",
            concentration: 25,
            standard: 15,
            range: 25,
            severe: 30,
            weight: weight),
        const Text(""),
        DrugOutput(
            name: "Amoxycillin 250mg/5mL",
            administration: "",
            concentration: 50,
            standard: 15,
            range: 25,
            severe: 30,
            weight: weight),
        const Text(""),
        const Text(
          "Interval of Administration:",
          style: TextStyle(fontSize: 15, color: Colors.blue),
        ),
        const Text("Every 8 hours (Max. 500mg)."),
      ],
    );
  }
}
