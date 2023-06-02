import 'package:financeiro_app/common/constants/app_colors.dart';
import 'package:financeiro_app/common/constants/app_text_style.dart';
import 'package:financeiro_app/common/constants/routes.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/primary_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Image.asset("assets/images/men.png"),
          ),
          Text(
            "Spend Smarter",
            textAlign: TextAlign.center,
            style: AppTextStyle.mediumText.copyWith(color: AppColors.greenTwo),
          ),
          Text(
            "Save More",
            textAlign: TextAlign.center,
            style: AppTextStyle.mediumText.copyWith(color: AppColors.greenTwo),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
            child: PrimaryButton(
              btnText: 'Get Start',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  NamedRoutes.signUp,
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(
              context,
              NamedRoutes.signIn,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: AppTextStyle.smallText.copyWith(color: AppColors.grey),
                ),
                Text(
                  'Log in',
                  style: AppTextStyle.smallText
                      .copyWith(color: AppColors.greenOne),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
