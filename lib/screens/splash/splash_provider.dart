part of 'splash.dart';

class SplashProvider extends BaseProvider {
  SplashProvider({required super.context, required this.loadingDialogHandler}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigate();
    });
  }

  double? _logoContainerHeight;

  double? get logoContainerHeight => _logoContainerHeight;

  final Duration _logoContainerDuration = 1.seconds;

  double _buttonOpacity = 0.0;

  double get buttonOpacity => _buttonOpacity;

  LoadingDialogHandler loadingDialogHandler;

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

  Future<void> handleGoogleSignIn() async {
    bool? result = await processApi(
        process: () async {
          try {
            GoogleSignInAccount? currentUser = await GoogleSignIn().signIn();

            if (currentUser != null) {
              GoogleSignInAuthentication? googleAuth =
                  await currentUser.authentication;
              final credential = GoogleAuthProvider.credential(
                  accessToken: googleAuth.accessToken,
                  idToken: googleAuth.idToken);
              await FirebaseAuth.instance.signInWithCredential(credential);
              await checkWhoISLogin(currentUser);
              return true;
            }
            return false;
          } catch (error) {
            debugPrint('error: $error');
            return false;
          }
        },
        loadingHandler: loadingDialogHandler.handleBgDialog);

    if (context.mounted && (result ?? false)) {
      context.navigator.pushReplacementNamed(DashBoardUI.routeName);
    }
  }

  Future<void> checkWhoISLogin(GoogleSignInAccount currentUser) async {
    AdminRepository adminRepository = AdminRepository();

    bool isAdmin =
        await adminRepository.checkIfAdminLoggedIn(gmail: currentUser.email);
    if (isAdmin) {
      // await calendarPreference.setIsUserLogin(true);
      calendarPreference.setUserIsLogin = true;
      calendarPreference.setUserType = UserType.admin;
    } else {
      UserRepository userRepository = UserRepository();
      bool isUserLogin =
          await userRepository.checkIfUserLoggedIn(gmail: currentUser.email);
      if (isUserLogin) {
        calendarPreference.setUserIsLogin = true;
        calendarPreference.setUserType = UserType.user;
      } else {
        String userId = userRepository.getUserDetailId();
        await userRepository.createUser(
          userName: currentUser.displayName ?? '',
          gmail: currentUser.email,
          loginType: LoginType.googleLogin,
          id: userId,
        );
        calendarPreference.setUserIsLogin = true;
        calendarPreference.setUserType = UserType.user;
      }
    }
    calendarPreference.setUserId = currentUser.email;
    calendarPreference.setUserName = currentUser.displayName ?? '';
  }
}
