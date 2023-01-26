import 'package:flutter/material.dart';
import 'package:notes_sharing_app/Provider/notes.dart';
import 'package:notes_sharing_app/design/theme.dart';
import 'package:notes_sharing_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => NotesList())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
