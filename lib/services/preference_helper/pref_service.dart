import 'package:shared_preferences/shared_preferences.dart';

part 'pref_key.dart';

class CalendarPreference {
  SharedPreferences? prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  bool get userIsLogin => prefs?.getBool(PreferenceKey.userIsLogin) ?? true;

  set userIsLogin(bool status) =>
      prefs?.setBool(PreferenceKey.userIsLogin, status);
}
