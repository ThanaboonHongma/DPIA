import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _nextRoute();
  }

  void _nextRoute() async {
    await Future.delayed(const Duration(milliseconds: 2000)).then((_) {
      context.pushReplacement('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
            duration: 2000,
            splash:  Image.asset('assets/dpo_online.png'),
            nextScreen: Container(),
            disableNavigation: false,
            splashTransition: SplashTransition.fadeTransition,
            // pageTransitionType: PageTransitionType.scale,
            backgroundColor: Colors.white);
  }
}
