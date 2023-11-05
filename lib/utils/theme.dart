import 'package:calendar_app/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  //dialog theme
  dialogTheme: const DialogTheme(elevation: 0, shadowColor: Colors.transparent),
  // appbar theme
  appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF445CFE),
      elevation: 0,
      scrolledUnderElevation: 3,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontSize: 18,
          fontFamily: FontFamily.inter,
          color: Colors.white,
          fontWeight: FontWeight.w700),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      )
      // surfaceTintColor: AppColors.darkGrey,
      ),

//scaffold color
  scaffoldBackgroundColor: const Color(0xFFFBFBFB),
  fontFamily: FontFamily.inter,
  colorScheme: ColorScheme(
      background:  const Color(0xFFFBFBFB),
      primary: const Color(0xFF445CFE),
      onPrimary: const Color(0xFFE7F2FF),
      brightness: Brightness.light,
      secondary: const Color(0xFF8E9FFF),
      onSecondary: const Color(0xFFFA5FA1),
      error: Colors.red,
      onError: Colors.red,
      onBackground: Colors.white,
      surface: const Color(0xFF787880).withOpacity(0.20),
      onSurface: const Color(0xFF787880).withOpacity(0.8),
      onTertiary: Colors.black),
  textTheme: const TextTheme(
    labelSmall: TextStyle(
        fontSize: 11, fontFamily: FontFamily.inter, color: Colors.black),
    labelMedium: TextStyle(
        fontSize: 12, fontFamily: FontFamily.inter, color: Colors.black),
    bodySmall: TextStyle(
        fontSize: 12, fontFamily: FontFamily.inter, color: Colors.black),
    bodyMedium: TextStyle(
        fontSize: 14, fontFamily: FontFamily.inter, color: Colors.black),
    titleSmall: TextStyle(
        fontSize: 14, fontFamily: FontFamily.inter, color: Colors.black),
    bodyLarge: TextStyle(
        fontSize: 16, fontFamily: FontFamily.inter, color: Colors.black),
    titleMedium: TextStyle(
        fontSize: 18, fontFamily: FontFamily.inter, color: Colors.black),
    labelLarge: TextStyle(
        fontSize: 20, fontFamily: FontFamily.inter, color: Colors.black),
    titleLarge: TextStyle(
        fontSize: 22, fontFamily: FontFamily.inter, color: Colors.black),
    displaySmall: TextStyle(
        fontSize: 24, fontFamily: FontFamily.inter, color: Colors.black),
    displayMedium: TextStyle(
        fontSize: 26, fontFamily: FontFamily.inter, color: Colors.black),
    displayLarge: TextStyle(
        fontSize: 28, fontFamily: FontFamily.inter, color: Colors.black),
    headlineSmall: TextStyle(
        fontSize: 30, fontFamily: FontFamily.inter, color: Colors.black),
    headlineMedium: TextStyle(
        fontSize: 32, fontFamily: FontFamily.inter, color: Colors.black),
    headlineLarge: TextStyle(
        fontSize: 34, fontFamily: FontFamily.inter, color: Colors.black),
  ),
  dialogBackgroundColor: Colors.white,
  popupMenuTheme: const PopupMenuThemeData(
    color: Colors.white,

  )
  
);
ThemeData darkTheme = ThemeData.dark();
