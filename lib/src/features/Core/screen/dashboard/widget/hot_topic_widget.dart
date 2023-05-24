import 'package:flutter/material.dart';
import 'package:notes_sharing_app/src/constants/image_strings.dart';

import '../../../../../constants/colors.dart';

class HotTopicWidget extends StatelessWidget {
  const HotTopicWidget(
      {super.key,
      required this.txtTheme,
      required this.topic,
      required this.noOfNotes,
      required this.branch,
      required this.onTap});

  final TextTheme txtTheme;
  final String branch;
  final String topic;
  final int noOfNotes;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
                color: tPrimaryColor, borderRadius: BorderRadius.circular(16)),
            child: Column(children: [
              Flexible(
                child: Image.asset(
                  cseDeptImg,
                ),
              ),
              Text(branch,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.apply(color: Colors.white, fontWeightDelta: 3))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "DBMS",
                  style: Theme.of(context).textTheme.bodyLarge?.apply(
                        fontSizeDelta: -2,
                        fontWeightDelta: 2,
                        color: const Color(0xFFE11299),
                      ),
                ),
                Text("${noOfNotes.toString()} Notes",
                    style: Theme.of(context).textTheme.bodySmall),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.remove_red_eye,
                      color: tPrimaryColor,
                      size: 15,
                    ),
                    Text(
                      "5.3k",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.apply(fontSizeDelta: -1, fontWeightDelta: 1),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


//  GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: size.height * 0.01),
//         decoration: const BoxDecoration(color: Colors.red),
//         child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//           Container(
//             width: size.height * 0.10,
//             height: size.height * 0.10,
//             padding: const EdgeInsets.all(5),
//             decoration: const BoxDecoration(
//               color: tPrimaryColor,
//               borderRadius: BorderRadius.all(
//                 Radius.circular(14.0),
//               ),
//             ),
//             child: Column(
//               children: [
//                 Center(
//                     child: Image.asset(
//                   cseDeptImg,
//                   height: size.height * 0.05,
//                 )),
//                 Text(branch)
//               ],
//             ),
//           ),
//           SizedBox(
//             width: size.height * 0.02,
//           ),
//           Flexible(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   topic,
//                   style: txtTheme.titleSmall?.apply(
//                       fontWeightDelta: 2,
//                       color: tSecondaryColor,
//                       fontSizeDelta: 2),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 Text(
//                   "$noOfNotes Notes",
//                   style: txtTheme.bodyMedium,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           )
//         ]),
//       ),
//     );