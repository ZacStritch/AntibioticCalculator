import 'package:flutter/material.dart';

class DrugOutput extends StatelessWidget {
  final String name;
  final String administration;
  final double concentration;
  final double standard;
  final double range;
  final double severe;
  final int weight;

  const DrugOutput({
    Key? key,
    required this.name,
    required this.administration,
    required this.concentration,
    required this.standard,
    required this.range,
    required this.severe,
    required this.weight,
  }) : super(key: key);

  String _formatDose(double millilitres, double milligrams) {
    return '${millilitres.toStringAsFixed(2)}mL (${milligrams.toStringAsFixed(0)}mg)';
  }

  @override
  Widget build(BuildContext context) {
    final double standardmL = standard * weight / concentration;
    final double standardmg = standard * weight;
    final double rangemL = range * weight / concentration;
    final double rangemg = range * weight;
    final double severemL = severe * weight / concentration;
    final double severemg = severe * weight;

    final String rangeMessage = range > 0
        ? '${_formatDose(standardmL, standardmg)} to ${_formatDose(rangemL, rangemg)}'
        : _formatDose(standardmL, standardmg);
    final String? severeMessage =
        severe > 0 ? _formatDose(severemL, severemg) : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const Text(
          'Dose Range:',
          style: TextStyle(fontSize: 15, color: Colors.blue),
        ),
        Text(rangeMessage),
        if (severeMessage != null)
          const Text(
            'Severe Infection:',
            style: TextStyle(fontSize: 15, color: Colors.blue),
          ),
        if (severeMessage != null) Text(severeMessage),
        if (administration.isNotEmpty)
          const Text(
            'Interval of Administration:',
            style: TextStyle(fontSize: 15, color: Colors.blue),
          ),
        if (administration.isNotEmpty) Text(administration),
      ],
    );
  }
}
