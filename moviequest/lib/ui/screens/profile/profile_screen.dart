import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviequest/controllers/login_controller.dart';
import 'package:moviequest/ui/widgets/button.dart';
import 'package:moviequest/ui/widgets/textFildStyle.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final userController = Provider.of<LoginController>(context);

    final GlobalKey<FormState> _changePasswordFormKey = GlobalKey<FormState>();

    final GlobalKey<FormState> __deletAcountFormKey = GlobalKey<FormState>();

    userController.deletContext = context;
    
    return Observer(
      builder: (_) => userController.user.token == ""
          ? Container()
          : SizedBox(
              height: size.width,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Container()),
                  Button(
                    //!-------------------------------- Trocar Senha --------------------------------
                    text: "Trocar Senha",
                    onClick: () => showDialog(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: const Text('Trocar Senha'),
                          actions: <Widget>[
                            Form(
                              key: _changePasswordFormKey,
                              child: Column(
                                children: [
                                  TextFildStyle(
                                    isPassword: true,
                                    hintText: "Digite a senha antida",
                                    textController:
                                        userController.oldPasswordChange,
                                  ),
                                  TextFildStyle(
                                    isPassword: true,
                                    hintText: "Digite a nova senha",
                                    textController:
                                        userController.passwordChangeNew,
                                  ),
                                  TextFildStyle(
                                    isPassword: true,
                                    hintText: "Confirme a nova senha",
                                    textController:
                                        userController.passwordChangeNewConfirm,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    child: const Text(
                                      'Cancelar',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(dialogContext).pop();
                                    },
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green),
                                    child: const Text(
                                      'Confirmar',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    onPressed: () =>
                                        userController.changePassword(
                                            formKey: _changePasswordFormKey,
                                            context: dialogContext),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  //!-------------------------------- Logout --------------------------------

                  Expanded(child: Container()),
                  Button(
                    text: "Logout",
                    onClick: () => showDialog(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: const Text('Desconectar do aplicativo'),
                          content: Text("Deseja dexconectar ?"),
                          actions: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    child: const Text(
                                      'Cancelar',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(dialogContext).pop();
                                    },
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green),
                                    child: const Text(
                                      'Confirmar',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    onPressed: () =>
                                        userController.logout(context),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),

                  //!-------------------------------- apagar conta --------------------------------
                  Expanded(child: Container()),
                  Button(
                    text: "Apagar Conta",
                    onClick: () => showDialog(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: const Text('Deletar conta'),
                          content:
                              Text("Deseja realmete deletar a sua conta ?"),
                          actions: <Widget>[
                            Form(
                              key: __deletAcountFormKey,
                              child: TextFildStyle(
                                hintText: "Senha necessaria",
                                textController:
                                    userController.passwordDeletAcount,
                                isPassword: true,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    child: const Text(
                                      'Cancelar',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(dialogContext).pop();
                                    },
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green),
                                    child: const Text(
                                      'Confirmar',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    onPressed: () =>
                                        userController.deleteAcount(
                                      formKey: __deletAcountFormKey,
                                      context: context,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
    );
  }
}
