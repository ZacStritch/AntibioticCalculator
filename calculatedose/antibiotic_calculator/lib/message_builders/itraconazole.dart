import 'package:flutter/material.dart';

import '../main.dart';

class Itraconazole extends StatelessWidget {
  final int weight;
  const Itraconazole({Key? key, required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrugOutput(
            name: "Itraconazole 10mg/mL (Child)",
            administration:
                "Daily in 1 or 2 doses on an empty stomach at least 1 hour before food.",
            concentration: 10,
            standard: 3,
            range: 5,
            severe: 5,
            weight: weight),
      ],
    );
  }
}
