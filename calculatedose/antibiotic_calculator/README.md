# StritchPharma

StritchPharma is a Flutter-based medication dosing reference app focused on weight-based paediatric oral liquid calculations. It provides a searchable catalogue of medicines, displays dose ranges in both `mL` and `mg`, and includes administration notes and medication-specific cautions where relevant.

## What the app does

- Search medications by name from a curated list
- Select a medicine and enter a patient weight in kilograms
- View calculated dosing information in `mL` and `mg`
- Review interval and administration guidance for each medicine
- See medicine-specific warnings and notes when applicable

## Included medicines

The current build includes dosing references for:

- Amoxycillin
- Amoxycillin with clavulanic acid
- Azithromycin
- Cefaclor
- Cefuroxime
- Cephalexin
- Clarithromycin
- Erythromycin
- Flucloxacillin
- Fluconazole
- Itraconazole
- Linezolid
- Metronidazole
- Phenoxymethylpenicillin
- Prednisolone
- Rifampicin/Rifampin
- Trimethoprim with sulfamethoxazole

## Project layout

- `lib/main.dart`: application shell, medication search, and dose entry flow
- `lib/message.dart`: switches between default text, validation messages, and dose output
- `lib/dose.dart`: routes a selected medication to the correct builder widget
- `lib/final_message.dart`: reusable dose output widget
- `lib/message_builders/`: medicine-specific dosing screens

## Requirements

- Flutter SDK
- A supported target platform such as Android, iOS, web, or desktop

## Run locally

From the app directory:

```bash
flutter pub get
flutter run
```

If `flutter` is not on your `PATH`, use the full SDK path instead:

```bash
$HOME/flutter/bin/flutter pub get
$HOME/flutter/bin/flutter run
```

## Build for release

```bash
flutter build apk
flutter build ios
flutter build web
```

## Notes

- This app is a clinical reference tool, not a substitute for local prescribing guidance or professional judgement.
- Always verify doses against current institutional protocols and patient-specific factors before use.
- Weight input is limited to numeric values in kilograms.

## License

No license file is included in this repository. Add one if you intend to distribute the project publicly.
