import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFildStyle extends StatefulWidget {
  TextFildStyle(
      {super.key,
      required this.hintText,
      required this.textController,
      this.isPassword = false});

  final String hintText;
  TextEditingController textController;
  bool isPassword;

  @override
  State<TextFildStyle> createState() => _TextFildStyleState();
}

class _TextFildStyleState extends State<TextFildStyle> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();

    isObscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 18, bottom: 3),
      child: TextFormField(
        controller: widget.textController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '${widget.hintText} Obrigatorio';
          } else {
            return null;
          }
        },
        obscureText: isObscure,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                )
              : null,
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
