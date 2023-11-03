import 'package:calendar_app/screens/dashboard/dashboard.dart';
import 'package:calendar_app/screens/splash/splash.dart';
import 'package:calendar_app/utils/configs.dart';

class RouteManger {
  static Route<dynamic>? generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreenUI.routeName:
        return MaterialPageRoute(
          builder: SplashScreenUI.builder,
        );
      case DashBoardUI.routeName:
        return MaterialPageRoute(
          builder: DashBoardUI.builder,
        );
    }
  }

  static initRoute() => SplashScreenUI.routeName;
}
