import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moviequest/models/answers_model.dart';

part 'answers_result.freezed.dart';

@freezed
class AnswersResult with _$AnswersResult {
  factory AnswersResult.success(AnswersModel result) = Success;

  factory AnswersResult.error(String error) = Error;
}
