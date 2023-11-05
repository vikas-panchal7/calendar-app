part of 'splash.dart';

class SplashProvider extends BaseProvider {
  SplashProvider({required super.context});

  double? _logoContainerHeight;
  double? get logoContainerHeight => _logoContainerHeight;

  final Duration _logoContainerDuration = 1.seconds;
 
  double _buttonOpacity = 0.0;
  double get buttonOpacity => _buttonOpacity;
  

  void init() {
    // this is call after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigate();
    });
  }

  void navigate() async {
    await Future.delayed(3.seconds, () async {
      if (calendarPreference.userIsLogin) {
        context.navigator.pushReplacementNamed(DashBoardUI.routeName);
      } else {
        _logoContainerHeight = context.height * 0.8;
        notifyListeners();
        await Future.delayed(
          _logoContainerDuration,
          () {
            _buttonOpacity = 1;
            notifyListeners();
          },
        );
      }
    });
  }
}
