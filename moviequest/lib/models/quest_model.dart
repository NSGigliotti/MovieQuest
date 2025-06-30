// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'quest_model.g.dart';

@JsonSerializable()
class QuestModel {
  String? id;
  String? imageURL;
  List<String>? answers;
  String? response;
  String? difficulty;

  QuestModel({
    this.id,
    this.imageURL,
    this.answers,
    this.response,
    this.difficulty,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imageURL': imageURL,
      'answers': answers,
      'response': response,
      'difficulty': difficulty,
    };
  }

  factory QuestModel.fromMap(Map<String, dynamic> map) {
    return QuestModel(
      id: map['Id'] != null ? map['Id'] as String : null,
      imageURL: map['ImageURL'] != null ? map['ImageURL'] as String : null,
      answers: map['Answers'] != null
          ? List<String>.from((map['Answers'] as List<dynamic>))
          : null,
      difficulty:
          map['Difficulty'] != null ? map['Difficulty'] as String : null,
    );
  }

  factory QuestModel.fromJson(Map<String, dynamic> json) =>
      _$QuestModelFromJson(json);

  String toJson() => json.encode(toMap());

  Map<String, dynamic> tojason() => _$QuestModelToJson(this);

  // factory QuestModel.fromJson(String source) =>
  //     QuestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
