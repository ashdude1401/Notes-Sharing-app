import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_sharing_app/src/constants/colors.dart';
import 'package:notes_sharing_app/src/constants/image_strings.dart';

import 'package:notes_sharing_app/src/constants/sizes.dart';
import 'package:notes_sharing_app/src/constants/text_strings.dart';
import 'package:notes_sharing_app/src/features/Core/controller/notes/notes_controller.dart';
import 'package:notes_sharing_app/src/features/Core/model/carousel_model.dart';
import 'package:notes_sharing_app/src/features/Core/model/category_model.dart';
import 'package:notes_sharing_app/src/features/Core/model/hot_topic_model.dart';
import 'package:notes_sharing_app/src/features/Core/model/top_notes_model.dart';
import 'package:notes_sharing_app/src/features/Core/screen/dashboard/widget/carouse_banner.dart';
import 'package:notes_sharing_app/src/features/Core/screen/dashboard/widget/category_card_widget.dart';
import 'package:notes_sharing_app/src/features/Core/screen/dashboard/widget/app_bar_dashboard.dart';
import 'package:notes_sharing_app/src/features/Core/screen/dashboard/widget/hot_topic_widget.dart';
import 'package:notes_sharing_app/src/features/authentication/screens/signUp/singup_screen.dart';

import 'widget/top_notes_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final txtTheme = Theme.of(context).textTheme;

    final hotTopicList = HotTopicModel.hotTopicList;
    final categoryList = CategoryModel.categoryList;
    final topNotesList = TopNotesModel.topNotesList;
    final carouselList = CarouselModel.carouselList;

    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          appBar: appBarDashboard(context, size),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(tDashboardPadding * 1 / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  slidder(
                      size: size,
                      carouselList: carouselList,
                      txtTheme: txtTheme),
                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  //Hot Topics
                  HotTopic(
                      txtTheme: txtTheme,
                      size: size,
                      hotTopicList: hotTopicList),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  //Categories
                  Catagories(
                      txtTheme: txtTheme,
                      size: size,
                      categoryList: categoryList),

                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  //Top Notes

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Top Notes",
                        style: txtTheme.titleSmall,
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      SizedBox(
                        height: size.height * 0.4,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: topNotesList.length,
                          itemBuilder: (context, i) => TopNotesWidget(
                            size: size,
                            txtTheme: txtTheme,
                            topperName: topNotesList[i].topperName,
                            stream: topNotesList[i].branch,
                            topic: topNotesList[i].topic,
                            img: topNotesList[i].img,
                            semester: '',
                            subject: '',
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recent upload",
                        style: txtTheme.titleSmall,
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      SizedBox(
                        height: size.height * 0.4,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: topNotesList.length,
                          itemBuilder: (context, i) => TopNotesWidget(
                            color: tSecondaryColor,
                            size: size,
                            txtTheme: txtTheme,
                            topperName: topNotesList[i].topperName,
                            stream: topNotesList[i].branch,
                            topic: topNotesList[i].topic,
                            img: topNotesList[i].img,
                            semester: '',
                            subject: '',
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.put(NoteController());

              final user = FirebaseAuth.instance.currentUser;
              if (user == null) {
                Get.snackbar(
                  "Sign in first ",
                  "Sign in first to upload the notes",
                  colorText: tAccentColor,
                  snackPosition: SnackPosition.TOP,
                );
                Get.to(() => const SignUpScreen());
              } else {
                Get.to(const UploadScreen());
              }
            },
            child: const Icon(
              Icons.add,
              color: tOptionalColor,
            ),
          ),
          bottomNavigationBar: BottomNavBar(size: size),
        ),
      ),
    );
  }
}

class UploadScreen extends StatefulWidget {
  const UploadScreen({
    super.key,
  });

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  bool showTandC = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.keyboard_arrow_left_outlined,
            color: tAccentColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDashboardPadding),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  uploadScreenImg,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
                Container(
                  padding: const EdgeInsets.all(tDashboardPadding),
                  decoration: BoxDecoration(
                      color: tOptionalColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Upload your Notes",
                        style: textTheme.titleSmall?.apply(
                            color: tPrimaryColor,
                            fontWeightDelta: 2,
                            fontSizeDelta: 4),
                      ),
                      Text(
                        tUploadScreenTitle,
                        style: textTheme.bodySmall?.apply(fontSizeDelta: 1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => {
                              setState(() {
                                showTandC = !showTandC;
                                print(showTandC);
                              })
                            },
                            child: Text(
                              tLearnMore,
                              style: textTheme.bodySmall?.apply(
                                  color: Colors.black87, fontWeightDelta: 2),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                showTandC == true
                    ? Container(
                        padding: const EdgeInsets.all(tDashboardPadding),
                        margin: EdgeInsets.only(top: size.height * 0.03),
                        decoration: BoxDecoration(
                            color: tOptionalColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tTermsAndPolices,
                              style: textTheme.titleSmall?.apply(
                                  color: tPrimaryColor,
                                  fontWeightDelta: 2,
                                  fontSizeDelta: 4),
                            ),
                            Text(
                              tTermsAndPolicesDescption,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      )
                    : Container()
              ]),
        ),
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: tDashboardPadding * 1 / 2,
              vertical: tDashboardPadding * 1 / 2),
          width: double.infinity,
          child: ElevatedButton(onPressed: () {}, child: const Text(tNext))),
    );
  }
}

