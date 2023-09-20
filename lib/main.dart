import 'package:dpia_project/models/counter_provider.dart';
import 'package:dpia_project/screens/login/login_page.dart';
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
        home: LoginPage(),
      )
    );
  }
}
