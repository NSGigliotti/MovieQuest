import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moviequest/models/score_model.dart';

part 'score_result.freezed.dart';

@freezed
class ScoreResult with _$ScoreResult {
  factory ScoreResult.success(List<ScoreModel> quests) = Success;

  factory ScoreResult.error(String error) = Error;
}
