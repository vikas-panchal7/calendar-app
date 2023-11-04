part of 'splash.dart';

class SplashProvider extends BaseProvider {
  SplashProvider({required super.context});
  init() {
    chnageScreen();
  }

  void chnageScreen() {
    if (getStorageService.userIsLogin) {
      context.navigator.pushNamed(DashBoardUI.routeName);
    } else {
      context.navigator.pushNamed(LoginScreenUI.routeName);
      ;
    }
  }
}
