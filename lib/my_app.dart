part of 'main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
      theme: lightTheme,
      onGenerateRoute: RouteManger.generatedRoute,
      initialRoute: RouteManger.initRoute(),
    );
  }
}
