import 'package:antibiotic_calculator/defaultMessage.dart';
import 'package:antibiotic_calculator/main.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  final String medication;
  final int input;

  const Message({Key? key, required this.medication, required this.input})
      : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    if (calculate == false) {
      return const DefaultMessage();
    } else {
      return dose(widget.medication, widget.input);
    }
  }
}
