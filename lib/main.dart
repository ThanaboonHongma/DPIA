import 'package:dpia_project/screens/home/homepage.dart';
import 'package:dpia_project/screens/mitigating/mitigating.dart';
import 'package:dpia_project/screens/dpia-Complete%20assessment/complete_assessment.dart';
import 'package:dpia_project/screens/dpia-Consultation/Consultation1.dart';
import 'package:dpia_project/screens/dpia-Identification/Identification1.dart';
import 'package:dpia_project/screens/dpia-Monitoring%20and%20review/monitoring.dart';
import 'package:dpia_project/screens/login/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DPIA());
}

class DPIA extends StatelessWidget {
  const DPIA({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "DPIA By Wisework",
      // theme: DpiaLiteThemeData.lightThemeData,
      home: LoginPage(),
    );
  }
}



