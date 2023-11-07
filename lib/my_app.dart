part of 'main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: closeKeyboard,
      child: MaterialApp(
        builder: (context, child) {
          return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: ScrollConfiguration(
          // ignore: deprecated_member_use
            behavior: const ScrollBehavior(androidOverscrollIndicator: AndroidOverscrollIndicator.stretch),
            child: child!),
      );

        },
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: lightTheme,
        routes: RouteManger.routes(),

        initialRoute: RouteManger.initRoute(),
      ),
    );
  }
}
