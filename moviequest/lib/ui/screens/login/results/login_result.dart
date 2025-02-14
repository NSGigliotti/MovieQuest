import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moviequest/models/user_model.dart';

part 'login_result.freezed.dart';

@freezed
class AuthResult with _$AuthResult {
  factory AuthResult.success(UserModel user) = Success;

  factory AuthResult.error(String message) = Error;
}
