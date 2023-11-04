import 'package:calendar_app/services/preference_helper/pref_service.dart';
import 'package:calendar_app/utils/configs.dart';

class BaseProvider<T extends Object?> extends ChangeNotifier {
  BaseProvider({required this.context});

  final BuildContext context;
  final CalendarPreference calendarPreference = CalendarPreference();

  Future<T> processApi<T>({required Future<T> Function() process, required Function(bool) loadingHandler}) async {
    loadingHandler.call(true);
    var result = process.call();
    loadingHandler.call(false);
    notifyListeners();
    return result;
  }
}
