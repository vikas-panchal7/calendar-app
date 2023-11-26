import 'package:calendar_app/utils/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'pref_key.dart';

class CalendarPreference {
  CalendarPreference._();
  static final CalendarPreference _instance = CalendarPreference._();
  static CalendarPreference get instance => _instance;



  static SharedPreferences? prefs;

     Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  bool get userIsLogin => prefs?.getBool(PreferenceKey.userIsLogin) ?? false;

  set setUserIsLogin(bool status) => prefs?.setBool(PreferenceKey.userIsLogin, status);



  UserType get userType => UserType.values
      .where((element) => element.name == (prefs?.getString(PreferenceKey.userType) ?? UserType.user.name))
      .first;

  set setUserType(UserType type) => prefs?.setString(PreferenceKey.userType, type.name);


  bool get isAdminLogin {

    print(prefs?.getString(PreferenceKey.userType));
    return userType == UserType.admin;
  }

  void clear() {
    prefs?.clear();
  }
}
