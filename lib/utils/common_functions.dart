import 'package:calendar_app/extensions/buildContext_ext.dart';
import 'package:calendar_app/extensions/int_ext.dart';
import 'package:calendar_app/screens/splash/splash.dart';
import 'package:calendar_app/services/preference_helper/pref_service.dart';
import 'package:calendar_app/utils/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

void closeKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

void showSnackBar({required BuildContext context, required String msg, SnackBarType type = SnackBarType.success}) {
  var snackBar = SnackBar(
    content: Text(
      msg,
      style: context.textTheme.bodyLarge?.copyWith(color: context.colorScheme.onBackground),
    ),
    backgroundColor: type == SnackBarType.success ? context.colorScheme.primary : context.colorScheme.error,
    duration: 1.seconds,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void openUrl(String url) async {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    launchUrl(uri);
  }
}

Future<void> logout(BuildContext context) async {
  CalendarPreference.instance.clear();
  await FirebaseAuth.instance.signOut();
  GoogleSignIn().signOut();
  if (context.mounted) {
    context.navigator.pushNamedAndRemoveUntil(SplashScreenUI.routeName, (route) => false);
  }
}


bool isYoutubeUrl(String value){
  if((value.contains('youtu') == false) && (value.contains('yt') == false)){
    return false;
  }else{
    return true;
  }
}
