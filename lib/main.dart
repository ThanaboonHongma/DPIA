import 'package:dpia_project/screens/login/login_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const DPIA());
}

class DPIA extends StatelessWidget {
  const DPIA({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DPIA By Wisework",
      // theme: DpiaLiteThemeData.lightThemeData,
      home: LoginPage(),
    );
  }
}
