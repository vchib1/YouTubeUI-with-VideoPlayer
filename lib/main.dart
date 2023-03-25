import 'package:flutter/material.dart';
import 'package:youtubeuiproject/constants/theme_data.dart';
import 'package:youtubeuiproject/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter: YouTube UI',
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}

