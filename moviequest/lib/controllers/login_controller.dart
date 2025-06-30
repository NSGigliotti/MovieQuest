import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:moviequest/constansts/storage_keys.dart';
import 'package:moviequest/models/user_model.dart';
import 'package:moviequest/routes/app_routes.dart';
import 'package:moviequest/services/toast_messagens.dart';
import 'package:moviequest/services/utils_services.dart';
import 'package:moviequest/ui/screens/home/home_screen.dart';
import 'package:moviequest/ui/screens/login/repository/login_repository.dart';
import 'package:moviequest/ui/screens/login/results/login_result.dart';
import 'package:moviequest/ui/screens/profile/result/change_password_result.dart';
import 'package:moviequest/ui/screens/profile/result/delete_acount_result.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  @observable
  bool isLogin = false;

  String token = "";

  @observable
  bool isLoading = true;

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
  TextEditingController oldPasswordChange = TextEditingController();

  @observable
  TextEditingController passwordChangeNew = TextEditingController();

  @observable
  TextEditingController passwordChangeNewConfirm = TextEditingController();

  //*------------------------------------------------------------

  @observable
  TextEditingController passwordDeletAcount = TextEditingController();

  @observable
  late BuildContext deletContext;

  //*------------------------------------------------------------

  LoginRepository repository = LoginRepository();

  UtilsServices utilsServices = UtilsServices();

  @observable
  late UserModel user = UserModel();

  //*------------------------------------------------------------

  @action
  void switchLogin() {
    isLogin = !isLogin;
  }

  @action
  void changeStayConnected() {
    stayConnected = !stayConnected;
  }

  @action
  Future<void> validateToken(BuildContext context) async {
    String? token = await utilsServices.getlocalData(key: StorageKeys.token);

    if (token == null) {
      isLoading = false;
    } else {
      AuthResult result = await repository.validateToken(token);
      result.when(
        success: (userLoad) {
          this.user = userLoad;
          isLoading = false;
          saveTokenAndProcedToBase(context);
        },
        error: (message) {
          logout(context);
          isLoading = false;
        },
      );
    }
  }

  void saveTokenAndProcedToBase(BuildContext context) {
    utilsServices.saveLocalData(key: StorageKeys.token, data: user.token!);

    BrowseAteHome(context: context);
  }

  @action
  Future<void> login(
      {required BuildContext context,
      required GlobalKey<FormState> formKey}) async {
    isLoading = true;
    if (!formKey.currentState!.validate()) {
      isLoading = false;
      return;
    }

    AuthResult result = await repository.login(
      email: email.text,
      password: password.text,
    );

    result.when(
      success: (user) {
        this.user = user;
        utilsServices.showToast(message: ToastMessagens.loginSuccess);
        if (stayConnected) {
          saveTokenAndProcedToBase(context);
        } else {
          BrowseAteHome(context: context);
        }
      },
      error: (message) {
        utilsServices.showToast(message: message, isError: true);
      },
    );

    isLoading = false;
  }

  Future<void> createAcont(
      {required BuildContext context,
      required GlobalKey<FormState> formKey}) async {
    isLoading = true;
    if (!formKey.currentState!.validate()) {
      isLoading = false;
      return;
    }

    if (passwordRegister.text != passwordConfirmRegister.text) {
      utilsServices.showToast(
        message: "Senhas nao correspondem",
        isError: true,
      );
      isLoading = false;
      return;
    }

    AuthResult result = await repository.creatAcont(
      email: emailRegister.text,
      password: passwordRegister.text,
      checkPassword: passwordConfirmRegister.text,
      name: nameRegister.text,
    );

    result.when(
      success: (user) {
        this.user = user;

        emailRegister.clear();
        passwordRegister.clear();
        passwordConfirmRegister.clear();
        nameRegister.clear();

        utilsServices.showToast(message: ToastMessagens.registerSuccess);

        BrowseAteHome(context: context);
      },
      error: (message) {
        utilsServices.showToast(message: message, isError: true);
      },
    );

    isLoading = false;
  }

  Future<void> changePassword(
      {required GlobalKey<FormState> formKey,
      required BuildContext context}) async {
    isLoading = true;

    if (!formKey.currentState!.validate()) {
      isLoading = false;
      return;
    }
    Navigator.of(context).pop();

    ChangePasswordResult result = await repository.changePassword(
        oldpassword: oldPasswordChange.text,
        newPassword: passwordChangeNew.text,
        confirmNewPassword: passwordChangeNewConfirm.text,
        token: user.token!);

    result.when(
      success: (result) {
        utilsServices.showToast(message: "Senha alterada com sucesso");
        oldPasswordChange.clear();
        passwordChangeNew.clear();
        passwordChangeNewConfirm.clear();
        isLoading = false;
      },
      error: (message) {
        print(message);
        utilsServices.showToast(message: message, isError: true);
        isLoading = false;
      },
    );
  }

  Future<void> logout(BuildContext context) async {
    user = UserModel();

    await utilsServices.removeLocalData(key: StorageKeys.token);

    BrowseAteLogin(context: context);
  }

  Future<void> deleteAcount(
      {required BuildContext context,
      required GlobalKey<FormState> formKey}) async {
    isLoading = true;

    if (!formKey.currentState!.validate()) {
      isLoading = false;
      return;
    }

    Navigator.of(context).pop();

    DeleteAcountResult result = await repository.deleteAcount(
        password: passwordDeletAcount.text, token: user.token!);

    result.when(
      success: (result) async {
        utilsServices.showToast(message: result);
        passwordDeletAcount.clear();
        isLoading = false;
        await utilsServices.removeLocalData(key: StorageKeys.token);
        Navigator.pushReplacementNamed(deletContext, AppRoutes.login);
      },
      error: (message) {
        isLoading = false;
        utilsServices.showToast(message: message, isError: true);
      },
    );
  }

  void BrowseAteHome({required BuildContext context}) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
      (Route<dynamic> route) => false,
    );
  }

  void BrowseAteLogin({required BuildContext context}) {
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }
}
