import "package:flutter/material.dart";
import "package:prodigy_ad_04/screens/home_page.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: false,
      ),
      home: const Scaffold(
        body: SafeArea(
          child: HomePage(),
        ),
      ),
    );
  }
}
