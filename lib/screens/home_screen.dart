import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_sharing_app/widgets/notes_overview_collegewise.dart';
import 'package:notes_sharing_app/widgets/notes_overview_topicwise.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140.0),
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 120,
          child: Column(
            children: [
              Container(
                height: 20,
                color: Theme.of(context).primaryColor,
              ),
              AppBar(
                leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                    )),
                actions: [
                  IconButton(
                      onPressed: (() {}),
                      icon: const Icon(
                        Icons.circle_notifications,
                        size: 30,
                      ))
                ],
                title: Text(
                  "Notes Library",
                  style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold),
                ),
                backgroundColor: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width,
                  maxHeight: MediaQuery.of(context).size.height),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          width: double.infinity,
                          child: Stack(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SvgPicture.asset(
                                'assets/Images/topper.svg',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 10,
                              child: Text(
                                "Get class topper notes",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                            ),
                            Positioned(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  "No! need to worry about Notes",
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ),
                            )
                          ])),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Topic Wise Notes",
                        style: Theme.of(context).textTheme.labelLarge),
                    const SizedBox(
                        height: 240, child: NotesOverviewTopicWise()),
                    Text(
                      "College Wise Notes",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(height: 2, child: NotesOverviewCollegeWise())
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
