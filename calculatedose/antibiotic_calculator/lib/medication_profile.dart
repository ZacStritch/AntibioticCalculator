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
    return Visibility(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.medType,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Text(
            "Dose Range:",
            style: TextStyle(fontSize: 15, color: Colors.blue),
          ),
          Text(widget.range, style: const TextStyle(fontSize: 15)),
          if (widget.severe != "")
            const Text("Severe Infection:",
                style: TextStyle(fontSize: 15, color: Colors.blue)),
          if (widget.severe != "")
            Text(widget.severe, style: const TextStyle(fontSize: 16)),
          const Text(
            "Interval of Administration:",
            style: TextStyle(fontSize: 15, color: Colors.blue),
          ),
          if (widget.takeMax != "")
            Text(widget.takeMax, style: const TextStyle(fontSize: 15)),
          Text(widget.extraInformation, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
