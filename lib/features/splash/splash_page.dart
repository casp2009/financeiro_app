import 'dart:async';

import 'package:financeiro_app/common/constants/app_colors.dart';
import 'package:financeiro_app/common/constants/app_text_style.dart';
import 'package:financeiro_app/common/constants/routes.dart';
import 'package:financeiro_app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Timer init() {
    return Timer(
      const Duration(seconds: 2),
      navigateToOnboarding,
    );
  }

  void navigateToOnboarding() {
    Navigator.pushReplacementNamed(
      context,
      NamedRoutes.initial,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.greenOne,
                AppColors.greenTwo,
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Financeiro',
              style: AppTextStyle.bigText.copyWith(color: AppColors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomCircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
