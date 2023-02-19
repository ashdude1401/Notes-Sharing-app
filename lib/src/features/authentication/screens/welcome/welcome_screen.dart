import 'package:flutter/material.dart';
import 'package:notes_sharing_app/src/constants/colors.dart';
import 'package:notes_sharing_app/src/constants/image_strings.dart';
import 'package:notes_sharing_app/src/constants/sizes.dart';
import 'package:notes_sharing_app/src/constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const routeName = '/welcomeScreen';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? tPrimaryColor : tSecondaryColor,
      body: Padding(
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
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(welcomeScreenSubTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    loginText.toUpperCase(),
                  ),
                )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(signupText.toUpperCase()),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
