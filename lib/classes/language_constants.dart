// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String FARSI = 'fa';
const String ARABIC = 'ar';
const String HINDI = 'hi';
const String YORUBA = 'yo';
const String HAUSA = 'ha';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? ENGLISH;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return const Locale(ENGLISH, '');
    case FARSI:
      return const Locale(FARSI, "");
    case ARABIC:
      return const Locale(ARABIC, "");
    case HINDI:
      return const Locale(HINDI, "");
    case YORUBA: 
      return const Locale(YORUBA, "");
    case HAUSA:
      return const Locale(HAUSA, "");
    default:
      return const Locale(ENGLISH, '');
  }
}