// class TermsAndPolicyScreen extends StatelessWidget {
//   const TermsAndPolicyScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: GestureDetector(
//           onTap: () => Get.back(),
//           child: const Icon(
//             Icons.keyboard_arrow_left_outlined,
//             color: tAccentColor,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(tDashboardPadding),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Text(
//             tTermsAndPolices,
//             style: Theme.of(context)
//                 .textTheme
//                 .titleSmall
//                 ?.apply(color: tPrimaryColor),
//           ),
//           Text(
//             tTermsAndPolicesDescption,
//             style: Theme.of(context).textTheme.bodyMedium,
//           ),
//           const Spacer(),
//           SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                   onPressed: () => Get.to(const UploadNotesScreen()),
//                   child: const Text(tNext)))
//         ]),
//       ),
//     );
//   }
// }

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class slidder extends StatelessWidget {
  const slidder({
    super.key,
    required this.size,
    required this.carouselList,
    required this.txtTheme,
  });

  final Size size;
  final List<CarouselModel> carouselList;
  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
          autoPlayInterval: const Duration(seconds: 4),
          height: size.height * 0.2,
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          autoPlay: true),
      itemCount: carouselList.length,
      itemBuilder: (context, i, realIndex) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: CarouselBannerWidget(
          size: size,
          txtTheme: txtTheme,
          title: carouselList[i].title,
          subtitle: carouselList[i].subtitle,
          img: carouselList[i].img,
        ),
      ),
    );
  }
}

class HotTopic extends StatelessWidget {
  const HotTopic({
    super.key,
    required this.txtTheme,
    required this.size,
    required this.hotTopicList,
  });

  final TextTheme txtTheme;
  final Size size;
  final List<HotTopicModel> hotTopicList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tHotTopics,
          style: txtTheme.titleSmall,
        ),
        SizedBox(
          height: size.height * 0.12,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: hotTopicList.length,
            itemBuilder: (BuildContext context, int i) => HotTopicWidget(
              txtTheme: txtTheme,
              topic: hotTopicList[i].topic,
              noOfNotes: hotTopicList[i].noOfNotes,
              branch: hotTopicList[i].branch,
              onTap: hotTopicList[i].onTap,
            ),
          ),
        ),
      ],
    );
  }
}

class Catagories extends StatelessWidget {
  const Catagories({
    super.key,
    required this.txtTheme,
    required this.size,
    required this.categoryList,
  });

  final TextTheme txtTheme;
  final Size size;
  final List<CategoryModel> categoryList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tCategories,
          style: txtTheme.titleSmall,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: size.height * 0.25,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, i) => CategoryCardWidget(
              size: size,
              hdrImg: categoryList[i].img,
              branch: categoryList[i].branch,
              txtTheme: txtTheme,
              noOfTopics: categoryList[i].noOfTopic,
              noOfNotes: categoryList[i].noOfNotes,
              onTap: categoryList[i].onTap,
            ),
          ),
        ),
      ],
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5.0,
      color: tPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: size.height * 0.005,
                top: size.height * 0.012,
                bottom: size.height * 0.012),
            child: Column(mainAxisSize: MainAxisSize.min, children: const [
              Icon(
                Icons.home,
                color: tOptionalColor,
                size: 32,
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.012, bottom: size.height * 0.012),
            child: Column(mainAxisSize: MainAxisSize.min, children: const [
              Icon(
                Icons.search_outlined,
                color: tOptionalColor,
                size: 32,
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.height * 0.08,
                top: size.height * 0.012,
                bottom: size.height * 0.012),
            child: Column(mainAxisSize: MainAxisSize.min, children: const [
              ImageIcon(
                AssetImage(note_explore_icon),
                color: tOptionalColor,
                size: 32,
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.012, bottom: size.height * 0.012),
            child: Column(mainAxisSize: MainAxisSize.min, children: const [
              ImageIcon(
                AssetImage(notes_folder),
                color: tOptionalColor,
                size: 32,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
