import 'package:flutter/material.dart';

import '../main.dart';

class Cephalexin extends StatelessWidget {
  final int weight;
  const Cephalexin({Key? key, required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrugOutput(
            name: "Cephalexin 25mg/mL",
            administration: "",
            concentration: 25,
            standard: 6.25,
            range: 12.5,
            severe: 0,
            weight: weight),
        const Text(""),
        DrugOutput(
            name: "Cephalexin 50mg/mL",
            administration: "",
            concentration: 50,
            standard: 6.25,
            range: 12.5,
            severe: 0,
            weight: weight),
        const Text(""),
        const Text(
          "Interval of Administration:",
          style: TextStyle(fontSize: 15, color: Colors.blue),
        ),
        const Text("Every 6 hours (Max. 500mg)."),
      ],
    );
  }
}
