import 'package:flutter/material.dart';
import 'package:moviequest/controllers/login_controller.dart';
import 'package:moviequest/ui/core/theme/theme.dart';
import 'package:moviequest/ui/screens/login/widgets/loginWIdget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginController _loginController;

  @override
  void initState() {
    super.initState();
    _loginController = Provider.of<LoginController>(context, listen: false);
    _loginController.validateToken(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

     AppTheme appTheme = AppTheme();

    return Container(
      width: size.width,
      height: size.height,
      decoration: appTheme.loginScreen,
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
