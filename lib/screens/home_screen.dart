import 'package:flutter/material.dart';
import 'package:notes_sharing_app/widgets/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8FD),
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
      body: const Body(),
    );
  }
}
