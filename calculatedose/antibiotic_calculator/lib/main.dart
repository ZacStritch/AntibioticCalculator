// ignore_for_file: prefer_const_constructors

import 'package:antibiotic_calculator/message_builders/all_builders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:core';
import 'default_message.dart';
import 'message.dart';

Icon iconSelect = Icon(Icons.search);
bool calculate = false;
bool clearText = false;
bool hidden = true;
final TextEditingController medController = TextEditingController();

void main() {
  runApp(const MaterialApp(home: AntiDose()));
}

class AntiDose extends StatefulWidget {
  const AntiDose({Key? key}) : super(key: key);

  @override
  _AntiDoseState createState() => _AntiDoseState();
}

class _AntiDoseState extends State<AntiDose> {
  final List<Map<String, dynamic>> _allMedication = [
    {"name": "Amoxycillin", "class": "Penicillins"},
    {"name": "Azithromycin", "class": "Macrolides"},
    {"name": "Amoxycillin With Clavulanic Acid", "class": "Penicillins"},
    {"name": "Cefaclor", "class": "Cephalosporins"},
    {"name": "Cefuroxime", "class": "Cephalossporins"},
    {"name": "Cephalexin", "class": "Cephalosporins"},
    {"name": "Clarithromycin", "class": "Macrolides"},
    {"name": "Erythromycin", "class": "Macrolides"},
    {"name": "Phenoxymethylpenicillin", "class": "Penicillins"},
    {"name": "Metronidazole", "class": "Nitroimidazoles"},
    {"name": "Flucloxacillin", "class": "Penicillins"},
    {"name": "Rifampicin/Rifampin", "class": "Rifamycins"},
    {"name": "Linezolid", "class": "Oxazolidinone Antibacterial"},
    {"name": "Fluconazole", "class": "Azoles"},
    {"name": "Itraconazole", "class": "Azoles"},
    {"name": "Prednisolone", "class": "Corticosteroids"},
    {"name": "Trimethoprim With Sulfamethoxazole", "class": "Antibacterial"},
  ];

  String? value;
  String? medChoice;
  String doseMessage = "Input a medication and weight.";
  bool textChange = false;
  int showFlex = 1;

  late FocusNode searchFocus;
  late FocusNode weightFocus;

  final myController = TextEditingController();

  List<Map<String, dynamic>> _foundMedication = [];

  @override
  void initState() {
    FocusManager.instance.primaryFocus?.unfocus();
    _foundMedication = _allMedication;
    super.initState();
    searchFocus = FocusNode();
    weightFocus = FocusNode();
  }

  void _runSearch(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all medications
      results = _allMedication;
    } else {
      results = _allMedication
          .where((medication) => medication["name"]
              .toLowerCase()
              .startsWith(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      _foundMedication = results;
    });
  }

