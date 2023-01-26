import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor:const  Color.fromARGB(255, 39, 21, 177),
  backgroundColor: const Color(0xffFFE5F1),
  cardColor: const Color(0xffFFF8E1),
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontSize: 36.0, fontWeight: FontWeight.bold, fontFamily: "Roboto"),
    subtitle1: TextStyle(
        fontSize: 24.0, fontStyle: FontStyle.italic, fontFamily: "OpenSans"),
    bodyText1: TextStyle(fontSize: 14.0, fontFamily: "Roboto"),
  ),
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: const Color(0xffC0DEFF)),
);
