import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('en');

  Locale get currentLocale => _currentLocale;

  void changeLanguage(Locale newLanguage){
    _currentLocale = newLanguage;
    print(_currentLocale);
    notifyListeners();
  }
}

enum SupportedLanguage {
  english(value: 'en'),
  gujarati(value: 'gu');

  const SupportedLanguage({required this.value});

  final String value;
}
