// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:moviequest/ui/core/theme/theme.dart';

class Button extends StatelessWidget {
// ignore: use_super_parameters

  const Button({
    Key? key,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  final String text;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: AppTheme.buttonStyle,
        onPressed: onClick,
        child: Text(
          text,
          style: TextStyle(
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
          ),
        ),
      ),
    );
  }
}
