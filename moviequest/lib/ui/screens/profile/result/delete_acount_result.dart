import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_acount_result.freezed.dart';

@freezed
class DeleteAcountResult with _$DeleteAcountResult {
  factory DeleteAcountResult.success(String user) = Success;

  factory DeleteAcountResult.error(String message) = Error;
}
