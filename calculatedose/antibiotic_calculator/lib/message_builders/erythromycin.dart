import 'package:antibiotic_calculator/main.dart';
import 'package:antibiotic_calculator/medication_profile.dart';
import 'package:flutter/material.dart';

class Erythromycin extends StatefulWidget {
  final int weight;
  const Erythromycin({Key? key, required this.weight}) : super(key: key);

  @override
  State<Erythromycin> createState() => _Erythromycin();
}

class _Erythromycin extends State<Erythromycin> {
  @override
  Widget build(BuildContext context) {
    double erythromycin40mL =
        erythromycin40.dose! * widget.weight / erythromycin40.concentration!;
    double erythromycin40mg = erythromycin40.dose! * widget.weight;
    double erythromycin80mL =
        erythromycin80.dose! * widget.weight / erythromycin80.concentration!;
    double erythromycin80mg = erythromycin80.dose! * widget.weight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MedProfile(
            medType: "Erythromycin 40mg/mL",
            range:
                "${erythromycin40mL.toStringAsFixed(2).toString()}mL (${erythromycin40mg.toStringAsFixed(0).toString()}mg)",
            takeMax: "Every 6 hours (Max. 500mg)",
            severe: "In cases of severe infection, Max. 1g",
            extraInformation: ""),
        MedProfile(
            medType: "Erythromycin 80mg/mL",
            range:
                "${erythromycin80mL.toStringAsFixed(2).toString()}mL (${erythromycin80mg.toStringAsFixed(0).toString()}mg)",
            takeMax: "Every 6 hours (Max. 500mg)",
            severe: "In cases of severe infection, Max. 1g",
            extraInformation: ""),
      ],
    );
  }
}
