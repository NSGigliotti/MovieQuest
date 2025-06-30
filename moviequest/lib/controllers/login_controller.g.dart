// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginController, Store {
  late final _$isLoginAtom =
      Atom(name: '_LoginController.isLogin', context: context);

  @override
  bool get isLogin {
    _$isLoginAtom.reportRead();
    return super.isLogin;
  }

  @override
  set isLogin(bool value) {
    _$isLoginAtom.reportWrite(value, super.isLogin, () {
      super.isLogin = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_LoginController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$stayConnectedAtom =
      Atom(name: '_LoginController.stayConnected', context: context);

  @override
  bool get stayConnected {
    _$stayConnectedAtom.reportRead();
    return super.stayConnected;
  }

  @override
  set stayConnected(bool value) {
    _$stayConnectedAtom.reportWrite(value, super.stayConnected, () {
      super.stayConnected = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_LoginController.email', context: context);

  @override
  TextEditingController get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(TextEditingController value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginController.password', context: context);

  @override
  TextEditingController get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(TextEditingController value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$emailRegisterAtom =
      Atom(name: '_LoginController.emailRegister', context: context);

  @override
  TextEditingController get emailRegister {
    _$emailRegisterAtom.reportRead();
    return super.emailRegister;
  }

  @override
  set emailRegister(TextEditingController value) {
    _$emailRegisterAtom.reportWrite(value, super.emailRegister, () {
      super.emailRegister = value;
    });
  }

  late final _$passwordRegisterAtom =
      Atom(name: '_LoginController.passwordRegister', context: context);

  @override
  TextEditingController get passwordRegister {
    _$passwordRegisterAtom.reportRead();
    return super.passwordRegister;
  }

  @override
  set passwordRegister(TextEditingController value) {
    _$passwordRegisterAtom.reportWrite(value, super.passwordRegister, () {
      super.passwordRegister = value;
    });
  }

  late final _$nameRegisterAtom =
      Atom(name: '_LoginController.nameRegister', context: context);

  @override
  TextEditingController get nameRegister {
    _$nameRegisterAtom.reportRead();
    return super.nameRegister;
  }

  @override
  set nameRegister(TextEditingController value) {
    _$nameRegisterAtom.reportWrite(value, super.nameRegister, () {
      super.nameRegister = value;
    });
  }

  late final _$passwordConfirmRegisterAtom =
      Atom(name: '_LoginController.passwordConfirmRegister', context: context);

  @override
  TextEditingController get passwordConfirmRegister {
    _$passwordConfirmRegisterAtom.reportRead();
    return super.passwordConfirmRegister;
  }

  @override
  set passwordConfirmRegister(TextEditingController value) {
    _$passwordConfirmRegisterAtom
        .reportWrite(value, super.passwordConfirmRegister, () {
      super.passwordConfirmRegister = value;
    });
  }

  late final _$oldPasswordChangeAtom =
      Atom(name: '_LoginController.oldPasswordChange', context: context);

  @override
  TextEditingController get oldPasswordChange {
    _$oldPasswordChangeAtom.reportRead();
    return super.oldPasswordChange;
  }

  @override
  set oldPasswordChange(TextEditingController value) {
    _$oldPasswordChangeAtom.reportWrite(value, super.oldPasswordChange, () {
      super.oldPasswordChange = value;
    });
  }

  late final _$passwordChangeNewAtom =
      Atom(name: '_LoginController.passwordChangeNew', context: context);

  @override
  TextEditingController get passwordChangeNew {
    _$passwordChangeNewAtom.reportRead();
    return super.passwordChangeNew;
  }

  @override
  set passwordChangeNew(TextEditingController value) {
    _$passwordChangeNewAtom.reportWrite(value, super.passwordChangeNew, () {
      super.passwordChangeNew = value;
    });
  }

  late final _$passwordChangeNewConfirmAtom =
      Atom(name: '_LoginController.passwordChangeNewConfirm', context: context);

  @override
  TextEditingController get passwordChangeNewConfirm {
    _$passwordChangeNewConfirmAtom.reportRead();
    return super.passwordChangeNewConfirm;
  }

  @override
  set passwordChangeNewConfirm(TextEditingController value) {
    _$passwordChangeNewConfirmAtom
        .reportWrite(value, super.passwordChangeNewConfirm, () {
      super.passwordChangeNewConfirm = value;
    });
  }

  late final _$passwordDeletAcountAtom =
      Atom(name: '_LoginController.passwordDeletAcount', context: context);

  @override
  TextEditingController get passwordDeletAcount {
    _$passwordDeletAcountAtom.reportRead();
    return super.passwordDeletAcount;
  }

  @override
  set passwordDeletAcount(TextEditingController value) {
    _$passwordDeletAcountAtom.reportWrite(value, super.passwordDeletAcount, () {
      super.passwordDeletAcount = value;
    });
  }

  late final _$deletContextAtom =
      Atom(name: '_LoginController.deletContext', context: context);

  @override
  BuildContext get deletContext {
    _$deletContextAtom.reportRead();
    return super.deletContext;
  }

  bool _deletContextIsInitialized = false;

  @override
  set deletContext(BuildContext value) {
    _$deletContextAtom.reportWrite(
        value, _deletContextIsInitialized ? super.deletContext : null, () {
      super.deletContext = value;
      _deletContextIsInitialized = true;
    });
  }

  late final _$userAtom = Atom(name: '_LoginController.user', context: context);

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  bool _userIsInitialized = false;

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, _userIsInitialized ? super.user : null, () {
      super.user = value;
      _userIsInitialized = true;
    });
  }

  late final _$validateTokenAsyncAction =
      AsyncAction('_LoginController.validateToken', context: context);

  @override
  Future<void> validateToken(BuildContext context) {
    return _$validateTokenAsyncAction.run(() => super.validateToken(context));
  }

  late final _$loginAsyncAction =
      AsyncAction('_LoginController.login', context: context);

  @override
  Future<void> login(
      {required BuildContext context, required GlobalKey<FormState> formKey}) {
    return _$loginAsyncAction
        .run(() => super.login(context: context, formKey: formKey));
  }

  late final _$_LoginControllerActionController =
      ActionController(name: '_LoginController', context: context);

  @override
  void switchLogin() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.switchLogin');
    try {
      return super.switchLogin();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeStayConnected() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.changeStayConnected');
    try {
      return super.changeStayConnected();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLogin: ${isLogin},
isLoading: ${isLoading},
stayConnected: ${stayConnected},
email: ${email},
password: ${password},
emailRegister: ${emailRegister},
passwordRegister: ${passwordRegister},
nameRegister: ${nameRegister},
passwordConfirmRegister: ${passwordConfirmRegister},
oldPasswordChange: ${oldPasswordChange},
passwordChangeNew: ${passwordChangeNew},
passwordChangeNewConfirm: ${passwordChangeNewConfirm},
passwordDeletAcount: ${passwordDeletAcount},
deletContext: ${deletContext},
user: ${user}
    ''';
  }
}
