import 'package:flutter/material.dart';
import 'package:notes_sharing_app/src/utils/Theme/widget_theme/text_field_theme.dart';
import 'package:notes_sharing_app/src/utils/Theme/widget_theme/elevated_button_theme.dart';
import 'package:notes_sharing_app/src/utils/Theme/widget_theme/outline_buttion_them.dart';
import 'package:notes_sharing_app/src/utils/Theme/widget_theme/text_them.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: WidgetTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightOutlineButtonThem,
    outlinedButtonTheme: TOutlineButtonTheme.lightOutlineButtonThem,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme, colorScheme: ColorScheme.fromSwatch(primarySwatch: const MaterialColor(0xFF645CBB, <int, Color>{
      50: Color(0xFFeeedf7),
      100: Color(0xFFccc9e8),
      200: Color(0xFFa9a5d9),
      300: Color(0xFF8781ca),
      400: Color(0xFF8781ca),
      500: Color(0xFF4c44a2),
      600: Color(0xFF3b357e),
      700: Color(0xFF2a265a),
      800: Color(0xFF191736),
      900: Color(0xFF080812),
    })).copyWith(background: Colors.white),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: WidgetTextTheme.darkTextTheme,
    outlinedButtonTheme: TOutlineButtonTheme.darkOutlineButtonThem,
    elevatedButtonTheme: TElevatedButtonTheme.darkOutlineButtonThem,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
