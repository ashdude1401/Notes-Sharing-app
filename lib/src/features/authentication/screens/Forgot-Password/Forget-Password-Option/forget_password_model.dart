import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_sharing_app/src/features/authentication/screens/Forgot-Password/Forget-Password-Mail/forgot_password_mail.dart';
import 'package:notes_sharing_app/src/features/authentication/screens/Forgot-Password/Forget-Password-Otp/forget_password_otp.dart';
import 'package:notes_sharing_app/src/features/authentication/screens/login_screen/Forget-Password-via-number/forget_password_via_number.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import 'forget_password_btn_widget.dart';

class ForgetPasswordModel {
  static Future<dynamic> buidBottomSheet(BuildContext context, Size modelSize) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
                padding: const EdgeInsetsDirectional.all(tDefaultSize),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tForgotPasswordTitle,
                        style: Theme.of(context).textTheme.headlineMedium),
                    Text(tForgotPasswordSubTitle,
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(
                      height: tFormHeight,
                    ),
                    Column(
                      children: [
                        ForgotPasswordBtnWidget(
                            icon: Icons.mail_outline_rounded,
                            title: tEmail,
                            subtitle: tForgetMailSubtitle,
                            onTap: () {
                              Navigator.of(context).pop();
                              Get.to(() => const ForgetPasswordMail());
                            }),
                        SizedBox(
                          height: modelSize.height * 0.01,
                        ),
                        ForgotPasswordBtnWidget(
                          icon: Icons.mobile_friendly_rounded,
                          title: tPhone,
                          subtitle: tForgetPhoneSubTitle,
                          onTap: () {
                            Navigator.of(context).pop();
                            Get.to(() => const ForgetPasswordViaNumber());
                          },
                        )
                      ],
                    )
                  ],
                )),
          );
        });
  }
}
