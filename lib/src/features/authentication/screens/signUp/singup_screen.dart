import 'package:flutter/material.dart';
import 'package:notes_sharing_app/src/common_widgets/Form/form_header.dart';
import 'package:notes_sharing_app/src/constants/image_strings.dart';
import 'package:notes_sharing_app/src/constants/sizes.dart';
import 'package:notes_sharing_app/src/constants/text_strings.dart';
import 'package:notes_sharing_app/src/features/authentication/screens/signUp/Widget/signup_footer.dart';
import 'Widget/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FormHeaderWidget(
                  size: size,
                  hdrImg: welcomeScreenImg,
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle,
                ),
                const SignUpFormWidget(),
                
                const SignUpFooterWidget(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

