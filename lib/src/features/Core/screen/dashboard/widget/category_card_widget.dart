import 'package:flutter/material.dart';
import 'package:notes_sharing_app/src/constants/image_strings.dart';

import '../../../../../common_widgets/Title Subtitle/title_subtilte.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/text_strings.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget(
      {super.key,
      required this.size,
      required this.hdrImg,
      required this.branch,
      required this.txtTheme,
      required this.noOfTopics,
      required this.noOfNotes,
      required this.onTap});

  final Size size;
  final String hdrImg;
  final String branch;
  final TextTheme txtTheme;
  final int noOfTopics;
  final int noOfNotes;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: size.height * 0.01,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: tPrimaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: Image(
                image: AssetImage(
                  eceDeptImg,
                ),
              ),
            ),
            Text(
              branch,
              style: txtTheme.headlineMedium
                  ?.apply(color: Colors.white, fontSizeDelta: -4),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: tOptionalColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TitleSubtitle(
                    txtTheme: txtTheme,
                    titleColor: const Color(0xFFF638DC),
                    subtitleColor: const Color(0xFF7149C6),
                    title: tTopic,
                    subTitle: noOfTopics.toString(),
                  ),
                  TitleSubtitle(
                    txtTheme: txtTheme,
                    title: tNotes,
                    titleColor: const Color(0xFFF638DC),
                    subtitleColor: const Color(0xFF7149C6),
                    subTitle: noOfNotes.toString(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
