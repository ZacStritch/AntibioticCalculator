import 'package:antibiotic_calculator/main.dart';
import 'package:antibiotic_calculator/medication_profile.dart';
import 'package:flutter/material.dart';

class Cefuroxime extends StatefulWidget {
  final int weight;
  const Cefuroxime({Key? key, required this.weight}) : super(key: key);

  @override
  State<Cefuroxime> createState() => _Cefuroxime();
}

class _Cefuroxime extends State<Cefuroxime> {
  @override
  Widget build(BuildContext context) {
    double cefuroximemL =
        cefuroxime.dose! * widget.weight / cefuroxime.concentration!;
    double cefuroximemg = cefuroxime.dose! * widget.weight;
    double cefuroximeRangemL =
        cefuroxime.range! * widget.weight / cefuroxime.concentration!;
    double cefuroximeRangemg = cefuroxime.range! * widget.weight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MedProfile(
            medType: '''Cefuroxime 25mg/mL 
(3 Months - 2 Years)''',
            range:
                "${cefuroximemL.toStringAsFixed(2).toString()}mL (${cefuroximemg.toStringAsFixed(0).toString()}mg)",
            takeMax: "With food twice a day (Max. 125mg)",
            severe: "",
            extraInformation: ""),
        MedProfile(
            medType: '''Cefuroxime 25mg/mL 
(2 - 12 Years)''',
            range:
                "${cefuroximeRangemL.toStringAsFixed(2).toString()}mL (${cefuroximeRangemg.toStringAsFixed(0).toString()}mg)",
            takeMax:
                "With food twice a day (Max. 250mg; 500mg has also previously been administered)",
            severe: "",
            extraInformation: ""),
      ],
    );
  }
}
