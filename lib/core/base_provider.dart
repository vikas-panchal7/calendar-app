import 'package:calendar_app/services/preference_helper/pref_service.dart';
import 'package:flutter/material.dart';

class BaseProvider<T extends Object?> extends ChangeNotifier {
  BaseProvider({required this.context});

  final BuildContext context;
  final CalendarPreference calendarPreference = CalendarPreference.instance;

  Future<T> processApi<T>({required Future<T> Function() process, required Function(bool) loadingHandler}) async {
    loadingHandler.call(true);
    var result = await process.call();
    loadingHandler.call(false);
    notifyListeners();
    return result;
  }
}
