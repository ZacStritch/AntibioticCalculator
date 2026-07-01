import 'package:flutter/material.dart';

import 'default_message.dart';
import 'message_builders/all_builders.dart';

Widget dose(String medication, int weight) {
  switch (medication) {
    case 'Amoxycillin':
      return Amoxycillin(weight: weight);
    case 'Amoxycillin With Clavulanic Acid':
      return AmoxWithClav(weight: weight);
    case 'Azithromycin':
      return Azithromycin(weight: weight);
    case 'Cefaclor':
      return Cefaclor(weight: weight);
    case 'Cefuroxime':
      return Cefuroxime(weight: weight);
    case 'Cephalexin':
      return Cephalexin(weight: weight);
    case 'Clarithromycin':
      return Clarithromycin(weight: weight);
    case 'Erythromycin':
      return Erythromycin(weight: weight);
    case 'Phenoxymethylpenicillin':
      return Phenoxymethylpenicillin(weight: weight);
    case 'Metronidazole':
      return Metronidazole(weight: weight);
    case 'Flucloxacillin':
      return Flucloxacillin(weight: weight);
    case 'Rifampicin/Rifampin':
      return Rifampicin(weight: weight);
    case 'Linezolid':
      return Linezolid(weight: weight);
    case 'Fluconazole':
      return Fluconazole(weight: weight);
    case 'Itraconazole':
      return Itraconazole(weight: weight);
    case 'Prednisolone':
      return Prednisolone(weight: weight);
    case 'Trimethoprim With Sulfamethoxazole':
      return TrimethoprimSulfamethoxazole(weight: weight);
    default:
      return const DefaultMessage();
  }
}
