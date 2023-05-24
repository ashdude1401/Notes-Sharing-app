import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import 'header_dashboard.dart';

class CarouselBannerWidget extends StatelessWidget {
  const CarouselBannerWidget(
      {super.key,
      required this.size,
      required this.txtTheme,
      required this.title,
      required this.subtitle,
      required this.img});

  final Size size;
  final TextTheme txtTheme;
  final String title;
  final String subtitle;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: size.height * 0.2,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: tPrimaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(22),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: DashboardHeader(
              txtTheme: txtTheme,
              title: title,
              subtitle: subtitle,
            ),
          ),
          Flexible(
            child: Image.asset(
              img,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
