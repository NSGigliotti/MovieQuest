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

  late final _$formKeyLoginAtom =
      Atom(name: '_LoginController.formKeyLogin', context: context);

  @override
  GlobalKey<FormState> get formKeyLogin {
    _$formKeyLoginAtom.reportRead();
    return super.formKeyLogin;
  }

  @override
  set formKeyLogin(GlobalKey<FormState> value) {
    _$formKeyLoginAtom.reportWrite(value, super.formKeyLogin, () {
      super.formKeyLogin = value;
    });
  }

  late final _$formKeyCreatAcountAtom =
      Atom(name: '_LoginController.formKeyCreatAcount', context: context);

  @override
  GlobalKey<FormState> get formKeyCreatAcount {
    _$formKeyCreatAcountAtom.reportRead();
    return super.formKeyCreatAcount;
  }

  @override
  set formKeyCreatAcount(GlobalKey<FormState> value) {
    _$formKeyCreatAcountAtom.reportWrite(value, super.formKeyCreatAcount, () {
      super.formKeyCreatAcount = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_LoginController.login', context: context);

  @override
  Future<void> login({required BuildContext context}) {
    return _$loginAsyncAction.run(() => super.login(context: context));
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
  void switchLoadin() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.switchLoadin');
    try {
      return super.switchLoadin();
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
formKeyLogin: ${formKeyLogin},
formKeyCreatAcount: ${formKeyCreatAcount}
    ''';
  }
}
