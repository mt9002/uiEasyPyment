// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:first_app/src/features/auth/application/login_service.dart';
import 'package:first_app/src/features/auth/domain/usecases/LoginUseCase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

void main() {
  late MockLoginUseCase mockLoginUseCase;
  late LoginService loginService;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    loginService = LoginService(mockLoginUseCase);
  });

    test('login returns true when credentials are correct', () async {
      // Arrange
      String email = 'test@email.com';
      String password = '1234';
      when(mockLoginUseCase.execute(email, password))
          .thenAnswer((_) async => true);

      // Act
      final result = await loginService.login(email, password);
  
      // Assert
      expect(result, true);
      verify(mockLoginUseCase.execute('test@email.com', '1234')).called(1);
    });
  }