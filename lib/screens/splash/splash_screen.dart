part of 'splash.dart';

class SplashScreenUI extends StatelessWidget {
  static const String routeName = "/splash";
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<SplashProvider>(
      create: (context) => SplashProvider(context: context),
      builder: (context, child) {
        return const SplashScreenUI();
      },
    );
  }

  const SplashScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Splash screen",style: context.textTheme.bodyLarge,)),
    );
  }
}
