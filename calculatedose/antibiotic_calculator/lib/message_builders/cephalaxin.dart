import 'package:antibiotic_calculator/main.dart';
import 'package:antibiotic_calculator/medication_profile.dart';
import 'package:flutter/material.dart';

class Cephalexin extends StatefulWidget {
  final int weight;
  const Cephalexin({Key? key, required this.weight}) : super(key: key);

  @override
  State<Cephalexin> createState() => _Cephalexin();
}

class _Cephalexin extends State<Cephalexin> {
  @override
  Widget build(BuildContext context) {
    double cephalexin25mL =
        cephalexin25.dose! * widget.weight / cephalexin25.concentration!;
    double cephalexin25mg = cephalexin25.dose! * widget.weight;
    double cephalexin25RangemL =
        cephalexin25.range! * widget.weight / cephalexin25.concentration!;
    double cephalexin25Rangemg = cephalexin25.range! * widget.weight;
    double cephalexin50mL =
        cephalexin50.dose! * widget.weight / cephalexin50.concentration!;
    double cephalexin50mg = cephalexin50.dose! * widget.weight;
    double cephalexin50RangemL =
        cephalexin50.range! * widget.weight / cephalexin50.concentration!;
    double cephalexin50Rangemg = cephalexin50.range! * widget.weight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MedProfile(
            medType: "Cephalexin 25mg/mL",
            range:
                "${cephalexin25mL.toStringAsFixed(2).toString()}mL (${cephalexin25mg.toStringAsFixed(0).toString()}mg) to ${cephalexin25RangemL.toStringAsFixed(2).toString()}mL (${cephalexin25Rangemg.toStringAsFixed(0).toString()}mg)",
            takeMax: "Every 6 hours (Max. 500mg)",
            severe: "",
            extraInformation: ""),
        MedProfile(
            medType: "Cephalexin 50mg/mL",
            range:
                "${cephalexin50mL.toStringAsFixed(2).toString()}mL (${cephalexin50mg.toStringAsFixed(0).toString()}mg) to ${cephalexin50RangemL.toStringAsFixed(2).toString()}mL (${cephalexin50Rangemg.toStringAsFixed(0).toString()}mg)",
            takeMax: "Every 6 hours (Max. 500mg)",
            severe: "",
            extraInformation: ""),
      ],
    );
  }
}
