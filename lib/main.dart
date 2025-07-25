import 'package:first_app/injection_container.dart';
import 'package:first_app/src/app.dart';
import 'package:first_app/src/features/auth/presentation/provider/home_provider.dart';
import 'package:first_app/src/features/bill/presentation/provider/bill_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'src/features/auth/presentation/provider/login_provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  setupDependencies();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<LoginProvider>()),
        ChangeNotifierProvider(create: (_) => sl<HomeProvider>()),
        ChangeNotifierProvider(create: (_) => sl<BillProvider>()),
      ],
      child: const AppRoot(),
    ),
  );
}
