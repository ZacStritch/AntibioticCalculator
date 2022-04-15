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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.medType,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(widget.range),
        Text(widget.takeMax),
        Text(widget.severe),
        Text(widget.extraInformation),
      ],
    );
  }
}
