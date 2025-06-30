import 'package:moviequest/constansts/endpoints.dart';
import 'package:moviequest/models/answers_model.dart';
import 'package:moviequest/models/quest_model.dart';
import 'package:moviequest/services/http_manager.dart';
import 'package:moviequest/ui/screens/playgame/result/answers_result.dart';
import 'package:moviequest/ui/screens/playgame/result/play_result.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PlatGameRepository {
  final HttpManager _httpManager = HttpManager();

  Future<PlayResult> getQuest() async {
    List<QuestModel> quests = [];

    // List<QuestModel> teste = [];

    final result = await _httpManager.restRequest(
      url: Endpoints.getQuestions,
      method: HttpMetod.get,
    );

    if (result["results"] != null) {
      List<dynamic> jsonList = json.decode(result["results"]);
      quests = List<Map<String, dynamic>>.from(jsonList)
          .map(QuestModel.fromMap)
          .toList();

      return PlayResult.success(quests);
    } else {
      return PlayResult.error("Ocorreu um erro");
    }
  }

  Future<AnswersResult> sendAnswers(
      String time, List<QuestModel> answers, String token) async {
    List<Map<String, String>> answersMap = [];

    for (var e in answers) {
      answersMap.add({"id": e.id!, "answers": e.response!});
    }

    final Map<String, dynamic> requestBody = {
      "time": time,
      "quests": answersMap
    };

    final result = await http.post(Uri.parse(Endpoints.correctquestions),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': token == '' ? '' : 'Bearer $token',
        },
        body: jsonEncode(requestBody));

    Map<dynamic, dynamic> data = jsonDecode(result.body);

    if (data["results"] != null) {
      AnswersModel answersModel = AnswersModel.fromMap(data["results"]);
      return AnswersResult.success(answersModel);
    } else {
      return AnswersResult.error("Ocorreu um erro");
    }
  }

  
}
