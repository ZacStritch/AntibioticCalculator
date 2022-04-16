import 'package:antibiotic_calculator/main.dart';
import 'package:antibiotic_calculator/medication_profile.dart';
import 'package:flutter/material.dart';

class AmoxWithClav extends StatefulWidget {
  final int weight;
  const AmoxWithClav({Key? key, required this.weight}) : super(key: key);

  @override
  State<AmoxWithClav> createState() => _AmoxWithClavState();
}

class _AmoxWithClavState extends State<AmoxWithClav> {
  @override
  Widget build(BuildContext context) {
    double amoxClavAcid25mL =
        amoxClavAcid25.dose! * widget.weight / amoxClavAcid25.concentration!;
    double amoxClavAcid25mg = amoxClavAcid25.dose! * widget.weight;
    double amoxClavAcid25RangemL =
        amoxClavAcid25.range! * widget.weight / amoxClavAcid25.concentration!;
    double amoxClavAcid25Rangemg = amoxClavAcid25.range! * widget.weight;
    double amoxClavAcid25SeveremL =
        amoxClavAcid25.severe! * widget.weight / amoxClavAcid25.concentration!;
    double amoxClavAcid25Severemg = amoxClavAcid25.severe! * widget.weight;
    double amoxClavAcid80mL =
        amoxClavAcid80.dose! * widget.weight / amoxClavAcid80.concentration!;
    double amoxClavAcid80mg = amoxClavAcid80.dose! * widget.weight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MedProfile(
            medType: '''Amoxycillin/Clavulanic Acid 
25mg/mL''',
            range:
                "${amoxClavAcid25mL.toStringAsFixed(2).toString()}mL(${amoxClavAcid25mg.toStringAsFixed(0).toString()}mg) to ${amoxClavAcid25RangemL.toStringAsFixed(2).toString()}mL (${amoxClavAcid25Rangemg.toStringAsFixed(0).toString()}mg)",
            takeMax: "With food every 8 hours (Max. 500mg)",
            severe:
                "Up to ${amoxClavAcid25SeveremL.toStringAsFixed(2).toString()}mL (${amoxClavAcid25Severemg.toStringAsFixed(0).toString()}mg)",
            extraInformation: ""),
        MedProfile(
            medType: '''Amoxycillin/Clavulanic Acid 
80mg/mL''',
            range:
                "${amoxClavAcid80mL.toStringAsFixed(2).toString()}mL (${amoxClavAcid80mg.toStringAsFixed(0).toString()}mg)",
            takeMax: "With food every 12 hours (Max. 875mg)",
            severe:
                "Up to ${amoxClavAcid25SeveremL.toStringAsFixed(2).toString()}mL (${amoxClavAcid25Severemg.toStringAsFixed(0).toString()}mg)",
            extraInformation: ""),
      ],
    );
  }
}
