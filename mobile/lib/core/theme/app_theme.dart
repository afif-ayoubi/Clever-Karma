import 'package:flutter/material.dart';
import 'package:mobile/core/theme/hex_color.dart';

import '../constants/font_manager.dart';

ThemeData appThemeData = ThemeData(
    fontFamily: FontConstants.fontFamily,
    textTheme: TextTheme(
      displayLarge: TextStyle(
          fontSize: FontSize.s34,
          fontWeight: FontWeightManager.bold,
          color: HexColor.whiteColor),
      displayMedium:
          TextStyle(fontSize: FontSize.s34, fontWeight: FontWeightManager.bold),
      bodyLarge: TextStyle(
          fontSize: FontSize.s18,
          fontWeight: FontWeightManager.regular,
          color: HexColor.whiteColor),
    ));
