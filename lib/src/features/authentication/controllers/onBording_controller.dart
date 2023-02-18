import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';

class OnbordingController extends GetxController {
  RxInt currentPage = 0.obs;

  final controller = LiquidController();

  final pages = const [
    OnBoardingWidget(
        pageColor: tonBoardingPage1Color,
        img: onBordingImg1,
        title: onBoardingTitle1,
        subtitle: onBoardingSubtitle1,
        counter: onBoardingCounter1),
    OnBoardingWidget(
        pageColor: tonBoardingPage2Color,
        img: onBordingImg2,
        title: onBoardingTitle2,
        subtitle: onBoardingSubtitle2,
        counter: onBoardingCounter2),
    OnBoardingWidget(
        pageColor: tonBoardingPage3Color,
        img: onBordingImg3,
        title: onBoardingTitle3,
        subtitle: onBoardingSubtitle3,
        counter: onBoardingCounter3),
  ];

  onChangePageCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  void skipPage() {
    controller.jumpToPage(page: 2);
  }

  animateNextPage() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
}

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget(
      {super.key,
      required this.pageColor,
      required this.img,
      required this.title,
      required this.subtitle,
      required this.counter});

  final Color pageColor;
  final String img;
  final String title;
  final String subtitle;
  final String counter;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      color: pageColor,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image(
          image: AssetImage(img),
          height: size.height * 0.3,
        ),
        SizedBox(height: size.height * 0.05),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(subtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              counter,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ]),
    );
  }
}
