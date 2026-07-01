# DosePilot

DosePilot is a Flutter-based medication dosing reference app focused on weight-based paediatric oral liquid calculations. It provides a searchable catalogue of medicines, displays dose ranges in both `mL` and `mg`, and includes administration notes and medicine-specific cautions where relevant.

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

## Medical disclaimer

- DosePilot is not an official clinical reference, prescribing authority, or medical device.
- The app is provided for informational purposes only and does not replace local protocols, specialist advice, institutional policies, or professional clinical judgment.
- The content may be incomplete, outdated, or inaccurate and must be independently verified before use.
- To the fullest extent permitted by law, the authors, contributors, and distributors accept no liability or responsibility for any loss, injury, claim, damage, adverse outcome, or other consequence arising from use of, reliance on, or inability to use this software.
- No warranty is provided, express or implied, including any warranty of accuracy, completeness, fitness for a particular purpose, merchantability, or availability.

## License

No license file is included in this repository. Add one if you intend to distribute the project publicly.
