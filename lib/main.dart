import 'package:dpia_project/screens/dpia-Consultation/Consultation1.dart';
import 'package:dpia_project/screens/dpia-Identification/Identification1.dart';
import 'package:dpia_project/screens/login/login_page.dart';
//import 'package:dpia_project/screens/themes/dpia_lite_theme_data.dart';
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
      //theme: DpiaLiteThemeData.lightThemeData,
      home: Consultation1(),
    );
  }
}



