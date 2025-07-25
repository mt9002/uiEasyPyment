import 'package:first_app/src/features/auth/domain/interfaces/login_repository.dart';

class LoginUseCase {
  final ILoginRepository loginRepository;

  LoginUseCase(this.loginRepository);

  Future<bool?> login(String email, String password) {
    return loginRepository.login(email, password);
  }
}
