import 'app_localizations.dart';

/// The translations for Yoruba (`yo`).
class AppLocalizationsYo extends AppLocalizations {
  AppLocalizationsYo([super.locale = 'yo']);

  @override
  String get smartirrigation => 'Smart irrigation';

  @override
  String get humidity => 'Humidity';

  @override
  String get name => 'Orúkọ';

  @override
  String get temperature => 'Temperature';

  @override
  String get email => 'Ìmọ̀ràn';

  @override
  String get emailHint => 'ìmọ̀ràn tàbí orúkọ oníṣe';

  @override
  String get soilmoisture => 'Soil Moisture';

  @override
  String get donthaveanaccount => 'Don\'t have an account';

  @override
  String get welcomebackuser => 'Welcome back User';

  @override
  String get youvebeenmisseddearuser => 'You\'ve been missed dear user';

  @override
  String get signin => 'Sign in';

  @override
  String get settings => 'Ìṣètò';

  @override
  String get register => 'Register';

  @override
  String get changeLanguage => 'Ìyípadà Èdè';

  @override
  String get irrigationstarted => 'Irrigation Started';

  @override
  String get irrigationoff => 'Irrigation OFF';
}

/// The translations for Yoruba, as used in Nigeria (`yo_NG`).
class AppLocalizationsYoNg extends AppLocalizationsYo {
  AppLocalizationsYoNg(): super('yo_NG');

  @override
  String get name => 'Orúkọ';

  @override
  String get email => 'Ìmọ̀ràn';

  @override
  String get emailHint => 'ìmọ̀ràn tàbí orúkọ oníṣe';

  @override
  String get settings => 'Ìṣètò';

  @override
  String get changeLanguage => 'Ìyípadà Èdè';
}
