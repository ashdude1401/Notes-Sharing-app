import 'package:get/get.dart';
import 'package:notes_sharing_app/src/features/authentication/screens/on_boarding_screen/onboarding_screen.dart';

class FadedAnimationController extends GetxController {
  static FadedAnimationController get find => Get.find();

  RxBool animate = false.obs;
  // int duration;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));

    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 5000));
    Get.offAll(const OnboardingScreen());
  }
  Future animationIn() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  }
}
