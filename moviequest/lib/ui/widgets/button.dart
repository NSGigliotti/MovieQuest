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
    AppTheme appTheme = AppTheme();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: appTheme.buttonStyle,
        onPressed: onClick,
        child: Text(text, style: appTheme.buttonTextStyle),
      ),
    );
  }
}
