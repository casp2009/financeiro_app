import 'package:financeiro_app/common/constants/routes.dart';
import 'package:financeiro_app/features/onboarding/onboarding_page.dart';
import 'package:financeiro_app/features/sign_up/sign_up_page.dart';
import 'package:financeiro_app/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'features/sign_in/sign_in_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: defaultTheme,
      initialRoute: NamedRoutes.splash,
      routes: {
        NamedRoutes.initial: (context) => const OnboardingPage(),
        NamedRoutes.splash: (context) => const SplashPage(),
        NamedRoutes.signUp: (context) => const SignUpPage(),
        NamedRoutes.signIn: (context) => const SignInPage(),
      },
    );
  }
}
