class Validator {
  Validator._();

  static String? validateConfirmSenha(String? value, String? primeiraSenha) {
    if (value!.isEmpty) {
      return "O campo não pode estar vazio!";
    }
    if (value != primeiraSenha) {
      return "As senhas não conferem.";
    }
    return null;
  }

  static String? validateSenha(String? value) {
    if (value!.isEmpty) {
      return "O campo não pode estar vazio!";
    } else if (value.length < 8) {
      return "A senha deve conter no minimo 8 digitos.";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "O campo não pode estar vazio!";
    }
    return null;
  }

  static String? validateNome(String? value) {
    final condition = RegExp(
        r"^(?:[\u00c0-\u01ffa-zA-Z'-]){2,}(?:\s[\u00c0-\u01ffa-zA-Z'-]{2,})+$");
    if (value!.isEmpty) {
      return "O campo não pode estar vazio!";
    }
    if (!value.contains(condition)) {
      return "Nome inválido!";
    }
    return null;
  }
}
