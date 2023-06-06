import 'dart:developer';
import 'package:financeiro_app/common/widgets/custom_bottom_sheet.dart';
import 'package:financeiro_app/common/widgets/password_form_field.dart';
import 'package:financeiro_app/features/sign_in/sign_in_state.dart';
import 'package:financeiro_app/services/mock_auth_service.dart';
import 'package:flutter/material.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_style.dart';
import '../../common/constants/routes.dart';
import '../../common/utils/validator.dart';
import '../../common/widgets/custom_circular_progress_indicator.dart';
import '../../common/widgets/custom_text_field_form.dart';
import '../../common/widgets/primary_button.dart';
import 'sign_in_controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _controller = SignInController(MockAuthService());

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignInStateLoading) {
        const CustomCircularProgressIndicator();
      }
      if (_controller.state is SignInStateSuccess) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(
                child: Text("Nova tela!"),
              ),
            ),
          ),
        );
      }
      if (_controller.state is SignInStateError) {
        final error = _controller.state as SignInStateError;
        Navigator.pop(context);
        customModalBottomSheet(
          context,
          error.message,
          "Tentar novamente",
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            "Welcome Back!",
            textAlign: TextAlign.center,
            style: AppTextStyle.mediumText.copyWith(color: AppColors.greenTwo),
          ),
          const SizedBox(height: 15.0),
          Image.asset("assets/images/login_image.png"),
          const SizedBox(height: 15.0),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _emailController,
                  labelText: 'Seu Email',
                  validator: Validator.validateEmail,
                  hintText: "seuemail@email.com",
                ),
                PassWordFormField(
                  labelText: 'Sua Senha',
                  //validator: Validator.validateSenha,
                  hintText: '********',
                  controller: _passwordController,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
            child: PrimaryButton(
              btnText: 'Sign In',
              onPressed: () {
                final valid = _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  log("Valido!");
                  _controller.doSingIn(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                } else {
                  log("Não valido!");
                }
              },
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.popAndPushNamed(
              context,
              NamedRoutes.signUp,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have account? ',
                  style: AppTextStyle.smallText.copyWith(color: AppColors.grey),
                ),
                Text(
                  'Sign Up',
                  style: AppTextStyle.smallText
                      .copyWith(color: AppColors.greenOne),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
