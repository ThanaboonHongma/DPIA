import 'package:dpia_project/screens/dpia_risk_assessment/counter_provider.dart';
import 'package:dpia_project/screens/dpia_risk_assessment/dpia_risk_assessment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const DPIA());
}

class DPIA extends StatelessWidget {
  const DPIA({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "DPIA By Wisework",
        // theme: DpiaLiteThemeData.lightThemeData,
        home: RiskAssessmentPage(),
      ),
    );
  }
}
