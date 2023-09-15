
import 'package:dpia_project/screens/dpia_description/dpia_description.dart';
import 'package:dpia_project/screens/themes/dpia_lite_theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DPIA());
}

class DPIA extends StatelessWidget {
  const DPIA({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DPIA By Wisework",
      
      // theme: DpiaLiteThemeData.lightThemeData,
      home: DpiaDescriptionPage(),
    );
  }
}



