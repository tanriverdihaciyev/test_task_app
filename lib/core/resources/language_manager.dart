// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum LanguageType { ENGLISH, AZERBAIJAN, TURKISH }

const String AZERBAIJAN = "az";
const String TURKISH = "tr";
const String ENGLISH = "en";
const String ASSETS_PATH_LOCALISATIONS = "assets/translations";
const Locale AZERBAIJAN_LOCAL = Locale("az", "AZ");
const Locale TURKISH_LOCAL = Locale("tr", "TR");
const Locale ENGLISH_LOCAL = Locale("en", "US");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.AZERBAIJAN:
        return AZERBAIJAN;
      case LanguageType.TURKISH:
        return TURKISH;
      case LanguageType.ENGLISH:
        return ENGLISH;
    }
  }
}
