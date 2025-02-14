// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserController on _UserController, Store {
  late final _$userAtom = Atom(name: '_UserController.user', context: context);

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

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
