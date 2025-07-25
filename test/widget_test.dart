// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:first_app/src/features/auth/domain/interfaces/login_repository.dart';
import 'package:first_app/src/features/auth/domain/usecases/login_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLoginImp extends Mock implements ILoginRepository {}

void main() {
  late MockLoginImp mockLoginRepository;
  late LoginUseCase loginUseCase;

  setUp(() {
    mockLoginRepository = MockLoginImp();
    loginUseCase = LoginUseCase(mockLoginRepository);
  });

    test('login returns true when credentials are correct', () async {
      // Arrange
      String email = 'test@email.com';
      String password = '1234';
      when(mockLoginRepository.login(email, password))
          .thenAnswer((_) async => true);

      // Act
      final result = await loginUseCase.login(email, password);
  
      // Assert
      expect(result, true);
      verify(mockLoginRepository.login('test@email.com', '1234')).called(1);
    });
  }