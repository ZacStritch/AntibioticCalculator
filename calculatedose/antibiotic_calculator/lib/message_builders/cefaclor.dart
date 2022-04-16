import 'package:antibiotic_calculator/main.dart';
import 'package:antibiotic_calculator/medication_profile.dart';
import 'package:flutter/material.dart';

class Cefaclor extends StatefulWidget {
  final int weight;
  const Cefaclor({Key? key, required this.weight}) : super(key: key);

  @override
  State<Cefaclor> createState() => _Cefaclor();
}

class _Cefaclor extends State<Cefaclor> {
  @override
  Widget build(BuildContext context) {
    double cefaclormL =
        cefaclor.dose! * widget.weight / cefaclor.concentration!;
    double cefaclormg = cefaclor.dose! * widget.weight;
    double cefaclorRangemL =
        cefaclor.range! * widget.weight / cefaclor.concentration!;
    double cefaclorRangemg = cefaclor.range! * widget.weight;
    double cefaclor50mL =
        cefaclor50.dose! * widget.weight / cefaclor50.concentration!;
    double cefaclor50mg = cefaclor50.dose! * widget.weight;
    double cefaclor50RangemL =
        cefaclor50.range! * widget.weight / cefaclor50.concentration!;
    double cefaclor50Rangemg = cefaclor50.range! * widget.weight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MedProfile(
            medType: "Cefaclor 25mg/mL",
            range:
                "${cefaclormL.toStringAsFixed(2).toString()}mL (${cefaclormg.toStringAsFixed(0).toString()}mg) to ${cefaclorRangemL.toStringAsFixed(2).toString()}mL (${cefaclorRangemg.toStringAsFixed(0).toString()}mg)",
            takeMax: "With food every 8 hours (Max. 500mg)",
            severe: "",
            extraInformation: ""),
        MedProfile(
            medType: "Cefaclor 50mg/mL",
            range:
                "${cefaclor50mL.toStringAsFixed(2).toString()}mL (${cefaclor50mg.toStringAsFixed(0).toString()}mg) to ${cefaclor50RangemL.toStringAsFixed(2).toString()}mL (${cefaclor50Rangemg.toStringAsFixed(0).toString()}mg)",
            takeMax: "With food every 8 hours (Max. 500mg)",
            severe: "",
            extraInformation: ""),
      ],
    );
  }
}
