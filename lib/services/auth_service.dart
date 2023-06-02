import 'package:financeiro_app/common/models/user_model.dart';

abstract class AuthService {
  Future<UserModel> signUp(
      {String? nome, required String email, required String password});

  Future<UserModel> signIn({required String email, required String password});
}
