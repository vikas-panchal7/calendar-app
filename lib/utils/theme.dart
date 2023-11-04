import 'package:calendar_app/utils/configs.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  //dialog theme
  dialogTheme: const DialogTheme(elevation: 0, shadowColor: Colors.transparent),
  // appbar theme
  appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFE89115),
      elevation: 0,
      scrolledUnderElevation: 3,
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 18, fontFamily: "Inter", color: Colors.white, fontWeight: FontWeight.w700),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      )
      // surfaceTintColor: AppColors.darkGrey,
      ),

//scaffold color
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "Inter",
  colorScheme: ColorScheme(
      background: const Color(0xFFE5E5E5),
      primary: const Color(0xFFE89115),
      onPrimary: const Color(0xFFE89115),
      brightness: Brightness.light,
      secondary: const Color(0xFFE3762F),
      onSecondary: const Color(0xFFE3762F),
      error: Colors.red,
      onError: Colors.red,
      onBackground: Colors.white,
      surface: const Color(0xFF787880).withOpacity(0.20),
      onSurface: const Color(0xFF787880).withOpacity(0.8),
      onTertiary: Colors.black),
  textTheme: const TextTheme(
    labelSmall: TextStyle(fontSize: 11, fontFamily: "Inter", color: Colors.black),
    labelMedium: TextStyle(fontSize: 12, fontFamily: "Inter", color: Colors.black),
    bodySmall: TextStyle(fontSize: 12, fontFamily: "Inter", color: Colors.black),
    bodyMedium: TextStyle(fontSize: 14, fontFamily: "Inter", color: Colors.black),
    titleSmall: TextStyle(fontSize: 14, fontFamily: "Inter", color: Colors.black),
    bodyLarge: TextStyle(fontSize: 16, fontFamily: "Inter", color: Colors.black),
    titleMedium: TextStyle(fontSize: 18, fontFamily: "Inter", color: Colors.black),
    labelLarge: TextStyle(fontSize: 20, fontFamily: "Inter", color: Colors.black),
    titleLarge: TextStyle(fontSize: 22, fontFamily: "Inter", color: Colors.black),
    displaySmall: TextStyle(fontSize: 24, fontFamily: "Inter", color: Colors.black),
    displayMedium: TextStyle(fontSize: 26, fontFamily: "Inter", color: Colors.black),
    displayLarge: TextStyle(fontSize: 28, fontFamily: "Inter", color: Colors.black),
    headlineSmall: TextStyle(fontSize: 30, fontFamily: "Inter", color: Colors.black),
    headlineMedium: TextStyle(fontSize: 32, fontFamily: "Inter", color: Colors.black),
    headlineLarge: TextStyle(fontSize: 34, fontFamily: "Inter", color: Colors.black),
  ),
);
ThemeData darkTheme = ThemeData.dark();
