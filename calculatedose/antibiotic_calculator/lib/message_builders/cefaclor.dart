import 'package:flutter/material.dart';

import 'package:antibiotic_calculator/final_message.dart';

class Cefaclor extends StatelessWidget {
  final int weight;
  const Cefaclor({Key? key, required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrugOutput(
            name: "Cefaclor 25mg/mL",
            administration: "",
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
            name: "Cefaclor 50mg/mL",
            administration: "",
            concentration: 50,
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
        const Text(
          "Interval of Administration:",
          style: TextStyle(fontSize: 15, color: Colors.blue),
        ),
        const Text("With food every 8 hours (Max. 500mg)."),
      ],
    );
  }
}
