import 'package:flutter/material.dart';
import 'package:notes_sharing_app/src/common_widgets/Form/form_header.dart';
import 'package:notes_sharing_app/src/constants/image_strings.dart';
import 'package:notes_sharing_app/src/constants/sizes.dart';
import 'package:notes_sharing_app/src/constants/text_strings.dart';

import 'Widget/login_footer_widget.dart';
import 'Widget/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  title: tLoginTitle,
                  subTitle: tLoginSubTitle,
                ),
                LoginForm(size: size),
                const LoginFooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
