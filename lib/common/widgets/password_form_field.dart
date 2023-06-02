import 'package:flutter/material.dart';

import 'package:financeiro_app/common/widgets/custom_text_field_form.dart';

class PassWordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final String? helperText;

  const PassWordFormField({
    Key? key,
    this.controller,
    this.padding,
    this.hintText,
    this.labelText,
    this.validator,
    this.helperText,
  }) : super(key: key);

  @override
  State<PassWordFormField> createState() => _PassWordFormFieldState();
}

class _PassWordFormFieldState extends State<PassWordFormField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: widget.validator,
      obscureText: isHidden,
      textEditingController: widget.controller,
      padding: widget.padding,
      hintText: widget.hintText,
      labelText: widget.labelText,
      helperText: widget.helperText,
      sufixIcon: InkWell(
        borderRadius: BorderRadius.circular(23),
        child: Icon(isHidden ? Icons.visibility_off : Icons.visibility),
        onTap: () {
          setState(() {
            isHidden = !isHidden;
          });
        },
      ),
    );
  }
}
