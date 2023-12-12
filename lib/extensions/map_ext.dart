import 'package:calendar_app/providers/language_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

extension Ext on Map {
  String translate(final BuildContext context) {
    Locale currentLocale = context.read<LanguageProvider>().currentLocale;
    return this[currentLocale.languageCode]??'';
  }

  String customTranslate(final SupportedLanguage language) {
    return this[language.value]??'';
  }
}
