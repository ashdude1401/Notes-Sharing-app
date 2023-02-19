import 'package:flutter/material.dart';
import 'package:notes_sharing_app/src/constants/colors.dart';

import '../../../constants/sizes.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._(); //To avoid creating instances

  /// ---------light Theme
  static final lightOutlineButtonThem = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        padding: const EdgeInsets.symmetric(
                            vertical: tButttonHeight),
                        side: const BorderSide(color: tPrimaryColor),
                        elevation: 0),
  );


  /// ---------Dark Theme
  static final darkOutlineButtonThem =  ElevatedButtonThemeData(
     style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        padding: const EdgeInsets.symmetric(
                            vertical: tButttonHeight),
                        backgroundColor: tPrimaryColor,
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: tPrimaryColor),
                        elevation: 0),
  );
}
