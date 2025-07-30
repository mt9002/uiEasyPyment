// presentation/pages-screen/login_page.dart
import 'package:first_app/src/features/auth/presentation/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.watch<LoginProvider>();
    return Scaffold(
        appBar: AppBar(title: const Text("Login")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  onChanged: loginProvider.setEmail),
              TextField(
                  decoration: const InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                  onChanged: loginProvider.setPassword),
              const SizedBox(height: 16),
              (loginProvider.isLoading)
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        await loginProvider.login();
                        if (!context.mounted) return;
                        if (loginProvider.getResp == true) {
                          Navigator.pushNamed(context, '/bill');
                        }
                      },
                      child: const Text('Iniciar sesión'),
                    ),
              if (loginProvider.error != null) ...[
                const SizedBox(height: 16),
                Text(loginProvider.error!,
                    style: const TextStyle(color: Colors.red)),
              ],
            ],
          ),
        ));
  }
}
