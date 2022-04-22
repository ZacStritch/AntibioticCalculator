import 'package:flutter/material.dart';

import '../main.dart';

class Clarithromycin extends StatelessWidget {
  final int weight;
  const Clarithromycin({Key? key, required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrugOutput(
            name: "Clarithromycin 50mg/mL (Treatment)",
            administration: "",
            concentration: 50,
            standard: 7.5,
            range: 15,
            severe: 0,
            weight: weight),
        const Text(""),
        DrugOutput(
            name: "Clarithromycin 50mg/mL (Prevention)",
            administration: "",
            concentration: 50,
            standard: 7.5,
            range: 0,
            severe: 0,
            weight: weight),
        const Text(""),
        const Text(
          "Interval of Administration:",
          style: TextStyle(fontSize: 15, color: Colors.blue),
        ),
        const Text("Twice daily (Max. 500mg)"),
      ],
    );
  }
}
