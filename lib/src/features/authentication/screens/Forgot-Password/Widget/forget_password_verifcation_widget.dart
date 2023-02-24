import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common_widgets/Form/form_header.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class ForgetPasswordVeficationWidget extends StatelessWidget {
  const ForgetPasswordVeficationWidget({
    super.key,
    required this.size,
    required this.img,
    required this.title,
    required this.subtitle,
    required this.formFieldHint,
    required this.prefixIcon,
    required this.nextPage,
  });

  final Size size;
  final String img;
  final String title;
  final String subtitle;
  final String formFieldHint;
  final IconData prefixIcon;
  final Widget nextPage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          children: [
            FormHeaderWidget(
              size: size,
              hdrImg: img,
              title: title,
              subTitle: subtitle,
              tCrossAxissAligment: CrossAxisAlignment.center,
              tMainAxisAlignment: MainAxisAlignment.center,
              imgHeightFraction: 0.3,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: formFieldHint,
                prefixIcon: Icon(
                  prefixIcon,
                  color: tSecondaryColor,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(nextPage),
                child: const Text(tNext),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
