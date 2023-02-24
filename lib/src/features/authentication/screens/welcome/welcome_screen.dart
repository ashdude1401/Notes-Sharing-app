import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_sharing_app/src/constants/colors.dart';
import 'package:notes_sharing_app/src/constants/image_strings.dart';
import 'package:notes_sharing_app/src/constants/sizes.dart';
import 'package:notes_sharing_app/src/constants/text_strings.dart';
import 'package:notes_sharing_app/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:notes_sharing_app/src/features/authentication/screens/signUp/singup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const routeName = '/welcomeScreen';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : Colors.white,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  welcomeScreenImg,
                  height: size.height * 0.6,
                ),
                Column(
                  children: [
                    Text(
                      welcomeScreenTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(welcomeScreenSubTitle,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.titleSmall),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Get.to(() => const LoginScreen()),
                        child: Text(
                          loginText.toUpperCase(),
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: tPrimaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.height * 0.015,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => const SignUpScreen()),
                        child: Text(
                          signupText.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
