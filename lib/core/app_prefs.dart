// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task_app/core/resources/language_manager.dart';

const String PREFS_KEY_TOKEN = "PREFS_KEY_TOKEN";
const String PREFS_KEY_LANG = "PREFS_KEY_LANG";

class AppPrefs {
  final SharedPreferences _sharedPreferences;
  AppPrefs(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  void setLanguageChanged(LanguageType languageType) {
    _sharedPreferences.setString(PREFS_KEY_LANG, languageType.getValue());
  }

  Future<Locale> getLocal() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.AZERBAIJAN.getValue()) {
      return AZERBAIJAN_LOCAL;
    } else if (currentLanguage == LanguageType.ENGLISH.getValue()) {
      return ENGLISH_LOCAL;
    } else {
      return TURKISH_LOCAL;
    }
  }

  Future<void> setAuthToken(String token) async {
    _sharedPreferences.setString(PREFS_KEY_TOKEN, token);
  }

  Future<String> getAuthToken() async {
    return _sharedPreferences.getString(PREFS_KEY_TOKEN) ?? "";
  }
}
