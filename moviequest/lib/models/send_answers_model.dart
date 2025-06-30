// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:moviequest/models/quest_model.dart';

class SendAnswersModel {
  String time;
  List<QuestModel> answers;

  SendAnswersModel({
    required this.time,
    required this.answers,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory SendAnswersModel.fromMap(Map<String, dynamic> map) {
  return SendAnswersModel(
    time: map['time'] as String,
    answers: List<QuestModel>.from((map['answers'] as List<dynamic>).map<QuestModel>((x) => QuestModel.fromMap(x as Map<String,dynamic>),),),
  );
}

  String toJson() => json.encode(toMap());

  factory SendAnswersModel.fromJson(String source) => SendAnswersModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
