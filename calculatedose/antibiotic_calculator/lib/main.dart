// ignore_for_file: prefer_const_constructors
import 'package:antibiotic_calculator/defaultMessage.dart';
import 'package:antibiotic_calculator/message.dart';
import 'package:antibiotic_calculator/message_builders/amoxycillin.dart';
import 'package:antibiotic_calculator/message_builders/amoxycillin_with_clavulanic.dart';
import 'package:antibiotic_calculator/message_builders/azithromycin.dart';
import 'package:antibiotic_calculator/message_builders/cefaclor.dart';
import 'package:antibiotic_calculator/message_builders/cefuroxime.dart';
import 'package:antibiotic_calculator/message_builders/cephalaxin.dart';
import 'package:antibiotic_calculator/message_builders/clarithromycin.dart';
import 'package:antibiotic_calculator/message_builders/erythromycin.dart';
import 'package:antibiotic_calculator/message_builders/phenoxymethylpenicillin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:core';

bool calculate = false;
bool clearText = false;

class Medication {
  double? dose;
  double? concentration;
  double? range;
  double? severe;
  Medication(this.dose, this.concentration, this.range, this.severe);
}

void main() {
  runApp(const MaterialApp(home: AntiDose()));
}

class AntiDose extends StatefulWidget {
  const AntiDose({Key? key}) : super(key: key);

  @override
  _AntiDoseState createState() => _AntiDoseState();
}

final amoxil = Medication(15, 25, 25, 30);
final amoxilForte = Medication(15, 50, 25, 30);
final amoxClavAcid25 = Medication(7.5, 25, 15, 20);
final amoxClavAcid80 = Medication(22.5, 80, null, null);
final azithromycin = Medication(10, 40, 5, null);
final cefaclor = Medication(10, 25, 15, null);
final cefaclor50 = Medication(10, 50, 15, null);
final cefuroxime = Medication(10, 25, 15, null);
final cephalexin25 = Medication(6.25, 25, 12.5, null);
final cephalexin50 =
    Medication(6.25, 50, 12.5, null); /*max dose 500mg every 6 hours*/
final clarithromycin = Medication(7.5, 50, 15, null); /*max dose 500mg bd */
final erythromycin40 = Medication(
    10, 40, null, null); /*Give every 6 hours max 4 grams daily for severe inf*/
final erythromycin80 = Medication(10, 80, null, null);
final phenoxymethylpenicillin25 = Medication(10, 25, 12.5, null);
final phenoxymethylpenicillin30 = Medication(10, 30, 12.5, null);
final phenoxymethylpenicillin50 = Medication(10, 50, 12.5, null);

class _AntiDoseState extends State<AntiDose> {
  final antibiotics = [
    'Amoxycillin',
    'Amoxycillin With Clavulanic Acid',
    'Azithromycin',
    'Cefaclor',
    'Cefuroxime',
    'Cephalexin',
    'Clarithromycin',
    'Erythromycin',
    'Phenoxymethylpenicillin',
  ];

  String? value;
  String? medChoice;
  String doseMessage = "Input a medication and weight.";
  bool textChange = false;

  final myController = TextEditingController();

  @override
  void initState() {
    FocusManager.instance.primaryFocus?.unfocus();
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
              elevation: 0,
              title: Text("StritchPharma",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              backgroundColor: Color(0xFF0080FF)),
          backgroundColor: Color(0xFFDDEDED),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
            child: Container(
              constraints:
                  BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(14, 0, 14, 0),
                        padding: EdgeInsets.fromLTRB(15, 7, 10, 7),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text("Select a Medication",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                            value: value,
                            iconSize: 36,
                            isExpanded: true,
                            icon: Icon(Icons.arrow_drop_down,
                                color: Colors.black),
                            items: antibiotics.map(buildMenuItem).toList(),
                            onChanged: (value) {
                              setState(() {
                                calculate = false;
                                this.value = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: TextFormField(
                          onChanged: (myController) {
                            setState(() {
                              calculate = false;
                            });
                          },
                          controller: myController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: (InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.white)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              suffixStyle: TextStyle(color: Colors.black),
                              suffixText: 'kg',
                              labelStyle:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              hintText: 'Input Weight',
                              hintStyle: TextStyle(fontSize: 18))),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          setState(() {
                            calculate = true;
                            Message(
                                medication: value ?? "",
                                input: int.tryParse(myController.text) ?? 0);
                          });
                        },
                        child: Text(
                          'Calculate',
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            primary: Color(0xFF0080FF),
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            fixedSize: const Size(160, 50)),
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        width: 500,
                        child: Message(
                            medication: value ?? "",
                            input: int.tryParse(myController.text) ?? 0),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String antibiotics) =>
      DropdownMenuItem(
        value: antibiotics,
        child: Text(
          antibiotics,
          style: TextStyle(fontSize: 18),
        ),
      );
}

Widget dose(String medication, int weight) {
  if (medication == "Amoxycillin") {
    return Amoxycillin(weight: weight);
  }
  if (medication == "Amoxycillin With Clavulanic Acid") {
    return AmoxWithClav(weight: weight);
  }
  if (medication == "Azithromycin") {
    return Azithryomycin(weight: weight);
  }
  if (medication == "Cefaclor") {
    return Cefaclor(weight: weight);
  }
  if (medication == "Cefuroxime") {
    return Cefuroxime(weight: weight);
  }
  if (medication == "Cephalexin") {
    return Cephalexin(weight: weight);
  }
  if (medication == "Clarithromycin") {
    return Clarithromycin(weight: weight);
  }
  if (medication == "Erythromycin") {
    return Erythromycin(weight: weight);
  }
  if (medication == "Phenoxymethylpenicillin") {
    return Phenoxymethylpenicillin(weight: weight);
  } else {
    return DefaultMessage();
  }
}
