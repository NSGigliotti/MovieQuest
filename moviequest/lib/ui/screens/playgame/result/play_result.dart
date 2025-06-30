import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moviequest/models/quest_model.dart';

part 'play_result.freezed.dart';

@freezed
class PlayResult with _$PlayResult {
  factory PlayResult.success(List<QuestModel> quests) = Success;

  factory PlayResult.error(String error) = Error;
}
