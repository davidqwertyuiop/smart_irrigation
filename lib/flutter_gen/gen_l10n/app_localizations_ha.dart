import 'app_localizations.dart';

/// The translations for Hausa (`ha`).
class AppLocalizationsHa extends AppLocalizations {
  AppLocalizationsHa([super.locale = 'ha']);

  @override
  String get smartirrigation => 'Smart irrigation';

  @override
  String get humidity => 'Humidity';

  @override
  String get name => 'Suna';

  @override
  String get temperature => 'Temperature';

  @override
  String get email => 'Imel';

  @override
  String get emailHint => 'imel ko sunan mai amfani';

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
  String get settings => 'Saituna';

  @override
  String get register => 'Register';

  @override
  String get changeLanguage => 'Canza Harshe';

  @override
  String get irrigationstarted => 'Irrigation Started';

  @override
  String get irrigationoff => 'Irrigation OFF';
}

/// The translations for Hausa, as used in Nigeria (`ha_NG`).
class AppLocalizationsHaNg extends AppLocalizationsHa {
  AppLocalizationsHaNg(): super('ha_NG');

  @override
  String get name => 'Suna';

  @override
  String get email => 'Imel';

  @override
  String get emailHint => 'imel ko sunan mai amfani';

  @override
  String get settings => 'Saituna';

  @override
  String get changeLanguage => 'Canza Harshe';
}
