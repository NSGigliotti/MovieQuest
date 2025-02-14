import 'package:flutter/material.dart';

class AppTheme {
  // static Color primary = HexColor('09FBD3');

  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
  );

  static BoxDecoration loginScreen = BoxDecoration(
    image: DecorationImage(
      image: AssetImage("lib/ui/core/assets/backgorundLogin.jpg"),
      fit: BoxFit.cover,
    ),
  );

  static BoxDecoration homeScreen = BoxDecoration(
    image: DecorationImage(
      image: AssetImage("lib/ui/core/assets/quizpng2.jpg"),
      fit: BoxFit.cover,
    ),
  );

  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(136, 28, 4, 241),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );

  static TextStyle textLogin = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    letterSpacing: 1.25,
    shadows: [
      Shadow(
        blurRadius: 5,
        color: Colors.black,
        offset: Offset(1.0, 1.0),
      ),
      Shadow(
        blurRadius: 5,
        color: Colors.black,
        offset: Offset(-1.0, -1.0),
      ),
    ],
  );
}
