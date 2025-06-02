// presentation/providers/login_provider.dart
import 'package:first_app/src/features/auth/application/login_service.dart';
import 'package:first_app/src/features/auth/domain/entities/login.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final LoginService loginService;

  LoginProvider(this.loginService);

  bool isLoading = false;
  bool? resp;
  String? error;

  Credentials credentialsEntity = Credentials.empty();

  void setEmail(String email) {
    credentialsEntity.setEmail(email);
    print('Email-provedor: ${credentialsEntity.email}');
  }

  void setPassword(String password) {
    credentialsEntity.setPassword(password);
  }

  Future<void> login() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final result = await loginService.login(
          credentialsEntity.email, credentialsEntity.password);
      if (result == null) {
        error = 'Credenciales incorrectas';
      } else {
        resp = result;
        
      }
    } catch (e) {
      error = 'Error inesperado: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}


  // Future<void> login(String email, String password) async {
  //   isLoading = true;
  //   error = null;
  //   notifyListeners();

  //   try {
  //     resp = await loginService.login(email, password);
  //     if (resp == false) {
  //       error = "Credenciales inválidas";
  //     }
  //   } catch (e) {
  //     error = "Error del servidor";
  //   } finally {
  //     isLoading = false;
  //     notifyListeners();
  //   }
  // }