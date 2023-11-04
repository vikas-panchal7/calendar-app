part of 'splash.dart';

class SplashProvider extends BaseProvider {
  SplashProvider({required super.context});

  init() {
    print("called");
    // logoContainerHeight = context.height;
    Timer.run(changeScreen);
  }

  void changeScreen() {
    if (calendarPreference.userIsLogin) {
      context.navigator.pushNamed(DashBoardUI.routeName);
    } else {
      context.navigator.pushNamed(LoginScreenUI.routeName);
    }
  }

  double logoContainerHeight = 0;
  double logoScale = 2.5;
  Duration logoContainerDuration = const Duration(seconds: 1);
  double buttonOpacity = 0.0;

  navigate({required bool withTimer}) async {
    if (logoContainerHeight == context.height * 0.5) {
      return;
    }
    await Future.delayed(Duration(seconds: withTimer ? 3 : 0), () async {
      logoContainerHeight = context.height * 0.5;
      notifyListeners();
      await Future.delayed(
        logoContainerDuration,
        () {
          buttonOpacity = 1;
        },
      );
    });
  }
}
