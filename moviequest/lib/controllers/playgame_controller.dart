import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:moviequest/controllers/login_controller.dart';
import 'package:moviequest/models/quest_model.dart';
import 'package:moviequest/models/score_model.dart';
import 'package:moviequest/routes/app_routes.dart';
import 'package:moviequest/services/utils_services.dart';
import 'package:moviequest/ui/screens/playgame/result/answers_result.dart';
import 'package:moviequest/ui/screens/playgame/result/play_result.dart';
import 'package:moviequest/ui/screens/score/repository/score_repository.dart';
import 'package:moviequest/ui/screens/score/result/score_result.dart';

import '../ui/screens/playgame/repository/playgame_reposiotry.dart';

part 'playgame_controller.g.dart';

class PlayGameController = _PlayGameController with _$PlayGameController;

abstract class _PlayGameController with Store {
  PlatGameRepository repository = PlatGameRepository();

  ScoreRepository repositoryScore = ScoreRepository();

  UtilsServices utilsServices = UtilsServices();

  final LoginController _loginController;

  _PlayGameController(this._loginController);
  @computed
  String get token => _loginController.user.token ?? "";

  @observable
  bool isPlayGame = true;

  @observable
  bool loadingGame = false;

  @observable
  bool loadingScore = false;

  @observable
  List<QuestModel> quests = [];

  List<QuestModel> answers = [];

  @observable
  List<ScoreModel> score = [];

  @observable
  int index = 0;

  @observable
  int points = 0;

  @observable
  int correctQuestions = 0;

  Timer? _timer;

  int _second = 0;

  int _minute = 0;

  int _hours = 0;

  @observable
  String time = "";

  @observable
  int teste = 0;

  //*___________________________________________________________________________

  @action
  void switchLoadingGame() {
    loadingGame = !loadingGame;
  }

  @action
  Future<void> startGame() async {
    switchLoadingGame();

    if (quests.isEmpty) {
      PlayResult result = await repository.getQuest();

      result.when(
        success: (quest) {
          quests = quest;
        },
        error: (error) =>
            (utilsServices.showToast(message: error, isError: true)),
      );
    }

    switchLoadingGame();

    startTimer();
  }

  @action
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      _second++;

      if (_second == 60) {
        _second = 0;
        _minute = _minute + 01;
      }

      if (_minute == 60 && _second == 00) {
        _second = 0;
        _minute = 0;
        _hours++;
      }

      time =
          "${_hours.toString().padLeft(2, '0')}:${_minute.toString().padLeft(2, '0')}:${_second.toString().padLeft(2, '0')}";
    });
  }

  @action
  void stopTimer() {
    _timer?.cancel();
  }

  @action
  void navigationPlayer(BuildContext context) {
    Navigator.popAndPushNamed(context, AppRoutes.game);
    startGame();
  }

  @action
  Future<void> actionPlay(String movie, BuildContext context) async {
    if (index < quests.length - 1) {
      QuestModel answer = QuestModel(id: quests[index].id, response: movie);
      answers.add(answer);
      index++;
    } else {
      switchLoadingGame();
      QuestModel answer = QuestModel(id: quests[index].id, response: movie);
      answers.add(answer);
      stopTimer();

      AnswersResult result = await repository.sendAnswers(time, answers, token);

      result.when(
        success: (result) => {
          points = result.points,
          correctQuestions = result.correctQuestions,
          isPlayGame = false
        },
        error: (error) =>
            (utilsServices.showToast(message: error, isError: true)),
      );
    }
  }

  @action
  void backToStart(BuildContext context) {
    Navigator.popAndPushNamed(context, AppRoutes.home);
    points = 0;
    correctQuestions = 0;
    isPlayGame = true;
  }

  @action
  Future<void> getScore() async {
    loadingScore = true;
    ScoreResult result = await repositoryScore.getScore();

    result.when(
      success: (result) => {score = result, loadingScore = false},
      error: (error) =>
          (utilsServices.showToast(message: error, isError: true)),
    );
  }
}
