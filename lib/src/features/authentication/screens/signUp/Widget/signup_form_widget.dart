import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_sharing_app/src/constants/colors.dart';
import 'package:notes_sharing_app/src/features/authentication/controllers/sign_up_controller.dart';
import 'package:notes_sharing_app/src/features/authentication/models/user_model.dart';
import 'package:notes_sharing_app/src/features/authentication/screens/Forgot-Password/Forget-Password-Otp/forget_password_otp.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: tFormHeight - 10,
          ),
          TextFormField(
            controller: controller.fullName,
            decoration: const InputDecoration(
              labelText: tFullName,
              prefixIcon: Icon(
                Icons.person_outline_outlined,
                color: tSecondaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: tFormHeight - 20,
          ),
          TextFormField(
            controller: controller.email,
            decoration: const InputDecoration(
              labelText: tEmail,
              prefixIcon: Icon(
                Icons.email_outlined,
                color: tSecondaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: tFormHeight - 20,
          ),
          TextFormField(
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
              labelText: tPhoneNumber,
              prefixIcon: Icon(
                Icons.phone_android_outlined,
                color: tSecondaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: tFormHeight - 20,
          ),
          TextFormField(
            controller: controller.password,
            decoration: const InputDecoration(
              labelText: tPassword,
              prefixIcon: Icon(
                Icons.fingerprint_outlined,
                color: tSecondaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: tFormHeight - 10,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                final user = UserModel(
                    email: controller.email.text.trim(),
                    password: controller.password.text.trim(),
                    fullName: controller.fullName.text.trim(),
                    phoneNo: controller.phoneNumber.text.trim());

                if (_formKey.currentState!.validate()) {
                  print(controller.phoneNumber.text.trim());
                  SignUpController.instance.phoneAuthtication(controller.phoneNumber.text.trim(), user);
                }
              },
              child: Text(
                signupText.toUpperCase(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
