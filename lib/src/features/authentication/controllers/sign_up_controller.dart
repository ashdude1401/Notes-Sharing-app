import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_sharing_app/src/features/authentication/models/user_model.dart';
import 'package:notes_sharing_app/src/repository/authentication-repository/authentication_repository.dart';

import '../../../repository/user_repository/user_repository.dart';
import '../screens/Forgot-Password/Forget-Password-Otp/forget_password_otp.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final authenticationRepsitory = Get.put(AuthenticationRepostory());

  //Use the controller where ever we have data from the text feild
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNumber = TextEditingController();

  final userRepo = Get.put(UserRepository());

  //TO be called from design
  void registerUser(String email, String password) {
    authenticationRepsitory.createUserWithEmaiAndPassword(email, password);
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
  }

  //Get phoneNo from user and pass it to Auth Repository for Firebase Authentication

  void phoneAuthtication(String phoneNo, UserModel user) {
    authenticationRepsitory.phoneAuthenticatin("+91$phoneNo");
    createUser(user)
        .whenComplete(() => Get.to(() => const ForgetPasswordOtp()));
  }
}
