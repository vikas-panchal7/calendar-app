import 'package:calendar_app/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    //dialog theme
    dialogTheme:
        const DialogTheme(elevation: 0, shadowColor: Colors.transparent),
    // appbar theme
    appBarTheme:  AppBarTheme(
        backgroundColor: _colorScheme.primary,
        elevation: 0,
        scrolledUnderElevation: 3,
        iconTheme: IconThemeData(color: _colorScheme.onSecondary),
        // centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 18,
            fontFamily: FontFamily.inter,
            color: _colorScheme.onSecondary,
            fontWeight: FontWeight.w700),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark)
        // surfaceTintColor: AppColors.darkGrey,
        ),

//scaffold color
    scaffoldBackgroundColor: _colorScheme.background,
    fontFamily: FontFamily.inter,
    colorScheme: _colorScheme,

    textTheme:  TextTheme(
      labelSmall: TextStyle(
          fontSize: 11, fontFamily: FontFamily.inter, color: _colorScheme.onBackground),
      labelMedium: TextStyle(
          fontSize: 12, fontFamily: FontFamily.inter, color: _colorScheme.onBackground),
      bodySmall: TextStyle(
          fontSize: 13, fontFamily: FontFamily.inter, color: _colorScheme.onBackground),
      bodyMedium: TextStyle(
          fontSize: 14, fontFamily: FontFamily.inter, color: _colorScheme.onBackground),
      titleSmall: TextStyle(
          fontSize: 14, fontFamily: FontFamily.inter, color: _colorScheme.onBackground),
      bodyLarge: TextStyle(
          fontSize: 16, fontFamily: FontFamily.inter, color: _colorScheme.onBackground),
      titleMedium: TextStyle(
          fontSize: 18, fontFamily: FontFamily.inter, color: _colorScheme.onBackground),
      labelLarge: TextStyle(
          fontSize: 20, fontFamily: FontFamily.inter, color: _colorScheme.onBackground),
      titleLarge: TextStyle(
          fontSize: 22, fontFamily: FontFamily.inter, color: _colorScheme.onBackground),
      displaySmall: TextStyle(
          fontSize: 24, fontFamily: FontFamily.inter, color: _colorScheme.onBackground),
      displayMedium: TextStyle(
          fontSize: 26, fontFamily: FontFamily.inter, color: _colorScheme.onBackground),
      displayLarge: TextStyle(
          fontSize: 28, fontFamily: FontFamily.inter, color: _colorScheme.onBackground),
      headlineSmall: TextStyle(
          fontSize: 30, fontFamily: FontFamily.inter, color: _colorScheme.onBackground),
      headlineMedium: TextStyle(
          fontSize: 32, fontFamily: FontFamily.inter, color: _colorScheme.onBackground),
      headlineLarge: TextStyle(
          fontSize: 34, fontFamily: FontFamily.inter, color: _colorScheme.onBackground),
    ),
    dialogBackgroundColor: _colorScheme.background,
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.withOpacity(.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:  BorderSide(color: _colorScheme.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.withOpacity(.5)),
        ),
        isDense: true,
        filled: true,
        fillColor: _colorScheme.onSecondary,
      hintStyle: TextStyle(
          fontSize: 16, fontFamily: FontFamily.inter, color: Colors.grey.shade500) ,
      helperStyle: const TextStyle(height: 0.7,),
        errorStyle: const TextStyle(height: 0.7,)

    ),


);
ThemeData darkTheme = ThemeData.dark();
///#  FBA9A9
/// #  26282C
///  #   454A53
///
ColorScheme get _colorScheme => ColorScheme(
       background: const Color(0xff454a53),
       primary: const Color(0xFFFBA9A9),
       onPrimary: const Color(0xFFE7F2FF),
       brightness: Brightness.light,
       secondary: const Color(0xFFFAC6C6),
       onSecondary: const Color(0xFF26282C),
       error: Colors.red,
       onError: Colors.red,
       onBackground: Colors.white,
       surface: const Color(0xFF787880).withOpacity(0.20),
       onSurface: const Color(0xFF787880).withOpacity(0.8),
       onTertiary: Colors.black);
