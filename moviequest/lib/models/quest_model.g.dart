// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestModel _$QuestModelFromJson(Map<String, dynamic> json) => QuestModel(
      id: json['id'] as String?,
      imageURL: json['imageURL'] as String?,
      answers:
          (json['answers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      response: json['response'] as String?,
      difficulty: json['difficulty'] as String?,
    );

Map<String, dynamic> _$QuestModelToJson(QuestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageURL': instance.imageURL,
      'answers': instance.answers,
      'response': instance.response,
      'difficulty': instance.difficulty,
    };
