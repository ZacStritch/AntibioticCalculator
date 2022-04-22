import 'package:flutter/material.dart';

class TrimethoprimSulfamethoxazole extends StatelessWidget {
  final int weight;
  const TrimethoprimSulfamethoxazole({Key? key, required this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sulfmL = 4 * weight / 8;
    int sulfmg = 4 * weight;
    int trimethmg = 4 * 5 * weight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Trimethoprim 8mg/mL With Sulfamethoxazole 40mg/mL",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const Text("Dose Range:",
            style: TextStyle(fontSize: 15, color: Colors.blue)),
        Text(
            "${sulfmL.toStringAsFixed(2).toString()}mL (${sulfmg.toStringAsFixed(0).toString()}mg/${trimethmg.toStringAsFixed(0).toString()}mg)"),
        const Text("Interval of Administration:",
            style: TextStyle(fontSize: 15, color: Colors.blue)),
        const Text(
            "Every 12 hours with food to reduce stomach upset (Max. 160/800mg). Drink a lot of fluid (at least 2-3L daily)."),
      ],
    );
  }
}
