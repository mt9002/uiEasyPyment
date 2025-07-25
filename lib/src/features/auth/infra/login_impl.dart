import 'package:first_app/src/features/auth/domain/interfaces/login_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginRepositoryImpl implements ILoginRepository {
  @override
  Future<bool> login(String email, String password) async {
    try {
      final url = Uri.parse('http://localhost:8080/auth/login');
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: json.encode({'email': email, 'password': password}),
      );
      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        print('Token recibido: ${body['data']}');
        return true;
      } else {
        print('Error en la solicitud: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Excepción en login: $e');
      return false;
    }
  }
}
