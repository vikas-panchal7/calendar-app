

part of 'login.dart';

class LoginScreenUI extends StatelessWidget {
    static const String routeName = "/login";
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      create: (context) => LoginProvider(context: context),
      builder: (context, child) {
        return const LoginScreenUI();
      },
    );
  }
  const LoginScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}