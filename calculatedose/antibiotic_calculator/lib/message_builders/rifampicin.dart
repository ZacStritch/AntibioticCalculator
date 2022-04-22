import 'package:flutter/material.dart';

import '../main.dart';

class Rifampicin extends StatelessWidget {
  final int weight;
  const Rifampicin({Key? key, required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrugOutput(
            name: "Rifampicin/Rifampin 20mg/mL (Child)",
            administration:
                "Either once daily or 3 times weekly (Max. 600mg) at least half an hour before food.",
            concentration: 20,
            standard: 15,
            range: 0,
            severe: 0,
            weight: weight),
        const Text(""),
        const Text(
          "Rifampicin/Rifampin should be taken regularly, stop-start dosing can cause flu-like illnesses.",
          style: TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}
