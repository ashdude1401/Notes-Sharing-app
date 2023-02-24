import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_sharing_app/src/common_widgets/faded_animation/faded_animation_controller.dart';
import 'package:notes_sharing_app/src/common_widgets/faded_animation/faded_animation_modal.dart';
import '../../../../common_widgets/faded_animation/faded_animatio.dart';
import '../../../../constants/image_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadedAnimationController());
    controller.startAnimation();

    const Color scBgColor = Color.fromARGB(255, 255, 255, 255);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: scBgColor,
      body: SafeArea(
        child: Stack(
          children: [
            TFadedAnimation(
              durationInMs: 1600,
              animationPosition: TAnimationPosition(
                leftBefore: size.width * 0.3,
                leftAfter: size.width * 0.3,
                topAfter: size.height * 0.4,
                topBefore: size.height * 0.3,
              ),
              child: Image(
                image: const AssetImage(tSplashImage),
                height: size.height * 0.2,
                alignment: Alignment.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
