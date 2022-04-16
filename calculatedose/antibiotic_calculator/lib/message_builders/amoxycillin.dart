import 'package:antibiotic_calculator/main.dart';
import 'package:antibiotic_calculator/medication_profile.dart';
import 'package:flutter/material.dart';

class Amoxycillin extends StatefulWidget {
  final int weight;
  const Amoxycillin({Key? key, required this.weight}) : super(key: key);

  @override
  State<Amoxycillin> createState() => _AmoxycillinState();
}

class _AmoxycillinState extends State<Amoxycillin> {
  @override
  Widget build(BuildContext context) {
    double amoxilmL = amoxil.dose! * widget.weight / amoxil.concentration!;
    double amoxilmg = amoxil.dose! * widget.weight;
    double amoxilRangemL =
        amoxil.range! * widget.weight / amoxil.concentration!;
    double amoxilRangemg = amoxil.range! * widget.weight;
    double amoxilFortemL =
        amoxilForte.dose! * widget.weight / amoxilForte.concentration!;
    double amoxilFortemg = amoxilForte.dose! * widget.weight;
    double amoxilForteRangemL =
        amoxilForte.range! * widget.weight / amoxilForte.concentration!;
    double amoxilForteRangemg = amoxilForte.range! * widget.weight;
    double amoxilSevere =
        amoxil.severe! * widget.weight / amoxil.concentration!;
    double amoxilSeveremg = amoxil.severe! * widget.weight;
    double amoxilForteSevere =
        amoxilForte.severe! * widget.weight / amoxilForte.concentration!;
    double amoxilForteSeveremg = amoxilForte.severe! * widget.weight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MedProfile(
            medType: "Amoxycillin 125/50",
            range:
                "${amoxilmL.toStringAsFixed(2).toString()}mL(${amoxilmg.toStringAsFixed(0).toString()}mg) to ${amoxilRangemL.toStringAsFixed(2).toString()}mL (${amoxilRangemg.toStringAsFixed(0).toString()}mg)",
            takeMax: "Every 8 hours (Max. 500mg)",
            severe:
                "Up to ${amoxilSevere.toStringAsFixed(2).toString()}mL (${amoxilSeveremg.toStringAsFixed(0).toString()}mg)",
            extraInformation: ""),
        MedProfile(
            medType: "Amoxycillin 250/50",
            range:
                "${amoxilFortemL.toStringAsFixed(2).toString()}mL (${amoxilFortemg.toStringAsFixed(0).toString()}mg) to ${amoxilForteRangemL.toStringAsFixed(2).toString()}mL (${amoxilForteRangemg.toStringAsFixed(0).toString()}mg)",
            takeMax: "Every 8 hours (Max. 500mg)",
            severe:
                "Up to ${amoxilForteSevere.toStringAsFixed(2).toString()}mL (${amoxilForteSeveremg.toStringAsFixed(0).toString()}mg)",
            extraInformation: ""),
      ],
    );
  }
}
