import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "NO More Worry For Notes!",
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                  height: 300,
                  child: Stack(children: [
                    SvgPicture.asset('assets/Images/topper.svg'),
                    const Positioned(
                      top: 10,
                      left: 15,
                      child: Text(
                        "Get Exam topper's Notes!",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 127, 127, 127)),
                      ),
                    ),
                  ]))
            ],
          ),
        ),
        // const NotesOverview(),
      ],
    );
  }
}
