import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_sharing_app/src/features/authentication/screens/on_boarding_screen/onboarding_screen.dart';
import './Provider/notes.dart';
import './screens/home_screen.dart';
import '../src/features/authentication/screens/splash_screen1/splash_screen.dart';
import './src/utils/Theme/theme.dart';
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
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const OnboardingScreen(),
      ),
    );
  }
}
