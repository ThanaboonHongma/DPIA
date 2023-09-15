import 'package:dpia_project/screens/home/homepage.dart';
import 'package:dpia_project/screens/login/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DPIA());
}

class DPIA extends StatelessWidget {
  const DPIA({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DPIA By Wisework",
      debugShowCheckedModeBanner: false,
      // theme: DpiaLiteThemeData.lightThemeData,
      home: HomePage(),
    );
  }
}



