import 'package:flutter/material.dart';
import 'package:notes_sharing_app/src/constants/colors.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
    suffixIconColor: tPrimaryColor,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
      Radius.circular(12),
    )),
 
    prefixIconColor: tPrimaryColor,
    floatingLabelStyle: TextStyle(color: tPrimaryColor),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: tOptionalColor),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        )),
  );

  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
          suffixIconColor: tSecondaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          prefixIconColor: tSecondaryColor,
          floatingLabelStyle: TextStyle(color: tPrimaryColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: tSecondaryColor),
          ));
}
