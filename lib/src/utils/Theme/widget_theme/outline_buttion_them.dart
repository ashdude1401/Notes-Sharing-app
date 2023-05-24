import 'package:flutter/material.dart';
import 'package:notes_sharing_app/src/constants/colors.dart';

import '../../../constants/sizes.dart';

class TOutlineButtonTheme {
  TOutlineButtonTheme._(); //To avoid creating instances

  /// ---------light Theme
  static final lightOutlineButtonThem = OutlinedButtonThemeData(

    style: OutlinedButton.styleFrom(

      shape: const RoundedRectangleBorder(
         borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      padding: const EdgeInsets.symmetric(vertical: tButttonHeight),
      side: const BorderSide(color: tPrimaryColor),
    ),
  );

  /// ---------Dark Theme
  static final darkOutlineButtonThem = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),),
        foregroundColor: tPrimaryColor,
        padding: const EdgeInsets.symmetric(vertical: tButttonHeight),
        side: const BorderSide(color: tPrimaryColor)),
  );
}
