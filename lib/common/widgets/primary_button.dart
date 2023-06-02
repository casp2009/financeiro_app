import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_style.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String btnText;

  const PrimaryButton({
    super.key,
    this.onPressed,
    required this.btnText,
  });

  final BorderRadius _borderRadius =
      const BorderRadius.all(Radius.circular(24));

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.greenOne,
              AppColors.greenTwo,
            ],
          ),
        ),
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: onPressed,
          child: Align(
            child: Text(
              btnText,
              style: AppTextStyle.mediumText18.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
