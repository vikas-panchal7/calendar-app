import 'package:calendar_app/utils/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'pref_key.dart';

class CalendarPreference {
  static SharedPreferences? prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  bool get userIsLogin => prefs?.getBool(PreferenceKey.userIsLogin) ?? false;

  // set userIsLogin(bool status) => prefs?.setBool(PreferenceKey.userIsLogin, status);

  Future<void> setIsUserLogin(bool status) async {
    await prefs?.setBool(PreferenceKey.userIsLogin, status);
  }

  UserType get userType => UserType.values
      .where((element) => element.name == (prefs?.getString(PreferenceKey.userType) ?? UserType.user.name))
      .first;

  // set userType(UserType type) => prefs?.setString(PreferenceKey.userType, type.name);

  Future<void> setUserType(UserType type) async {
    await prefs?.setString(PreferenceKey.userType, type.name);
  }

  bool get isAdminLogin => userType == UserType.admin;
}
