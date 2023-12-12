import 'package:calendar_app/services/preference_helper/pref_service.dart';
import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('en');

  Locale get currentLocale => _currentLocale;

  CalendarPreference calendarPreference = CalendarPreference.instance;

  void changeLanguage(SupportedLanguage newLanguage) {
    _currentLocale = Locale(newLanguage.value);
    calendarPreference.setAppLanguage = newLanguage;
    notifyListeners();
  }

  void init() {
    _currentLocale = Locale(calendarPreference.appLanguage.value);
    notifyListeners();
  }
}

enum SupportedLanguage {
  english(value: 'en'),
  gujarati(value: 'gu'),
  hindi(value: 'hi');

  const SupportedLanguage({required this.value});

  final String value;
}
