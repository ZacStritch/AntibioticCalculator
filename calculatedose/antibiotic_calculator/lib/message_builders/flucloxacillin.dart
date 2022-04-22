import 'package:flutter/material.dart';

import '../main.dart';

class Flucloxacillin extends StatelessWidget {
  final int weight;
  const Flucloxacillin({Key? key, required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrugOutput(
            name: "Flucloxacillin 25mg/mL",
            administration: "",
            concentration: 25,
            standard: 12.5,
            range: 25,
            severe: 0,
            weight: weight),
        const Text(""),
        DrugOutput(
            name: "Flucloxacillin 50mg/mL",
            administration: "",
            concentration: 50,
            standard: 12.5,
            range: 25,
            severe: 0,
            weight: weight),
        const Text(""),
        const Text(
          "Interval of Administration:",
          style: TextStyle(fontSize: 15, color: Colors.blue),
        ),
        const Text(
            "Every 6 hours on an empty stomach at least half an hour before or 2 hours after food."),
      ],
    );
  }
}
