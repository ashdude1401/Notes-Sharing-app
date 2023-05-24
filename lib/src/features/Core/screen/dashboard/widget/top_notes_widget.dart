import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../common_widgets/Title Subtitle/title_subtilte.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/text_strings.dart';

class TopNotesWidget extends StatelessWidget {
  const TopNotesWidget({
    super.key,
    required this.size,
    required this.txtTheme,
    required this.topperName,
    required this.stream,
    required this.topic,
    required this.img,
    this.color,
    required this.subject,
    required this.semester,
  });

  final Size size;
  final TextTheme txtTheme;
  final String topperName;
  final String stream;
  final String subject;
  final String semester;
  final String topic;
  final String img;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final hieght = size.height * 0.45;
    final width = size.width * 0.645;
    return Container(
        margin: EdgeInsets.symmetric(horizontal: size.height * 0.01),
        height: hieght,
        // width: width,
        decoration: BoxDecoration(
            color: tPrimaryColor,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: tPrimaryColor, width: 1)),
        child: Column(
          children: [
            Expanded(
              child: Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Image.asset(
                    handwrittenImg1,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      child: Image.asset(topperImg1),
                    ),
                  ),
                ),
                const Positioned(
                  right: 0,
                  top: 0,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite_border,
                      color: tPrimaryColor,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: hieght * 0.35,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    width: width,
                    color: tOptionalColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          topperName,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        RatingBarIndicator(
                          rating: 2.75,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Color(0xFFF638DC),
                          ),
                          itemCount: 5,
                          itemSize: 15.0,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    // padding: const EdgeInsets.all(8.0),
                    height: hieght * 0.35,
                    decoration: const BoxDecoration(
                        color: tPrimaryColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(22),
                            bottomLeft: Radius.circular(22))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              topic,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            trailing: const Icon(
                              Icons.download,
                              color: Colors.amber,
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TitleSubtitle(
                                    txtTheme: txtTheme,
                                    title: "Download",
                                    subTitle: "400"),
                                TitleSubtitle(
                                    txtTheme: txtTheme,
                                    title: "Views",
                                    subTitle: "1000"),
                                const Icon(
                                  Icons.visibility,
                                  color: Colors.amber,
                                )
                              ]),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ],
        ));
  }
}
