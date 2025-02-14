import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:moviequest/constansts/storage_keys.dart';
import 'package:moviequest/controllers/user_controller.dart';
import 'package:moviequest/routes/app_routes.dart';
import 'package:moviequest/services/toast_messagens.dart';
import 'package:moviequest/services/utils_services.dart';
import 'package:moviequest/ui/screens/login/repository/login_repository.dart';
import 'package:moviequest/ui/screens/login/results/login_result.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  @observable
  bool isLogin = false;

  @observable
  bool isLoading = false;

  @observable
  bool stayConnected = true;

  @observable
  TextEditingController email = TextEditingController();

  @observable
  TextEditingController password = TextEditingController();

  //*------------------------------------------------------------
  @observable
  TextEditingController emailRegister = TextEditingController();

  @observable
  TextEditingController passwordRegister = TextEditingController();

  @observable
  TextEditingController nameRegister = TextEditingController();

  @observable
  TextEditingController passwordConfirmRegister = TextEditingController();

  //*------------------------------------------------------------

  @observable
  var formKeyLogin = GlobalKey<FormState>();

  @observable
  var formKeyCreatAcount = GlobalKey<FormState>();

  @action
  void switchLogin() {
    isLogin = !isLogin;
  }

  @action
  void switchLoadin() {
    isLoading = !isLoading;
  }

  @action
  void changeStayConnected() {
    stayConnected = !stayConnected;
  }

  @action
  Future<void> login({required BuildContext context}) async {
    switchLoadin();
    if (!formKeyLogin.currentState!.validate()) {
      switchLoadin();
      return;
    }

    LoginRepository repository = LoginRepository();
    AuthResult result = await repository.login(
      email: email.text,
      password: password.text,
    );

    result.when(
      success: (user) {
        UserController userController = UserController();
        userController.user = user;

        UtilsServices.showToast(message: ToastMessagens.loginSuccess);

        if (stayConnected) {
          UtilsServices.saveLocalData(
            key: StorageKeys.token,
            data: user.token!,
          );
        }

        enterWithoutLogin(context: context);
      },
      error: (message) {
        UtilsServices.showToast(message: message, isError: true);
      },
    );

    switchLoadin();
  }

  Future<void> createAcont({required BuildContext context}) async {
    switchLoadin();
    if (!formKeyCreatAcount.currentState!.validate()) {
      switchLoadin();
      return;
    }

    if (passwordRegister.text != passwordConfirmRegister.text) {
      UtilsServices.showToast(
        message: "Senhas nao correspondem",
        isError: true,
      );
      switchLoadin();
      return;
    }

    LoginRepository repository = LoginRepository();
    AuthResult result = await repository.creatAcont(
      email: emailRegister.text,
      password: passwordRegister.text,
      checkPassword: passwordConfirmRegister.text,
      name: nameRegister.text,
    );

    result.when(
      success: (user) {
        UserController userController = UserController();
        userController.user = user;

        emailRegister.clear();
        passwordRegister.clear();
        passwordConfirmRegister.clear();
        nameRegister.clear();

        UtilsServices.showToast(message: ToastMessagens.registerSuccess);

        enterWithoutLogin(context: context);
      },
      error: (message) {
        UtilsServices.showToast(message: message, isError: true);
      },
    );

    switchLoadin();
  }

  void enterWithoutLogin({required BuildContext context}) {
    Navigator.popAndPushNamed(context, AppRoutes.home);
  }
}
