import 'package:dpia_project/Router/router.dart';
import 'package:dpia_project/models/counter_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const DPIA());
}

class DPIA extends StatelessWidget {
  const DPIA({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouteProvider();
    return ChangeNotifierProvider(
        create: (context) => CounterProvider(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router.goRouter(),
        ));
  }
}
