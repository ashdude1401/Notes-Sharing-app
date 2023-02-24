import 'package:flutter/material.dart';

import 'package:notes_sharing_app/src/constants/image_strings.dart';
import 'package:notes_sharing_app/src/constants/text_strings.dart';
import 'package:notes_sharing_app/src/features/authentication/screens/Forgot-Password/Forget-Password-Otp/forget_password_otp.dart';

import '../Widget/forget_password_verifcation_widget.dart';

class ForgetPasswordMail extends StatelessWidget {
  const ForgetPasswordMail({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ForgetPasswordVeficationWidget(
        size: size,
        img: forgotPasswordImg,
        title: tForgotPassword,
        subtitle: tForgetMailSubtitle,
        formFieldHint: tEmail,
        prefixIcon: Icons.mail_outline_outlined,
        nextPage:const ForgetPasswordOtp(),
      ),
    );
  }
}
