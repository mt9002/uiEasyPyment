import 'package:flutter_application_1/src/app/screens/home.dart';
import 'package:flutter_application_1/src/app/screens/login.dart';
import 'package:flutter_application_1/src/app/themes/home_theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: homeTheme,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) =>
            const MyHomePage(title: 'Cuentas claras - chocolate espeso'),
      },
      // home: const MyHomePage(title: 'Cuentas claras - chocolate espeso'),
    );
  }
}
