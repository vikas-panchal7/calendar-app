import 'package:calendar_app/utils/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'pref_key.dart';

class CalendarPreference {
  SharedPreferences? prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  bool get userIsLogin => prefs?.getBool(PreferenceKey.userIsLogin) ?? false;

  set userIsLogin(bool status) =>
      prefs?.setBool(PreferenceKey.userIsLogin, status);

String get userType => prefs?.getString(PreferenceKey.userType)?? UserType.user.name;
set userType(String type)=> prefs?.setString(PreferenceKey.userType,type);
}
