import 'package:dpia_project/screens/dpia_description/dpia_description.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DPIA());
}

class DPIA extends StatelessWidget {
  const DPIA({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DPIA By Wisework",

      // theme: DpiaLiteThemeData.lightThemeData,
      home: DpiaDescriptionPage(),
    );
  }
}
