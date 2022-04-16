import 'package:antibiotic_calculator/main.dart';
import 'package:antibiotic_calculator/medication_profile.dart';
import 'package:flutter/material.dart';

class Phenoxymethylpenicillin extends StatefulWidget {
  final int weight;
  const Phenoxymethylpenicillin({Key? key, required this.weight})
      : super(key: key);

  @override
  State<Phenoxymethylpenicillin> createState() => _Phenoxymethylpenicillin();
}

class _Phenoxymethylpenicillin extends State<Phenoxymethylpenicillin> {
  @override
  Widget build(BuildContext context) {
    double phenoxymethylpenicillin25mL = phenoxymethylpenicillin25.dose! *
        widget.weight /
        phenoxymethylpenicillin25.concentration!;
    double phenoxymethylpenicillin25mg =
        phenoxymethylpenicillin25.dose! * widget.weight;
    double phenoxymethylpenicillinRange25mL = phenoxymethylpenicillin25.range! *
        widget.weight /
        phenoxymethylpenicillin25.concentration!;
    double phenoxymethylpenicillinRange25mg =
        phenoxymethylpenicillin25.range! * widget.weight;
    double phenoxymethylpenicillin30mL = phenoxymethylpenicillin30.dose! *
        widget.weight /
        phenoxymethylpenicillin30.concentration!;
    double phenoxymethylpenicillin30mg =
        phenoxymethylpenicillin30.dose! * widget.weight;
    double phenoxymethylpenicillinRange30mL = phenoxymethylpenicillin30.range! *
        widget.weight /
        phenoxymethylpenicillin30.concentration!;
    double phenoxymethylpenicillinRange30mg =
        phenoxymethylpenicillin30.range! * widget.weight;
    double phenoxymethylpenicillin50mL = phenoxymethylpenicillin50.dose! *
        widget.weight /
        phenoxymethylpenicillin50.concentration!;
    double phenoxymethylpenicillin50mg =
        phenoxymethylpenicillin50.dose! * widget.weight;
    double phenoxymethylpenicillinRange50mL = phenoxymethylpenicillin50.range! *
        widget.weight /
        phenoxymethylpenicillin50.concentration!;
    double phenoxymethylpenicillinRange50mg =
        phenoxymethylpenicillin50.range! * widget.weight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MedProfile(
            medType: "Phenoxymethylpenicillin 25mg/mL",
            range:
                "${phenoxymethylpenicillin25mL.toStringAsFixed(2).toString()}mL (${phenoxymethylpenicillin25mg.toStringAsFixed(0).toString()}mg) to ${phenoxymethylpenicillinRange25mL.toStringAsFixed(2).toString()}mL (${phenoxymethylpenicillinRange25mg.toStringAsFixed(0).toString()}mg)",
            takeMax: "Every 6 hours (Max. 500mg)",
            severe: "In cases of severe infection, Max. 1g",
            extraInformation: ""),
        MedProfile(
            medType: "Phenoxymethylpenicillin 30mg/mL",
            range:
                "${phenoxymethylpenicillin30mL.toStringAsFixed(2).toString()}mL (${phenoxymethylpenicillin30mg.toStringAsFixed(0).toString()}mg) to ${phenoxymethylpenicillinRange30mL.toStringAsFixed(2).toString()}mL (${phenoxymethylpenicillinRange30mg.toStringAsFixed(0).toString()}mg)",
            takeMax: "",
            severe: "",
            extraInformation: ""),
        MedProfile(
            medType: "Phenoxymethylpenicillin 50mg/mL",
            range:
                "${phenoxymethylpenicillin50mL.toStringAsFixed(2).toString()}mL (${phenoxymethylpenicillin50mg.toStringAsFixed(0).toString()}mg) to ${phenoxymethylpenicillinRange50mL.toStringAsFixed(2).toString()}mL (${phenoxymethylpenicillinRange50mg.toStringAsFixed(0).toString()}mg)",
            takeMax: "Every 6 hours (Max. 500mg)",
            severe: "",
            extraInformation: ""),
      ],
    );
  }
}
