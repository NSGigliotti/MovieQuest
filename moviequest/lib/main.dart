import 'package:flutter/material.dart';
import 'package:moviequest/controllers/login_controller.dart';
import 'package:moviequest/controllers/playgame_controller.dart';
import 'package:moviequest/routes/app_routes.dart';
import 'package:moviequest/ui/core/theme/theme.dart';
import 'package:moviequest/ui/screens/home/home_screen.dart';
import 'package:moviequest/ui/screens/login/login_screen.dart';
import 'package:moviequest/ui/screens/playgame/widgets/play_screen_component.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<LoginController>(create: (_) => LoginController()),
        ProxyProvider<LoginController, PlayGameController>(
          update: (_, controller, __) => PlayGameController(controller),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = AppTheme();
    return MaterialApp(
      title: 'MovieQuest',
      debugShowCheckedModeBanner: false,
      theme: appTheme.theme,
      home: LoginScreen(),
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.home: (context) => HomeScreen(),
        AppRoutes.game: (context) => PlayScreenComponent(),
      },
    );
  }
}