  @override
  void dispose() {
    super.dispose();
    searchFocus.dispose();
    weightFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _allMedication.sort((a, b) => a["name"].compareTo(b["name"]));
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            hidden = true;
            if (medController.text == "") {
              iconSelect = Icon(Icons.search);
            }
            showFlex = 1;
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
              child: Visibility(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: 80),
                      Flexible(
                        flex: showFlex,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              TextField(
                                focusNode: searchFocus,
                                style: TextStyle(fontSize: 18),
                                controller: medController,
                                onTap: () {
                                  medController.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset: medController.text.length));
                                  setState(() {
                                    if (medController.text != "") {
                                      iconSelect = Icon(Icons.clear);
                                    }
                                    calculate = false;
                                    hidden = false;
                                    showFlex = 6;
                                  });
                                },
                                onChanged: (value) {
                                  setState(() {
                                    iconSelect = Icon(Icons.clear);
                                    _runSearch(value);
                                    calculate = false;
                                  });
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  suffixStyle: TextStyle(color: Colors.black),
                                  labelStyle: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  hintText: 'Search',
                                  hintStyle: TextStyle(fontSize: 18),
                                  suffixIcon: IconButton(
                                    icon: iconSelect,
                                    onPressed: () {
                                      setState(() {
                                        hidden = false;
                                        showFlex = 1;
                                        _runSearch("");
                                        iconSelect = Icon(Icons.search);
                                        medController.clear();
                                        searchFocus.requestFocus();
                                        medController.selection =
                                            TextSelection.fromPosition(
                                                TextPosition(offset: 0));
                                      });
                                    },
                                  ),
                                ),
                              ),
                              if (hidden != true)
                                const SizedBox(
                                  height: 10,
                                ),
                              if (hidden != true)
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.55,
                                  child: _foundMedication.isNotEmpty
                                      ? ListView.builder(
                                          shrinkWrap: true,
                                          keyboardDismissBehavior:
                                              ScrollViewKeyboardDismissBehavior
                                                  .onDrag,
                                          itemCount: _foundMedication.length,
                                          itemBuilder: (context, index) => Card(
                                            key: ValueKey(
                                                _foundMedication[index]["id"]),
                                            color: Colors.white,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 7),
                                            child: ListTile(
                                              onTap: () {
                                                weightFocus.requestFocus();
                                                setState(() {
                                                  iconSelect =
                                                      Icon(Icons.clear);
                                                  hidden = true;
                                                  showFlex = 1;
                                                  medController.text =
                                                      "${_foundMedication[index]['name']}";
                                                  medController.selection =
                                                      TextSelection.fromPosition(
                                                          TextPosition(
                                                              offset:
                                                                  medController
                                                                      .text
                                                                      .length));
                                                });
                                              },
                                              title: Text(
                                                "${_foundMedication[index]['name']}",
                                                style: TextStyle(),
                                              ),
                                              subtitle: Text(
                                                  "${_foundMedication[index]['class']}"),
                                            ),
                                          ),
                                        )
                                      : const Text(
                                          'No Medication Found',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      if (hidden == true)
                        Flexible(
                          flex: 1,
                          child: IntrinsicHeight(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    flex: 5,
                                    child: TextFormField(
                                      focusNode: weightFocus,
                                      onChanged: (myController) {
                                        setState(() {
                                          hidden = true;
                                          calculate = false;
                                        });
                                      },
                                      controller: myController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(3),
                                      ],
                                      decoration: (InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        suffixStyle:
                                            TextStyle(color: Colors.black),
                                        suffixText: 'kg',
                                        labelStyle: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                        hintText: 'Input Weight',
                                        hintStyle: TextStyle(fontSize: 18),
                                      )),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    flex: 3,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                        setState(() {
                                          calculate = true;
                                          Message(
                                              medication: value ?? "",
                                              input: int.tryParse(
                                                      myController.text) ??
                                                  0);
                                        });
                                      },
                                      child: Text(
                                        'Calculate',
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        primary: Color(0xFF0080FF),
                                        textStyle: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      SizedBox(height: 20),
                      if (hidden == true)
                        Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.all(10),
                            width: 500,
                            child: Message(
                                medication: medController.text,
                                input: int.tryParse(myController.text) ?? 0),
                          ),
                        ),
                      SizedBox(height: 20),
                    ]),
              ),
            ),
          ),
        ));
  }
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
  }
  if (medication == "Metronidazole") {
    return Metronidazole(weight: weight);
  }
  if (medication == "Flucloxacillin") {
    return Flucloxacillin(weight: weight);
  }
  if (medication == "Rifampicin/Rifampin") {
    return Rifampicin(weight: weight);
  }
  if (medication == "Linezolid") {
    return Linezolid(weight: weight);
  }
  if (medication == "Fluconazole") {
    return Fluconazole(weight: weight);
  }
  if (medication == "Itraconazole") {
    return Itraconazole(weight: weight);
  }
  if (medication == "Prednisolone") {
    return Prednisolone(weight: weight);
  }
  if (medication == "Trimethoprim With Sulfamethoxazole") {
    return TrimethoprimSulfamethoxazole(weight: weight);
  } else {
    return DefaultMessage();
  }
}

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
