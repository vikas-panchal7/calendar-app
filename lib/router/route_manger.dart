
import 'package:calendar_app/screens/addBook/add_book.dart';
import 'package:calendar_app/screens/addCalendarData/add_calendar_data.dart';
import 'package:calendar_app/screens/dashboard/dashboard.dart';

import 'package:calendar_app/screens/splash/splash.dart';
import 'package:calendar_app/utils/image_view.dart';
import 'package:flutter/material.dart';

class RouteManger {
  static Map<String, Widget Function(BuildContext)> routes() {
    return {
          SplashScreenUI.routeName: SplashScreenUI.builder,
          DashBoardUI.routeName: DashBoardUI.builder,
          AddBookScreenUI.routeName: AddBookScreenUI.builder,
          AddCalendarDataScreenUI.routeName: AddCalendarDataScreenUI.builder,
          ImageView.routeName: ImageView.builder,

      
      };
  }

  

  static String initRoute() => SplashScreenUI.routeName;
}
