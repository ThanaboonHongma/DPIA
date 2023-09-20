import 'package:dpia_project/screens/dpia-Complete%20assessment/complete_assessment.dart';
import 'package:dpia_project/screens/dpia-Consultation/consultation1.dart';
import 'package:dpia_project/screens/dpia-Identification/Identification1.dart';
import 'package:dpia_project/screens/dpia-Monitoring%20and%20review/monitoring.dart';
import 'package:dpia_project/screens/dpia_description/dpia_description.dart';
import 'package:dpia_project/screens/dpia_necessity_and_proportionlity/dpia_necessity_and_proportionlity.dart';
import 'package:dpia_project/screens/dpia_risk_assessment/dpia_risk_assessment.dart';
import 'package:dpia_project/screens/home/homepage.dart';
import 'package:dpia_project/screens/login/login_page.dart';
import 'package:dpia_project/screens/mitigating/addmeasure.dart';
import 'package:dpia_project/screens/mitigating/mitigating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouteProvider {
  GoRouter goRouter() {
    return GoRouter(initialLocation: '/', routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LoginPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/HomePage',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const HomePage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/Identification',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const Identification1(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/DpiaDescriptionPage',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const DpiaDescriptionPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/Consultation',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const Consultation1(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/NecessityandProportionlityPage',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const NecessityandProportionlityPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/RiskAssessmentPage',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const RiskAssessmentPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/MitigatingMeasuresPage',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const MitigatingMeasures(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/AddMitigatingMeasuresPage',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const AddMeasure(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/MonitoringPage',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const MonitoringPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/CompletePage',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const CompletePage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      // ShellRoute(
      //     navigatorKey: _shellNavigatorKey,
      //     builder: (context, state, child) {
      //       return MyApp(key: state.pageKey);
      //     },
      //     routes: [
      //       GoRoute(
      //         path: '/',
      //         name: loginRoute,
      //         pageBuilder: (context, state) {
      //           return LoginScreen();
      //         },
      //       ),
      //       GoRoute(
      //         path: '/home',
      //         name: homeRoute,
      //         pageBuilder: (context, state) {
      //           return HomeScreen(key: state.pageKey);
      //         },
      //       )
      //     ])
    ]);
  }
}
