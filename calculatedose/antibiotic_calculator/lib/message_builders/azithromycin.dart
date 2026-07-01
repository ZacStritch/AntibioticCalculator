import 'package:flutter/material.dart';

class Azithromycin extends StatelessWidget {
  final int weight;

  const Azithromycin({Key? key, required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double higherDosemL = 10 * weight / 40;
    final double higherDosemg = 10.0 * weight;
    final double lowerDosemL = 5 * weight / 40;
    final double lowerDosemg = 5.0 * weight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Azithromycin 40mg/mL',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const Text(
          'Dose Range (>6 months):',
          style: TextStyle(fontSize: 15, color: Colors.blue),
        ),
        Text(
          '${higherDosemL.toStringAsFixed(2)}mL (${higherDosemg.toStringAsFixed(0)}mg)',
        ),
        const Text(
          'Interval of Administration:',
          style: TextStyle(fontSize: 15, color: Colors.blue),
        ),
        Text(
          'Administered once on day 1 (Max. 500mg); then once daily for 2 days. Alternatively, after day 1, ${lowerDosemL.toStringAsFixed(2)}mL (${lowerDosemg.toStringAsFixed(0)}mg) can be taken once daily for 4 days (Max. 250mg).',
        ),
        const Divider(
          color: Colors.blue,
          height: 20,
          thickness: 0.5,
          endIndent: 40,
        ),
        const Text(
          'The higher dose can be given for >3 days depending on the infection.',
          style: TextStyle(color: Colors.blue),
        ),
      ],
    );
  }
}
