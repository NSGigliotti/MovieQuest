import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_result.freezed.dart';

@freezed
class ChangePasswordResult with _$ChangePasswordResult {
  factory ChangePasswordResult.success(String result) = Success;

  factory ChangePasswordResult.error(String message) = Error;
}
