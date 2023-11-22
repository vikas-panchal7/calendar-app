part of 'splash.dart';

class SplashScreenUI extends StatefulWidget {
  static const String routeName = '/splash';

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<SplashProvider>(
      create: (context) => SplashProvider(context: context),
      builder: (context, child) {
        return Consumer<SplashProvider>(
          builder: (context, value, child) => const SplashScreenUI(),
        );
      },
    );
  }

  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI>
    with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;
  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  @override
  void dispose() {
    controller?.dispose();

    super.dispose();
  }

  void initAnimation() {
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600),
        lowerBound: .85)
      ..repeat(reverse: true);
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(
      builder: (context, splashProvider, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor:
                  splashProvider.logoContainerHeight == context.height * 0.8
                      ? context.colorScheme.background
                      : context.colorScheme.primary),
          child: Scaffold(
            backgroundColor: context.colorScheme.primary,
            body: SizedBox(
              height: context.height,
              width: context.width,
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: 500.milliseconds,
                    height:
                        (splashProvider.logoContainerHeight ?? context.height),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        splashProvider.logoContainerHeight ==
                                context.height * 0.8
                            ? Assets.temp.appLogo
                                .image(height: context.height * .2)
                            : ScaleTransition(
                                scale: animation!,
                                child: Assets.temp.appLogo
                                    .image(height: context.height * .2)),
                        const Gap(15),
                        Text(
                          context.l10n.calendarApp,
                          style: context.textTheme.displaySmall?.copyWith(
                              color: context.colorScheme.onSecondary,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: context.width,
                      decoration: BoxDecoration(
                          color: context.colorScheme.background,
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(24))),
                      child: AnimatedOpacity(
                        opacity: splashProvider.buttonOpacity,
                        duration: 100.milliseconds,
                        child: Center(
                          child: CommonButton.cupertino(
                            padding: EdgeInsets.symmetric(
                                horizontal: context.width * .08),
                            onTap: splashProvider.handleGoogleSignIn,
                            child: Container(
                              padding: EdgeInsets.all(
                                   context.width * .025),
                              
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: context.colorScheme.onBackground),
                              child: Row(
                                children: [
                                  Container(
                                      height: 40,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color:
                                              context.colorScheme.background,
                                          shape: BoxShape.circle),
                                      child: Assets.icons.icGoogle.image()),
                                  Gap(context.width * .05),
                                  FittedBox(
                                    child: Text(
                                      AppStrings.signInWithGoogle,
                                      style: context.textTheme.bodyLarge
                                          ?.copyWith(
                                              color: context
                                                  .colorScheme.onSecondary,
                                              fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
