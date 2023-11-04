import 'package:calendar_app/screens/dashboard/dashboard.dart';
import 'package:calendar_app/screens/login/login.dart';
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
      case LoginScreenUI.routeName:
        return MaterialPageRoute(
          builder: LoginScreenUI.builder,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(body: Center(child: Text("Page Not Found"),),),
        );
    }
  }

  static initRoute() => SplashScreenUI.routeName;
}
