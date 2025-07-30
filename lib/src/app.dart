import 'package:first_app/src/features/auth/presentation/screen/home_screen.dart';
import 'package:first_app/src/features/auth/presentation/screen/login_screen.dart';
import 'package:first_app/src/features/bill/presentation/screen/bill_screen.dart';
import 'package:flutter/material.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'application',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
      initialRoute: '/login',
      routes: {
        '/bill': (context) =>  BillScreen(), 
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomeScreen(),  
        
      },
    );
  }
}
