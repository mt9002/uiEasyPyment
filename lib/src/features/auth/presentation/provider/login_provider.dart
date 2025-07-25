// presentation/providers/login_provider.dart
import 'package:first_app/src/features/auth/domain/entities/login.dart';
import 'package:first_app/src/features/auth/domain/usecases/login_use_case.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final LoginUseCase loginUseCase;

  LoginProvider(this.loginUseCase);

  bool isLoading = false;
  bool? _resp;
  String? error;

  Credentials credentialsEntity = Credentials.empty();

  bool? get getResp => _resp;

  void setEmail(String email) {
    credentialsEntity.setEmail(email);
  }

  void setPassword(String password) {
    credentialsEntity.setPassword(password);
  }

  String? validatorFilds(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Este campo es obligatorio';
    }
    return null;
  }

  Future<void> login() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 4));
      _resp = await loginUseCase.login(
        credentialsEntity.getEmail,
        credentialsEntity.getPassword,
      );
      if (_resp == false) {
        error = 'Credenciales incorrectas';
      }
    } catch (e) {
      error = 'Error inesperado: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
