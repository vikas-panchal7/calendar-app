part of 'main.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LanguageProvider>(
              create: (context) => LanguageProvider())
        ],
        builder: (context, child) {
          final provider = Provider.of<LanguageProvider>(context, listen: true);

          return GestureDetector(
            onTap: closeKeyboard,
            child: MaterialApp(
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: ScrollConfiguration(
                      behavior: const ScrollBehavior(
                          androidOverscrollIndicator:
                              AndroidOverscrollIndicator.stretch),
                      child: child!),
                );
              },
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.light,
              theme: lightTheme,
              routes: RouteManger.routes(),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: provider.currentLocale,
              supportedLocales: const [Locale('en'), Locale('gu')],
              initialRoute: RouteManger.initRoute(),
            ),
          );
        });
  }
}
