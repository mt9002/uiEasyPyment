import 'package:first_app/src/features/auth/domain/interfaces/login_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginRepositoryImpl extends ILoginRepository { 

@override
Future<bool> login(String email, String password) async {
  try {
    print("Email-INFRA: $email");
    print("Password: $password");
    
    final url = Uri.parse('https://reqres.in/api/login');
    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'x-api-key': 'reqres-free-v1',
        'Content-Type': 'application/json',
      },
      body: json.encode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('Token recibido: ${data['token']}');
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