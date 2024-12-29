import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Variable para validar el formulario
  final _formKey = GlobalKey<FormState>();

  // Función para manejar el inicio de sesión
  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      // Aquí puedes agregar la lógica para enviar los datos
      // Al iniciar sesión, podrías navegar a la siguiente pantalla
      print('Correo: ${_emailController.text}');
      print('Contraseña: ${_passwordController.text}');

      // Ejemplo de navegación hacia la pantalla de inicio (Home)
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Campo de correo
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                  hintText: 'Ingresa tu correo',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu correo';
                  }
                  // Validación de correo
                  final emailRegex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Correo no válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo de contraseña
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  hintText: 'Ingresa tu contraseña',
                ),
                obscureText: true, // Oculta la contraseña
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu contraseña';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // Botón de inicio de sesión
              Center(
                child: ElevatedButton(
                  onPressed: _login,
                  child: const Text('Iniciar sesión'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
