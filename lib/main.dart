import 'package:calendar_app/firebase_options.dart';
import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/providers/language_provider.dart';
import 'package:calendar_app/router/route_manger.dart';
import 'package:calendar_app/services/preference_helper/pref_service.dart';
import 'package:calendar_app/utils/common_functions.dart';
import 'package:calendar_app/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

part 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _init();
  _setOrientation();
  _setSystemUIOverlayStyle();
  await _initFirebase();
  runApp(MyApp());
}

// init firebase,preference etc
void _init() {
  CalendarPreference.instance.init();
}

void _setOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

void _setSystemUIOverlayStyle() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
  ));
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
