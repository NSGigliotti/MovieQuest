import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviequest/controllers/login_controller.dart';
import 'package:moviequest/ui/core/theme/theme.dart';
import 'package:moviequest/ui/widgets/button.dart';
import 'package:moviequest/ui/widgets/textFildStyle.dart';

class LoginWIdget extends StatefulWidget {
  const LoginWIdget({super.key});

  @override
  State<LoginWIdget> createState() => _LoginWIdgetState();
}

class _LoginWIdgetState extends State<LoginWIdget> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _createAccountFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Provider.of<LoginController>(context);

    AppTheme appTheme = AppTheme();

    return Observer(
      builder: (_) => Stack(
        children: [
          controller.isLoading
              ? SizedBox(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Card(
                  elevation: 1,
                  color: const Color.fromARGB(78, 0, 0, 0),
                  child: IntrinsicHeight(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.transparent,
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      child: controller.isLogin
                          ? Form(
                              key: _createAccountFormKey,
                              child: Column(
                                children: [
                                  TextFildStyle(
                                    hintText: "Nome",
                                    textController: controller.nameRegister,
                                  ),
                                  TextFildStyle(
                                    hintText: "Email",
                                    textController: controller.emailRegister,
                                  ),
                                  TextFildStyle(
                                    hintText: "Senha",
                                    isPassword: true,
                                    textController: controller.passwordRegister,
                                  ),
                                  TextFildStyle(
                                    hintText: "Confirmaçao de Senha",
                                    isPassword: true,
                                    textController:
                                        controller.passwordConfirmRegister,
                                  ),
                                  SizedBox(height: 13),
                                  Row(
                                    children: [
                                      Expanded(child: Container()),
                                      Button(
                                        text: "Criar contar",
                                        onClick: () => controller.createAcont(
                                            context: context,
                                            formKey: _createAccountFormKey),
                                      ),
                                      Expanded(child: Container()),
                                      Button(
                                        text: "Fazer login",
                                        onClick: () => controller.switchLogin(),
                                      ),
                                      Expanded(child: Container()),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Form(
                              key: _loginFormKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFildStyle(
                                    hintText: "Login",
                                    textController: controller.email,
                                  ),
                                  TextFildStyle(
                                    hintText: "Senha",
                                    isPassword: true,
                                    textController: controller.password,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Checkbox(
                                        value: controller.stayConnected,
                                        onChanged: (status) =>
                                            controller.changeStayConnected(),
                                      ),
                                      Text(
                                        'Manter Conectado',
                                        style: appTheme.textLogin,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(child: Container()),
                                      Button(
                                        text: "Login",
                                        onClick: () => controller.login(
                                          context: context,
                                          formKey: _loginFormKey,
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      Button(
                                        text: "Criar Conta",
                                        onClick: () => controller.switchLogin(),
                                      ),
                                      Expanded(child: Container()),
                                    ],
                                  ),
                                  Expanded(child: Container()),
                                  Button(
                                    text: "Entrar sem login",
                                    onClick: () => controller.BrowseAteHome(
                                        context: context),
                                  ),
                                  Expanded(child: Container()),
                                ],
                              ),
                            ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
