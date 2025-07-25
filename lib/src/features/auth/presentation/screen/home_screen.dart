import 'package:first_app/src/features/auth/presentation/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('¡Bienvenido a Home!', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 60),
            Image.asset('assets/images/gif1.gif', width: 200, height: 200),
            const SizedBox(height: 20),
            Text('Valor del Slider:${homeProvider.getInitialValue}',
                style: const TextStyle(fontSize: 20)),
            Slider(
                min: 0,
                max: 100,
                value: homeProvider.getInitialValue,
                thumbColor: Colors.deepPurple,
                overlayColor: WidgetStateProperty.all(const Color.fromARGB(66, 99, 66, 96)),
                onChanged: homeProvider.onChanged),
          ],
        ),
      ),
    );
  }
}
