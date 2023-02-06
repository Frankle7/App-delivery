import 'package:dw9_delivery_app/app/core/ui/styles/app_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../styles/colors_app.dart';

class ThemeConfig {
  ThemeConfig._();
  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(color: Colors.grey[400]!),
  );

  static final theme = ThemeData(
    scaffoldBackgroundColor: Color(0XFF140E0E),
    appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 14, 13, 13),
        elevation: 1,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white)),
    primaryColor: ColorsApp.i.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.i.primary,
      primary: ColorsApp.i.primary,
      secondary: ColorsApp.i.secondary,
    ),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: AppStyles.i.primaryButton),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.black,
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.all(13),
        border: _defaultInputBorder,
        enabledBorder: _defaultInputBorder,
        focusedBorder: _defaultInputBorder,
        labelStyle: TextStyles.i.textRegular.copyWith(color: Colors.white),
        errorStyle: TextStyles.i.textRegular.copyWith(color: Colors.redAccent)),
  );
}
