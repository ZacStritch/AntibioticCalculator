import 'package:antibiotic_calculator/main.dart';
import 'package:antibiotic_calculator/medication_profile.dart';
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
    double azithromycinmL =
        azithromycin.dose! * widget.weight / azithromycin.concentration!;
    double azithromycinmg = azithromycin.dose! * widget.weight;
    double azithromycinRangemL =
        azithromycin.range! * widget.weight / azithromycin.concentration!;
    double azithromycinRangemg = azithromycin.range! * widget.weight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MedProfile(
            medType: "Azithromycin 40mg/mL",
            range:
                ">6 months of age - ${azithromycinmL.toStringAsFixed(2).toString()}mL (${azithromycinmg.toStringAsFixed(0).toString()}mg)",
            takeMax:
                "Administered once on day 1 (Max. 500mg); then once daily for 2 days OR ${azithromycinRangemL.toStringAsFixed(2).toString()}mL (${azithromycinRangemg.toStringAsFixed(0).toString()}mg) once daily for 4 days (Max. 250mg).",
            severe: "",
            extraInformation: ""),
      ],
    );
  }
}
