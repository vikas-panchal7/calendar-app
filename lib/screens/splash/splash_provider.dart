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

  Future<void> handleGoogleSignIn() async {
    try {
      GoogleSignInAccount? currentUser = await GoogleSignIn().signIn();

      if (currentUser == null) {
        // ignore: use_build_context_synchronously
        showSnackBar(context: context,msg: 'failed', type: SnackBarType.error);
      } else {
        GoogleSignInAuthentication? googleAuth = await currentUser.authentication;
        final credential =  GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        await FirebaseAuth.instance.signInWithCredential(credential);
        checkWhoISLogin(currentUser);



        // Preference.setAuthHeader(authHeader: await currentUser.authHeaders);
        // var parameters = {
        //   "name": '${currentUser.displayName}',
        //   "email": currentUser.email,
        //   "uid": currentUser.id,
        //   "social_type": LoginFrom.google.toString().split(".").last,
        //   "profileImg": currentUser.photoUrl!,
        // };
        // await Preference.setLoginFrom(loginFrom: LoginFrom.google);
        // Get.put(LoginController());
        // Get.find<LoginController>().handleSocialLogin(parameters: parameters);
      }
    } catch (error) {
      print("error: $error");
    }

  }

  Future<void> checkWhoISLogin(GoogleSignInAccount currentUser) async {
      AdminRepository adminRepository = AdminRepository();

      bool isAdmin = await adminRepository.checkIfAdminLoggedIn(gmail: currentUser.email);
      print("isAdmin :: $isAdmin");
      if(isAdmin){
        calendarPreference.userIsLogin = true;
        print("calendarPreference.userIsLogin :: ${calendarPreference.userIsLogin}");
        calendarPreference.userType = UserType.admin.name;
      }else{
        UserRepository userRepository = UserRepository();
        bool isUserLogin = await userRepository.checkIfUserLoggedIn(gmail: currentUser.email);
        if(isUserLogin){
          calendarPreference.userIsLogin = true;
          calendarPreference.userType = UserType.user.name;
        }else{
String userId =   userRepository.getUserDetailId();
          await userRepository.createUser(userName: currentUser.displayName??'', gmail: currentUser.email, loginType: LoginType.googleLogin, id: userId, );
        }

      }

      context.navigator.pushReplacementNamed(DashBoardUI.routeName);
  }
}
