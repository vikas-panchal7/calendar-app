part of 'splash.dart';

class SplashScreenUI extends StatelessWidget {
  static const String routeName = "/splash";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<SplashProvider>(
      create: (context) => SplashProvider(context: context)..init(),
      // child: Consumer<SplashProvider>(builder: (context, value, child) => const SplashScreenUI(),),
      builder: (context, child) {
        return Consumer<SplashProvider>(builder: (context, value, child) => const SplashScreenUI(),);
      },
    );
  }

  const SplashScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Splash screen",
          style: context.textTheme.bodyLarge,
        ),
      ),
    );
  }
}
