// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScoreModel _$ScoreModelFromJson(Map<String, dynamic> json) => ScoreModel(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      points: (json['points'] as num).toInt(),
      correctQuestions: (json['correctQuestions'] as num).toInt(),
      time: json['time'] as String,
    );

Map<String, dynamic> _$ScoreModelToJson(ScoreModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'points': instance.points,
      'correctQuestions': instance.correctQuestions,
      'time': instance.time,
    };
