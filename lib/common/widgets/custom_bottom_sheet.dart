import 'package:financeiro_app/common/constants/app_text_style.dart';
import 'package:financeiro_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

Future<dynamic> customModalBottomSheet(
    BuildContext context, String content, String buttonText) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(38),
        topRight: Radius.circular(38),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          color: AppColors.iceWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(38),
            topRight: Radius.circular(38),
          ),
        ),
        height: 150,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                content,
                style: AppTextStyle.mediumText20.copyWith(
                  color: AppColors.greenOne,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: PrimaryButton(
                  btnText: buttonText,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
