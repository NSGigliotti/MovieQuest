import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviequest/ui/core/theme/theme.dart';
import 'package:moviequest/ui/screens/login/widgets/loginWIdget.dart';
import 'package:mobx/mobx.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      decoration: AppTheme.loginScreen,
      child: Scaffold(
        appBar: AppBar(),
        body: ScrollNotificationObserver(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                Expanded(child: Container()),
                LoginWIdget(),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
