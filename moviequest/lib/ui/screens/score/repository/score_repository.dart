import 'dart:convert';

import 'package:moviequest/constansts/endpoints.dart';
import 'package:moviequest/models/score_model.dart';
import 'package:moviequest/services/http_manager.dart';
import 'package:moviequest/ui/screens/score/result/score_result.dart';

class ScoreRepository {
  final HttpManager _httpManager = HttpManager();

  Future<ScoreResult> getScore() async {
    List<ScoreModel> score = [];

    final result = await _httpManager.restRequest(
      url: Endpoints.getlist,
      method: HttpMetod.get,
    );

    if (result["results"] != null) {
      List<dynamic> jsonList = result["results"];
      score = List<Map<String, dynamic>>.from(jsonList)
          .map(ScoreModel.fromMap)
          .toList();

      return ScoreResult.success(score);
    } else {
      return ScoreResult.error("Ocorreu um erro");
    }
  }
}
