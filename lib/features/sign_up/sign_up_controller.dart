import 'package:financeiro_app/features/sign_up/sign_up_state.dart';
import 'package:financeiro_app/services/auth_service.dart';
import 'package:flutter/foundation.dart';

class SingUpController extends ChangeNotifier {
  final AuthService _service;
  SingUpController(this._service);

  SignUpState state = SignUpInitialState();

  void changeState(SignUpState newState) {
    state = newState;
    notifyListeners();
  }

  Future<void> doSingUp(
      {required String nome,
      required String email,
      required String password}) async {
    changeState(SignUpLoadingState());
    try {
      // throw Exception();
      await _service.signUp(
        nome: nome,
        email: email,
        password: password,
      );
      changeState(SignUpSuccessState());
    } catch (e) {
      changeState(SignUpErrorState(e.toString()));
    }
  }
}
