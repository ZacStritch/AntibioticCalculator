// ignore_for_file: prefer_const_constructors
import 'package:antibiotic_calculator/medication_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:core';

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

bool calculate = false;
var medForMessage;

final amoxil = Medication(15, 25, 25, 30);
final amoxilForte = Medication(15, 50, 25, 30);
final amoxClavAcid = Medication(7.5, 25, 15, 20);
final amoxClavAcid80 = Medication(22.5, 80, null, null);
final azithromycin = Medication(
    10,
    40,
    5 /*concentration for 4 day treatment / higher dose refer to book!!! can be given over 3 days pending on infec*/,
    null);
final cefaclor = Medication(10, 25, 15, null); /* every 8 hours */
final cefaclor50 = Medication(10, 50, 15, null);
final cefuroxime = Medication(
    10 /*for 3 months-2 years*/,
    25,
    15 /*for 2-12 years*/,
    null); /*Max 125mg for 3-2 & 250mg 2-12 up to 500mg bd has been used | best absorbed with food*/
final cephalexin25 = Medication(6.25, 25, 12.5, null);
final cephalexin50 =
    Medication(6.25, 50, 12.5, null); /*max dose 500mg every 6 hours*/
final clarithromycin = Medication(7.5, 50, null, null); /*max dose 500mg bd */
final erithromycin = Medication(
    10, 40, null, null); /*Give every 6 hours max 4 grams daily for severe inf*/
final erithromycin80 = Medication(10, 80, null, null);
final phenoxymethylpenicillin25 =
    Medication(10, 20, 12.5, null); /*max 500mg, given every 6 hours*/
final phenoxymethylpenicillin30 = Medication(10, 20, 12.5, null);
final phenoxymethylpenicillin50 = Medication(10, 20, 12.5, null);

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
                                setState(() => this.value = value);
                              }),
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
                              doseMessage = "Input a medication and weight.";
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
                          if (value == null || myController.text == "") {
                            doseMessage = "Input a medication and weight";
                          } else if (int.tryParse(myController.text)! >= 200) {
                            setState(() {
                              calculate == false;
                              doseMessage =
                                  "This is not a correct weight, please enter again";
                            });
                          } else {
                            setState(() {
                              calculate == true;
                              dose(value!, myController);
                            });
                          }
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
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        width: 500,
                        child: defaultMessage(),
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

void dose(String medication, TextEditingController controller) {
  double? weight = double.tryParse(controller.text);
  if (medication == "Amoxycillin") {
    double amoxilmL = amoxil.dose! * weight! / amoxil.concentration!;
    double amoxilmg = amoxil.dose! * weight;
    double amoxilRangemL = amoxil.range! * weight / amoxil.concentration!;
    double amoxilRangemg = amoxil.range! * weight;
    double amoxilFortemL =
        amoxilForte.dose! * weight / amoxilForte.concentration!;
    double amoxilFortemg = amoxilForte.dose! * weight;
    double amoxilForteRangemL =
        amoxilForte.range! * weight / amoxilForte.concentration!;
    double amoxilForteRangemg = amoxilForte.range! * weight;
    double amoxilSevere = amoxil.severe! * weight / amoxil.concentration!;
    double amoxilSeveremg = amoxil.severe! * weight;
    double amoxilForteSevere =
        amoxilForte.severe! * weight / amoxilForte.concentration!;
    double amoxilForteSeveremg = amoxilForte.severe! * weight;
    medForMessage ==
        MedProfile(
            medType: "Amoxycillin 125/50",
            range:
                "  ${amoxilmL.toStringAsFixed(2).toString()}mL(${amoxilmg.toStringAsFixed(0).toString()}mg) to ${amoxilRangemL.toStringAsFixed(2).toString()}mL(${amoxilRangemg.toStringAsFixed(0).toString()}mg)",
            takeMax: "Every 8 hours (Max. 500mg)",
            severe: "",
            extraInformation: "");
    return;
  }
}

Widget defaultMessage() {
  if (calculate == false) {
    return Text("This is not okay");
  } else {
    return medForMessage();
  }
}
