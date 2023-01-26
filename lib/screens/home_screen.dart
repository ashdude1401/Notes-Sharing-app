import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_sharing_app/widgets/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 254),
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
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "No! need to worry about Notes",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color.fromARGB(255, 3, 0, 28),
                          ),
                        ),
                        SizedBox(
                            height: 400,
                            width: double.infinity,
                            child: Stack(children: [
                              SvgPicture.asset('assets/Images/topper.svg'),
                              const Positioned(
                                top: 110,
                                left: 10,
                                child: Text("Get class topper notes"),
                              ),
                            ]))
                      ],
                    ),
                    Text(
                      "Topic Wise Notes",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    const Expanded(child: Body()),
                    Text(
                      "College Wise Notes",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
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
