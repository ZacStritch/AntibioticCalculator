import 'package:antibiotic_calculator/main.dart';
import 'package:antibiotic_calculator/medication_profile.dart';
import 'package:flutter/material.dart';

class Clarithromycin extends StatefulWidget {
  final int weight;
  const Clarithromycin({Key? key, required this.weight}) : super(key: key);

  @override
  State<Clarithromycin> createState() => _Clarithromycin();
}

class _Clarithromycin extends State<Clarithromycin> {
  @override
  Widget build(BuildContext context) {
    double clarithromycinmL =
        clarithromycin.dose! * widget.weight / clarithromycin.concentration!;
    double clarithromycinmg = clarithromycin.dose! * widget.weight;
    double clarithromycinRangemL =
        clarithromycin.range! * widget.weight / clarithromycin.concentration!;
    double clarithromycinRangemg = clarithromycin.range! * widget.weight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MedProfile(
            medType: "Clarithromycin 50mg/mL (Treatment)",
            range:
                "${clarithromycinmL.toStringAsFixed(2).toString()}mL (${clarithromycinmg.toStringAsFixed(0).toString()}mg) to ${clarithromycinRangemL.toStringAsFixed(2).toString()}mL (${clarithromycinRangemg.toStringAsFixed(0).toString()}mg)",
            takeMax: "Twice daily (Max. 500mg)",
            severe: "",
            extraInformation: ""),
        MedProfile(
            medType: "Clarithromycin 50mg/mL (Prevention)",
            range:
                "${clarithromycinmL.toStringAsFixed(2).toString()}mL (${clarithromycinmg.toStringAsFixed(0).toString()}mg)",
            takeMax: "Twice daily (Max. 500mg)",
            severe: "",
            extraInformation: ""),
      ],
    );
  }
}
