import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_sharing_app/src/features/authentication/screens/signUp/singup_screen.dart';
import 'package:notes_sharing_app/src/repository/authentication-repository/authentication_repository.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

AppBar appBarDashboard(BuildContext context, Size size) {
  return AppBar(
    title: Text(appName,
        style: GoogleFonts.archivoBlack(
            fontSize: 22, fontWeight: FontWeight.w400, color: tPrimaryColor)),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.menu,
        size: size.height * 0.04,
      ),
      color: tPrimaryColor,
    ),
    actions: [
      Container(
        margin: const EdgeInsets.symmetric(
            horizontal: tDashboardPadding, vertical: 8),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: tPrimaryColor.withOpacity(0.7)),
        child: IconButton(
          onPressed: () async {
            AuthenticationRepostory.instance
                .logout()
                .whenComplete(() => Get.put(() => const SignUpScreen()));
          },
          icon: const Image(image: AssetImage(profileImg)),
        ),
      )
    ],
  );
}
