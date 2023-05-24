import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader(
      {super.key,
      required this.txtTheme,
      required this.title,
      required this.subtitle,
      this.subTitlecolor,
      this.titlecolor});

  final TextTheme txtTheme;
  final String title;
  final String subtitle;
  final Color? titlecolor;
  final Color? subTitlecolor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: txtTheme.bodyLarge?.apply(
              color: subTitlecolor ?? tOptionalColor, fontSizeDelta: -2),
        ),
        Text(
          subtitle,
          style: txtTheme.headlineSmall
              ?.apply(color: titlecolor ?? Colors.white, fontSizeDelta: -2.5),
        ),
      ],
    );
  }
}
