import 'package:flutter/material.dart';
import 'package:project_hcrl/page/FirstPage.dart';
// import 'package:project_hcrl/page/home.dart';
// ignore: duplicate_import
import 'package:project_hcrl/page/FirstPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage()
    );
  }
}