import 'package:flutter/material.dart';

class PlayButtonComponent extends StatelessWidget {
  PlayButtonComponent({super.key, required this.onCLick});

  final Function() onCLick;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onCLick,
        child: Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(4, 4),
                blurRadius: 15.0,
                spreadRadius: 5.0,
              ),
            ],
          ),
          child: Center(
            child: Text(
              "Play",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico', // Fonte descontraída
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: const Color.fromARGB(255, 200, 255, 0),
                    offset: Offset(4, 4),
                    blurRadius: 8,
                  ),
                  Shadow(
                    color: const Color.fromARGB(255, 21, 255, 0),
                    offset: Offset(-2, -2),
                    blurRadius: 8,
                  ),
                  Shadow(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    offset: Offset(0, 0),
                    blurRadius: 8,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
