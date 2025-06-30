// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'score_model.g.dart';

@JsonSerializable()
class ScoreModel {
  String userId;
  String userName;
  int points;
  int correctQuestions;
  String time;

  ScoreModel({
    required this.userId,
    required this.userName,
    required this.points,
    required this.correctQuestions,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'userName': userName,
      'points': points,
      'correctQuestions': correctQuestions,
      'time': time,
    };
  }

  factory ScoreModel.fromMap(Map<String, dynamic> map) {
    return ScoreModel(
      userId: map['userId'] as String,
      userName: map['userName'] as String,
      points: map['points'] as int,
      correctQuestions: map['correctQuestions'] as int,
      time: map['time'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScoreModel.fromJson(String source) =>
      ScoreModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
