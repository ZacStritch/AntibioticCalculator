import 'package:flutter/material.dart';

import '../main.dart';

class Fluconazole extends StatelessWidget {
  final int weight;
  const Fluconazole({Key? key, required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sixmL = 6 * weight / 10;
    int sixmg = 6 * weight;
    double threemL = 3 * weight / 10;
    int threemg = 3 * weight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrugOutput(
            name: "Fluconazole 10mg/mL (Mucosal Candidiasis - Except Genital)",
            administration:
                "ONCE on day 1 (Max. 200mg), then ${threemL.toStringAsFixed(2).toString()}mL (${threemg.toStringAsFixed(0).toString()}mg) ONCE daily (Max. 100mg). Up to (Max. 400mg) ONCE daily can be used for oesophageal infection.",
            concentration: 10,
            standard: 6,
            range: 0,
            severe: 12,
            weight: weight),
        DrugOutput(
            name: "Fluconazole 10mg/mL (Systemic Infections)",
            administration:
                "ONCE on day 1 (Max. 400mg), then ${sixmL.toStringAsFixed(2).toString()}mL (${sixmg.toStringAsFixed(0).toString()}mg) ONCE daily.",
            concentration: 10,
            standard: 12,
            range: 0,
            severe: 0,
            weight: weight),
      ],
    );
  }
}
