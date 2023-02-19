import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:notes_sharing_app/src/constants/colors.dart';
import 'package:notes_sharing_app/src/constants/image_strings.dart';
import 'package:notes_sharing_app/src/constants/sizes.dart';
import 'package:notes_sharing_app/src/constants/text_strings.dart';
import 'package:notes_sharing_app/src/features/authentication/controllers/onBording_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final obController = OnbordingController();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            LiquidSwipe(
                slideIconWidget: const Icon(Icons.arrow_back_ios),
                enableSideReveal: true,
                onPageChangeCallback: (activePageIndex) =>
                    obController.onChangePageCallback(activePageIndex),
                liquidController: obController.controller,
                pages: obController.pages),
            Positioned(
              bottom: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(tDefaultSize),
                child: OutlinedButton(
                    onPressed: obController.animateNextPage,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.black26),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(15),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                          color: tDarkColor, shape: BoxShape.circle),
                      child: const Icon(Icons.arrow_forward_ios),
                    )),
              ),
            ),
            Positioned(
              top: size.height * 0.05,
              right: tDefaultSize,
              child: TextButton(
                onPressed: obController.skipPage,
                child: const Text(
                  skip,
                  style: TextStyle(
                      color: Color.fromARGB(255, 119, 119, 119), fontSize: 16),
                ),
              ),
            ),
            Obx(
              () => Positioned(
                bottom: size.height * 0.01,
                child: AnimatedSmoothIndicator(
                  effect: const WormEffect(
                    activeDotColor: Color(0xff272727),
                    dotHeight: 12,
                  ),
                  activeIndex: obController.currentPage.value,
                  count: 3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
