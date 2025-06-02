// domain/usecases/login_usecase.dart
import 'package:first_app/src/features/auth/domain/interfaces/login_repository.dart';

class LoginUseCase {
  final ILoginRepository loginRepository;

  LoginUseCase(this.loginRepository);

  Future<bool?> execute(String email, String password) {
    print( "Email_usecase: $email");
    return loginRepository.login(email, password);
  }
}
