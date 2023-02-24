import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:notes_sharing_app/src/constants/image_strings.dart';
import 'package:notes_sharing_app/src/constants/text_strings.dart';
import 'package:notes_sharing_app/src/features/authentication/screens/Forgot-Password/Forget-Password-Otp/forget_password_otp.dart';
import 'package:notes_sharing_app/src/features/authentication/screens/Forgot-Password/Widget/forget_password_verifcation_widget.dart';

class ForgetPasswordViaNumber extends StatelessWidget {
  const ForgetPasswordViaNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ForgetPasswordVeficationWidget(
          size: size,
          img: forgotPasswordImg,
          title: tForgotPasswordTitle,
          subtitle: tForgetPhoneSubTitle,
          formFieldHint: tPhone,
          prefixIcon: Icons.phone_outlined,
          nextPage: const ForgetPasswordOtp(),),
    );
  }
}
