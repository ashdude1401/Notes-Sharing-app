import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_sharing_app/src/constants/colors.dart';
import 'package:notes_sharing_app/src/constants/sizes.dart';
import 'package:notes_sharing_app/src/constants/text_strings.dart';
import 'package:notes_sharing_app/src/features/authentication/controllers/otp_controller.dart';

class ForgetPasswordOtp extends StatelessWidget {
  const ForgetPasswordOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var otp;
    final otpController = Get.put(OTPController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  tCode,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * 0.09),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  tVerification,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  "$tEnterVerifcation sent at ashdue1401@gmail.com ",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                OtpTextField(
                  mainAxisAlignment: MainAxisAlignment.center,
                  numberOfFields: 6,
                  fillColor: tSecondaryColor.withOpacity(0.1),
                  filled: true,
                  onSubmit: (code) {
                    otp = code;
                    otpController.verifyOTP(otp);
                  },
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        otpController.verifyOTP(otp);
                      },
                      child: const Text(tNext)),
                )
              ]),
        ),
      ),
    );
  }
}
