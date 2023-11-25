import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier {
  final Locale _currentLocale = const Locale('en');

  Locale get currentLocale => _currentLocale;
}

enum SupportedLanguage {
  english(value: 'en'),
  gujarati(value: 'gu');

  const SupportedLanguage({required this.value});

  final String value;
}
