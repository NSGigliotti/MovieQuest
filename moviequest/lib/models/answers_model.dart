import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AnswersModel {
  int points;
  int correctQuestions;

  AnswersModel({
    required this.points,
    required this.correctQuestions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'points': points,
      'correctQuestions': correctQuestions,
    };
  }

  factory AnswersModel.fromMap(Map<String, dynamic> map) {
    return AnswersModel(
      points: map['points'] as int,
      correctQuestions: map['correctQuestions'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswersModel.fromJson(String source) =>
      AnswersModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
