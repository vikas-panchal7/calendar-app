
import 'package:calendar_app/screens/dashboard/dashboard.dart';

import 'package:calendar_app/screens/splash/splash.dart';
import 'package:flutter/material.dart';

class RouteManger {
  static Map<String, Widget Function(BuildContext)> routes() {
    return {
          SplashScreenUI.routeName: SplashScreenUI.builder,
          DashBoardUI.routeName: DashBoardUI.builder,
         
      
      };
  }

  

  static String initRoute() => SplashScreenUI.routeName;
}
