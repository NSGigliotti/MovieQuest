import 'package:flutter/material.dart';

class AppTheme {
  // static Color primary = HexColor('09FBD3');

  static final String _backgorundLogin =
      "lib/ui/core/assets/backgorundLogin.jpg";
  static final String _backgorundApp = "lib/ui/core/assets/quizpng2.jpg";

  ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 1,
      selectedIconTheme: IconThemeData(color: Colors.white, size: 35),
      unselectedIconTheme: IconThemeData(color: Colors.grey, size: 25),
      unselectedLabelStyle: TextStyle(fontSize: 0),
    ),
  );

  BoxDecoration loginScreen = BoxDecoration(
    image: DecorationImage(
      image: AssetImage(_backgorundLogin),
      fit: BoxFit.cover,
    ),
  );

  BoxDecoration homeScreen = BoxDecoration(
    image: DecorationImage(
      image: AssetImage(_backgorundApp),
      fit: BoxFit.cover,
    ),
  );

  ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(136, 28, 4, 241),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );

  BoxDecoration imageBoxDecoration = BoxDecoration(
    color: Colors.transparent,
    border: Border.all(
      color: Colors.lightGreen.shade200,
      width: 6.3,
    ),
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade400,
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3), // Posição da sombra
      ),
    ],
  );

  TextStyle textLogin = TextStyle(
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

  TextStyle buttonTextStyle = TextStyle(
    fontSize: 15,
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

  TextStyle pointStyle = TextStyle(
    fontFamily: "04b",
    fontSize: 75,
    color: Colors.yellow[600],
    shadows: [
      Shadow(
        offset: Offset(3.0, 3.0),
        blurRadius: 6.0,
        color: Colors.orange[900]!,
      ),
      Shadow(
        offset: Offset(-2.0, -2.0),
        blurRadius: 3.0,
        color: Colors.yellow[100]!,
      ),
    ],
  );

  TextStyle subtitlePointStyle = TextStyle(
    fontSize: 30,
    fontFamily: "upheavtt",
    color: Colors.amberAccent[400],
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        offset: Offset(3.0, 3.0),
        blurRadius: 2.0,
        color: Colors.black87,
      ),
    ],
  );

  TextStyle scoreTextStyle = TextStyle(
    fontFamily: "f25",
    fontSize: 13.5,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}
