import 'package:flutter/material.dart';

class Azithryomycin extends StatefulWidget {
  final int weight;
  const Azithryomycin({Key? key, required this.weight}) : super(key: key);

  @override
  State<Azithryomycin> createState() => _Azithryomycin();
}

class _Azithryomycin extends State<Azithryomycin> {
  @override
  Widget build(BuildContext context) {
    double azithromycinmL = 10 * widget.weight / 40;
    double azithromycinmg = 10.0 * widget.weight;
    double azithromycinRangemL = 5 * widget.weight / 40;
    double azithromycinRangemg = 5.0 * widget.weight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Azithromycin 40mg/mL",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const Text("Dose Range (>6 months):",
            style: TextStyle(fontSize: 15, color: Colors.blue)),
        Text(
            "${azithromycinmL.toStringAsFixed(2).toString()}mL (${azithromycinmg.toStringAsFixed(0).toString()}mg)"),
        const Text("Interval of Administration:",
            style: TextStyle(fontSize: 15, color: Colors.blue)),
        Text(
            "Administered once on day 1 (Max. 500mg); then once daily for 2 days. Alternatively, after day 1, ${azithromycinRangemL.toStringAsFixed(2).toString()}mL (${azithromycinRangemg.toStringAsFixed(0).toString()}mg) can be taken once daily for 4 days (Max. 250mg)."),
        const Divider(
          color: Colors.blue,
          height: 20,
          thickness: 0.5,
          endIndent: 40,
        ),
        const Text(
            "The higher dose can be given for >3 days depending on the infection.",
            style: TextStyle(color: Colors.blue)),
      ],
    );
  }
}
