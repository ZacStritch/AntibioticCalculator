import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'message.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);
  runApp(const AntiDoseApp());
}

class AntiDoseApp extends StatelessWidget {
  const AntiDoseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StritchPharma',
      theme: ThemeData(
        primaryColor: const Color(0xFF0080FF),
        scaffoldBackgroundColor: const Color(0xFFDDEDED),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0080FF),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const AntiDose(),
    );
  }
}

class MedicationOption {
  const MedicationOption({
    required this.name,
    required this.group,
  });

  final String name;
  final String group;
}

const List<MedicationOption> _medications = <MedicationOption>[
  MedicationOption(name: 'Amoxycillin', group: 'Penicillins'),
  MedicationOption(name: 'Amoxycillin With Clavulanic Acid', group: 'Penicillins'),
  MedicationOption(name: 'Azithromycin', group: 'Macrolides'),
  MedicationOption(name: 'Cefaclor', group: 'Cephalosporins'),
  MedicationOption(name: 'Cefuroxime', group: 'Cephalosporins'),
  MedicationOption(name: 'Cephalexin', group: 'Cephalosporins'),
  MedicationOption(name: 'Clarithromycin', group: 'Macrolides'),
  MedicationOption(name: 'Erythromycin', group: 'Macrolides'),
  MedicationOption(name: 'Flucloxacillin', group: 'Penicillins'),
  MedicationOption(name: 'Fluconazole', group: 'Azoles'),
  MedicationOption(name: 'Itraconazole', group: 'Azoles'),
  MedicationOption(
      name: 'Linezolid', group: 'Oxazolidinone Antibacterial'),
  MedicationOption(name: 'Metronidazole', group: 'Nitroimidazoles'),
  MedicationOption(
      name: 'Phenoxymethylpenicillin', group: 'Penicillins'),
  MedicationOption(name: 'Prednisolone', group: 'Corticosteroids'),
  MedicationOption(name: 'Rifampicin/Rifampin', group: 'Rifamycins'),
  MedicationOption(
      name: 'Trimethoprim With Sulfamethoxazole', group: 'Antibacterial'),
];

class AntiDose extends StatefulWidget {
  const AntiDose({Key? key}) : super(key: key);

  @override
  State<AntiDose> createState() => _AntiDoseState();
}

class _AntiDoseState extends State<AntiDose> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  final FocusNode _weightFocus = FocusNode();

  late List<MedicationOption> _foundMedication;
  bool _calculatePressed = false;
  bool _showSuggestions = false;

  @override
  void initState() {
    super.initState();
    _foundMedication = _sortedMedication();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _weightController.dispose();
    _searchFocus.dispose();
    _weightFocus.dispose();
    super.dispose();
  }

  List<MedicationOption> _sortedMedication([Iterable<MedicationOption>? source]) {
    final List<MedicationOption> medications =
        List<MedicationOption>.from(source ?? _medications);
    medications.sort((MedicationOption a, MedicationOption b) =>
        a.name.compareTo(b.name));
    return medications;
  }

  void _searchMedication(String query) {
    final String normalizedQuery = query.trim().toLowerCase();
    final List<MedicationOption> results = normalizedQuery.isEmpty
        ? _sortedMedication()
        : _sortedMedication(_medications.where((MedicationOption medication) {
            return medication.name.toLowerCase().contains(normalizedQuery);
          }));

    setState(() {
      _foundMedication = results;
      _showSuggestions = true;
      _calculatePressed = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _foundMedication = _sortedMedication();
      _showSuggestions = true;
      _calculatePressed = false;
    });
    _searchFocus.requestFocus();
  }

  void _selectMedication(MedicationOption medication) {
    setState(() {
      _searchController.text = medication.name;
      _searchController.selection = TextSelection.collapsed(
        offset: medication.name.length,
      );
      _showSuggestions = false;
      _calculatePressed = false;
    });
    _weightFocus.requestFocus();
  }

  void _calculate() {
    FocusScope.of(context).unfocus();
    setState(() {
      _calculatePressed = true;
      _showSuggestions = false;
    });
  }

  void _dismissSuggestions() {
    if (!_showSuggestions) {
      return;
    }
    setState(() {
      _showSuggestions = false;
    });
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _dismissSuggestions,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(
            'StritchPharma',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
            child: Column(
              children: <Widget>[
                TextField(
                  focusNode: _searchFocus,
                  controller: _searchController,
                  style: const TextStyle(fontSize: 18),
                  textInputAction: TextInputAction.next,
                  onTap: () {
                    setState(() {
                      _showSuggestions = true;
                      _calculatePressed = false;
                    });
                    _searchController.selection = TextSelection.collapsed(
                      offset: _searchController.text.length,
                    );
                  },
                  onChanged: _searchMedication,
                  onSubmitted: (_) => _weightFocus.requestFocus(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _searchController.text.isEmpty
                            ? Icons.search
                            : Icons.clear,
                      ),
                      onPressed: _searchController.text.isEmpty
                          ? () {
                              setState(() {
                                _showSuggestions = true;
                                _calculatePressed = false;
                              });
                              _searchFocus.requestFocus();
                            }
                          : _clearSearch,
                    ),
                  ),
                ),
                if (_showSuggestions) ...<Widget>[
                  const SizedBox(height: 10),
                  SizedBox(
                    height: screenHeight * 0.34,
                    child: _foundMedication.isEmpty
                        ? const Center(
                            child: Text(
                              'No medication found',
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        : ListView.separated(
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            itemCount: _foundMedication.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 8),
                            itemBuilder: (BuildContext context, int index) {
                              final MedicationOption medication =
                                  _foundMedication[index];
                              return Card(
                                key: ValueKey<String>(
                                    '${medication.name}-$index'),
                                color: Colors.white,
                                child: ListTile(
                                  onTap: () => _selectMedication(medication),
                                  title: Text(medication.name),
                                  subtitle: Text(medication.group),
                                ),
                              );
                            },
                          ),
                  ),
                ],
                const SizedBox(height: 12),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: TextFormField(
                        focusNode: _weightFocus,
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        onChanged: (_) {
                          setState(() {
                            _calculatePressed = false;
                          });
                        },
                        onFieldSubmitted: (_) => _calculate(),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(3),
                        ],
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Input Weight',
                          suffixText: 'kg',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 56,
                        child: ElevatedButton(
                          onPressed: _calculate,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: const Color(0xFF0080FF),
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          child: const Text('Calculate'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SingleChildScrollView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Message(
                        medication: _searchController.text,
                        input: int.tryParse(_weightController.text) ?? 0,
                        shouldCalculate: _calculatePressed,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
