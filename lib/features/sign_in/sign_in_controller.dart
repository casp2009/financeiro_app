import 'package:financeiro_app/features/sign_in/sign_in_state.dart';
import 'package:financeiro_app/services/auth_service.dart';
import 'package:flutter/foundation.dart';

class SignInController extends ChangeNotifier {
  final AuthService _service;
  SignInController(this._service);

  SignInState _state = SignInStateInitial();
  SignInState get state => _state;

  void _changeState(SignInState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> doSingIn(
      {required String email, required String password}) async {
    _changeState(SignInStateLoading());
    try {
      // throw Exception();
      await _service.signIn(
        email: email,
        password: password,
      );
      _changeState(SignInStateSuccess());
    } catch (e) {
      _changeState(SignInStateError(e.toString()));
    }
  }
}
