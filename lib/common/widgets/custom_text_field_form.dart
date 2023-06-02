import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_style.dart';

class CustomTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final Widget? sufixIcon;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormater;
  final FormFieldValidator<String>? validator;
  final String? helperText;
  final TextEditingController? controller;

  const CustomTextFormField({
    Key? key,
    this.padding,
    this.hintText,
    this.labelText,
    this.textEditingController,
    this.textInputType,
    this.sufixIcon,
    this.obscureText,
    this.inputFormater,
    this.validator,
    this.helperText,
    this.controller,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.greenTwo,
    ),
    // borderRadius: BorderRadius.all(Radius.circular(15)),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
      child: TextFormField(
        validator: widget.validator,
        style: AppTextStyle.inputText.copyWith(color: AppColors.greenOne),
        inputFormatters: widget.inputFormater,
        obscureText: widget.obscureText ?? false,
        controller: widget.textEditingController,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          helperText: widget.helperText,
          helperMaxLines: 5,
          helperStyle:
              AppTextStyle.inputHintText.copyWith(color: AppColors.grey),
          suffixIcon: widget.sufixIcon,
          labelText: widget.labelText?.toUpperCase(),
          hintText: widget.hintText,
          hintStyle: AppTextStyle.inputText.copyWith(color: AppColors.greenOne),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle:
              AppTextStyle.inputLabelText.copyWith(color: AppColors.grey),
          focusedBorder: defaultBorder,
          errorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: defaultBorder,
          enabledBorder: defaultBorder,
        ),
      ),
    );
  }
}
