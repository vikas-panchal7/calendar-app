import 'package:calendar_app/screens/addBook/add_book.dart';
import 'package:calendar_app/screens/addCalendarData/add_calendar_data.dart';
import 'package:calendar_app/screens/addNews/add_news.dart';
import 'package:calendar_app/screens/dashboard/dashboard.dart';
import 'package:calendar_app/screens/donateUs/donate_us.dart';
import 'package:calendar_app/screens/pdf_viewer/pdf_viewer.dart';

import 'package:calendar_app/screens/splash/splash.dart';
import 'package:calendar_app/screens/userList/user_list.dart';
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
      AddNewsScreenUI.routeName: AddNewsScreenUI.builder,
      DonateUsScreenUI.routeName: DonateUsScreenUI.builder,
      CustomPdfView.routeName: CustomPdfView.builder,
      UserListScreenUI.routeName: UserListScreenUI.builder,
    };
  }

  static String initRoute() => SplashScreenUI.routeName;
}
