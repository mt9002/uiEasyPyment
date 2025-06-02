import 'package:first_app/src/features/auth/domain/usecases/LoginUseCase.dart';

class LoginService {
  final LoginUseCase _loginUseCase;

  LoginService(this._loginUseCase);

  Future<bool?> login(String email, String password) {
    print( "Email_application: $email");
    return _loginUseCase.execute(email, password);
  }
}
