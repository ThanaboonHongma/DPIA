import 'package:dpia_project/Router/router.dart';
import 'package:dpia_project/firebase_options.dart';
import 'package:dpia_project/providers/dpia_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const DPIA());
}

class DPIA extends StatelessWidget {
  const DPIA({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouteProvider();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DpiaProvider>(
          create: (_) => DpiaProvider(),
        ),
      ],
      child: Builder(builder: (context) {
        final provider = Provider.of<DpiaProvider>(context, listen: false);
        provider.setupData();
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router.goRouter(),
        );
      }),
    );
  }
}
