import 'package:calendar_app/providers/language_provider.dart';
import 'package:calendar_app/utils/enums.dart';
import 'package:flutter/material.dart';
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

  set setUserIsLogin(bool status) =>
      prefs?.setBool(PreferenceKey.userIsLogin, status);


  bool get tempUserIsLogin => prefs?.getBool(PreferenceKey.tempUserIsLogin) ?? false;

  set setTempUserIsLogin(bool status) =>
      prefs?.setBool(PreferenceKey.tempUserIsLogin, status);

  UserType get userType => UserType.values
      .where((element) =>
          element.name ==
          (prefs?.getString(PreferenceKey.userType) ?? UserType.user.name))
      .first;

  set setUserType(UserType type) =>
      prefs?.setString(PreferenceKey.userType, type.name);

  String get userName => prefs?.getString(PreferenceKey.userName) ?? '';

  set setUserName(String userName) =>
      prefs?.setString(PreferenceKey.userName, userName);

  String get userId => prefs?.getString(PreferenceKey.userId) ?? '';

  set setUserId(String userId) =>
      prefs?.setString(PreferenceKey.userId, userId);

  bool get isAdminLogin {
    return userType == UserType.admin;
  }

  set setAppLanguage(SupportedLanguage lang) =>
      prefs?.setString(PreferenceKey.appLanguage, lang.value);

  SupportedLanguage get appLanguage => SupportedLanguage.values
      .where((element) =>
          element.value ==
          (prefs?.getString(PreferenceKey.appLanguage) ??
              SupportedLanguage.english.value))
      .first;

  void clear() {
    SupportedLanguage lang = appLanguage;
    prefs?.clear();
    setAppLanguage = lang;
  }
}
