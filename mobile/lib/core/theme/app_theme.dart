import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/theme/hex_color.dart';
import '../constants/font_manager.dart';

abstract class AppTheme{
  static ThemeData brightTheme = ThemeData(
    fontFamily: FontConstants.fontFamily,
    textTheme: TextTheme(
      displayLarge: TextStyle(
          fontSize: FontSize.s34,
          fontWeight: FontWeightManager.bold,
          color: HexColor.whiteColor),
      displayMedium:
      TextStyle(fontSize: FontSize.s24, fontWeight: FontWeightManager.bold),
      bodyLarge: TextStyle(
          fontSize: FontSize.s18,
          fontWeight: FontWeightManager.regular,
          color: HexColor.whiteColor),
      bodyMedium: TextStyle(
        fontSize: FontSize.s16,
        fontWeight: FontWeightManager.regular,
      ),
      bodySmall: TextStyle(
        fontSize: FontSize.s14,
        fontWeight: FontWeightManager.regular,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0.r),
          borderSide: const BorderSide(color: HexColor.lightColor)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0.r),
          borderSide: const BorderSide(color: HexColor.lightColor)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0.r),
          borderSide: const BorderSide(color: HexColor.lightColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0.r),
          borderSide: const BorderSide(color: HexColor.lightColor)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0.r),
          borderSide: const BorderSide(color: Colors.red)),
      hintStyle: TextStyle(
          fontSize: FontSize.s16,
          fontWeight: FontWeightManager.regular,
          color: HexColor.textInputColor),
      errorStyle: TextStyle(
          fontSize: FontSize.s8,
          fontWeight: FontWeightManager.regular,
          color: Colors.red),
      isDense: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: HexColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          textStyle: TextStyle(
            fontSize: FontSize.s16,
            fontWeight: FontWeightManager.semiBold,
            color: HexColor.whiteColor,
          ),
        )),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: HexColor.primaryColor,
      selectionColor: HexColor.primaryColor,
      selectionHandleColor: HexColor.primaryColor,
    ),
  );

}
