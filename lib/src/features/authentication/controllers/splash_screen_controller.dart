import 'package:get/get.dart';
import 'package:notes_sharing_app/src/features/authentication/screens/welcome/welcome_screen.dart';

class SplashScreenController extends GetxController{
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));

    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 5000));
    Get.to(const WelcomeScreen());

    // if (context.mounted) {
    //   Navigator.pushReplacement(context,
    //       MaterialPageRoute(builder: ((context) => (const WelcomeScreen()))));
    // }
  }
}
