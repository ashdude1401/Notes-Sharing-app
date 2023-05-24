import 'package:get/get.dart';
import 'package:notes_sharing_app/src/features/Core/screen/dashboard/dashboard.dart';
import 'package:notes_sharing_app/src/repository/authentication-repository/authentication_repository.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepostory.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const Dashboard()) : Get.back();
  }
}
