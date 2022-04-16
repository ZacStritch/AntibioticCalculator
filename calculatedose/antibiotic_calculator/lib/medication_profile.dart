import 'package:flutter/material.dart';

class MedProfile extends StatefulWidget {
  final String medType;
  final String range;
  final String takeMax;
  final String severe;
  final String extraInformation;
  // ignore: use_key_in_widget_constructors
  const MedProfile(
      {Key,
      key,
      required this.medType,
      required this.range,
      required this.takeMax,
      required this.severe,
      required this.extraInformation})
      : super(key: key);

  @override
  State<MedProfile> createState() => _MedProfileState();
}

class _MedProfileState extends State<MedProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Visibility(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.medType,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Text(
              "Dose Range:",
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
            Text(widget.range),
            if (widget.severe != "") Text(widget.severe),
            const Text(
              "Administration:",
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
            Text(widget.takeMax),
            Text(widget.extraInformation),
          ],
        ),
      ),
    );
  }
}
