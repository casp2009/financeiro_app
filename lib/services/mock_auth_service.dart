import 'package:financeiro_app/common/models/user_model.dart';
import 'package:financeiro_app/services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(
        email: email,
        password: password,
      );
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Erro ao logar.';
      }
    }
    throw 'Não foi possivel realizar login.';
  }

  @override
  Future<UserModel> signUp(
      {String? nome, required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(
        id: email.hashCode,
        nome: nome,
        email: email,
      );
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Senha não pode ser sequencial';
      }
    }
    throw 'Não foi possivél criar a conta';
  }
}
