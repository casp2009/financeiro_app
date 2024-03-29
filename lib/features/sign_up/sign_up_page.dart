import 'dart:developer';
import 'package:financeiro_app/common/widgets/custom_bottom_sheet.dart';
import 'package:financeiro_app/common/widgets/password_form_field.dart';
import 'package:financeiro_app/features/sign_up/sign_up_controller.dart';
import 'package:financeiro_app/features/sign_up/sign_up_state.dart';
import 'package:financeiro_app/services/mock_auth_service.dart';
import 'package:flutter/material.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_style.dart';
import '../../common/constants/routes.dart';
import '../../common/utils/validator.dart';
import '../../common/widgets/custom_circular_progress_indicator.dart';
import '../../common/widgets/custom_text_field_form.dart';
import '../../common/widgets/primary_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _passwordController = TextEditingController();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _controller = SingUpController(MockAuthService());

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _nomeController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignUpLoadingState) {
        const CustomCircularProgressIndicator();
      }
      if (_controller.state is SignUpSuccessState) {
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
      if (_controller.state is SignUpErrorState) {
        final error = _controller.state as SignUpErrorState;
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
            "Spend Smarter",
            textAlign: TextAlign.center,
            style: AppTextStyle.mediumText.copyWith(color: AppColors.greenTwo),
          ),
          Text(
            "Save More",
            textAlign: TextAlign.center,
            style: AppTextStyle.mediumText.copyWith(color: AppColors.greenTwo),
          ),
          Image.asset("assets/images/todo_list.png"),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _nomeController,
                  labelText: 'Seu Nome',
                  validator: Validator.validateNome,
                ),
                CustomTextFormField(
                  controller: _emailController,
                  labelText: 'Seu Email',
                  validator: Validator.validateEmail,
                  hintText: "seuemail@email.com",
                ),
                PassWordFormField(
                  labelText: 'Escolha uma senha',
                  helperText: 'Must contain 8 characters',
                  validator: Validator.validateSenha,
                  hintText: '********',
                  controller: _passwordController,
                ),
                PassWordFormField(
                  labelText: 'Confirme a senha',
                  validator: (value) => Validator.validateConfirmSenha(
                      value, _passwordController.text),
                  hintText: '********',
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
              btnText: 'Sign Up',
              onPressed: () {
                final valid = _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  log("Valido!");
                  _controller.doSingUp(
                    nome: _nomeController.text,
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
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
