import 'package:flutter/material.dart';
import 'package:moviequest/controllers/navigation_store.dart';
import 'package:moviequest/routes/app_routes.dart';
import 'package:moviequest/ui/core/theme/theme.dart';
import 'package:moviequest/ui/screens/home/home_screen.dart';
import 'package:moviequest/ui/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider(
      create: (_) => NavigationStore(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: LoginScreen(),
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.home: (context) => HomeScreen(),
      },
    );
  }
}
