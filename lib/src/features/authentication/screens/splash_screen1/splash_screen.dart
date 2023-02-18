import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_sharing_app/src/constants/image_strings.dart';
import 'package:notes_sharing_app/src/constants/sizes.dart';
import 'package:notes_sharing_app/src/constants/text_strings.dart';
import 'package:notes_sharing_app/src/features/authentication/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashScreenController.startAnimation();

    const Color scBgColor = Color.fromARGB(255, 255, 255, 255);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: scBgColor,
      body: SafeArea(
        child: Stack(
          children: [
            Obx(

              ()=> AnimatedPositioned(
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 1200),
                top: splashScreenController.animate.value ? size.height * 0.15 : 0,
                bottom: splashScreenController.animate.value ? 2 : 0,
                left: splashScreenController.animate.value? 2 : 0,
                right: splashScreenController.animate.value ? 2 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage(tSplashImage),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: tDefaultSize),
                      child: Obx(
                        ()=> AnimatedOpacity(
                          duration: const Duration(milliseconds: 1000),
                          opacity: splashScreenController.animate.value ? 1 : 0,
                          child: Text(landingPageText1,
                              style: Theme.of(context).textTheme.headlineMedium),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
