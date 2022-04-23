import 'package:flutter/material.dart';

class DrugOutput extends StatefulWidget {
  final String name;
  final String administration;
  final double concentration;
  final double standard;
  final double range;
  final double severe;
  final int weight;
  const DrugOutput(
      {Key? key,
      required this.name,
      required this.administration,
      required this.concentration,
      required this.standard,
      required this.range,
      required this.severe,
      required this.weight})
      : super(key: key);

  @override
  State<DrugOutput> createState() => DrugOutputState();
}

class DrugOutputState extends State<DrugOutput> {
  @override
  Widget build(BuildContext context) {
    String rangeMessage;
    String severeMessage;
    double standardmL = widget.standard * widget.weight / widget.concentration;
    double standardmg = widget.standard * widget.weight;
    double rangemL = widget.range * widget.weight / widget.concentration;
    double rangemg = widget.range * widget.weight;
    double severemL = widget.severe * widget.weight / widget.concentration;
    double severemg = widget.severe * widget.weight;
    if (standardmg != 0 && rangemg != 0) {
      rangeMessage =
          "${standardmL.toStringAsFixed(2).toString()}mL (${standardmg.toStringAsFixed(0).toString()}mg) to ${rangemL.toStringAsFixed(2).toString()}mL (${rangemg.toStringAsFixed(0).toString()}mg)";
    } else {
      rangeMessage =
          "${standardmL.toStringAsFixed(2).toString()}mL (${standardmg.toStringAsFixed(0).toString()}mg)";
    }
    if (severemL != 0) {
      severeMessage =
          "${severemL.toStringAsFixed(2).toString()}mL (${severemg.toStringAsFixed(0).toString()}mg)";
    } else {
      severeMessage = "";
    }

    return Visibility(
      maintainAnimation: false,
      maintainSize: false,
      maintainState: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Text(
            "Dose Range:",
            style: TextStyle(fontSize: 15, color: Colors.blue),
          ),
          Text(rangeMessage),
          if (severeMessage != "")
            const Text("Severe Infection:",
                style: TextStyle(fontSize: 15, color: Colors.blue)),
          if (severeMessage != "") Text(severeMessage),
          if (widget.administration != "")
            const Text(
              "Interval of Administration:",
              style: TextStyle(fontSize: 15, color: Colors.blue),
            ),
          if (widget.administration != "") Text(widget.administration),
        ],
      ),
    );
  }
}
