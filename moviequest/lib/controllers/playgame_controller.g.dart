// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playgame_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayGameController on _PlayGameController, Store {
  Computed<String>? _$tokenComputed;

  @override
  String get token => (_$tokenComputed ??= Computed<String>(() => super.token,
          name: '_PlayGameController.token'))
      .value;

  late final _$isPlayGameAtom =
      Atom(name: '_PlayGameController.isPlayGame', context: context);

  @override
  bool get isPlayGame {
    _$isPlayGameAtom.reportRead();
    return super.isPlayGame;
  }

  @override
  set isPlayGame(bool value) {
    _$isPlayGameAtom.reportWrite(value, super.isPlayGame, () {
      super.isPlayGame = value;
    });
  }

  late final _$loadingGameAtom =
      Atom(name: '_PlayGameController.loadingGame', context: context);

  @override
  bool get loadingGame {
    _$loadingGameAtom.reportRead();
    return super.loadingGame;
  }

  @override
  set loadingGame(bool value) {
    _$loadingGameAtom.reportWrite(value, super.loadingGame, () {
      super.loadingGame = value;
    });
  }

  late final _$loadingScoreAtom =
      Atom(name: '_PlayGameController.loadingScore', context: context);

  @override
  bool get loadingScore {
    _$loadingScoreAtom.reportRead();
    return super.loadingScore;
  }

  @override
  set loadingScore(bool value) {
    _$loadingScoreAtom.reportWrite(value, super.loadingScore, () {
      super.loadingScore = value;
    });
  }

  late final _$questsAtom =
      Atom(name: '_PlayGameController.quests', context: context);

  @override
  List<QuestModel> get quests {
    _$questsAtom.reportRead();
    return super.quests;
  }

  @override
  set quests(List<QuestModel> value) {
    _$questsAtom.reportWrite(value, super.quests, () {
      super.quests = value;
    });
  }

  late final _$scoreAtom =
      Atom(name: '_PlayGameController.score', context: context);

  @override
  List<ScoreModel> get score {
    _$scoreAtom.reportRead();
    return super.score;
  }

  @override
  set score(List<ScoreModel> value) {
    _$scoreAtom.reportWrite(value, super.score, () {
      super.score = value;
    });
  }

  late final _$indexAtom =
      Atom(name: '_PlayGameController.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$pointsAtom =
      Atom(name: '_PlayGameController.points', context: context);

  @override
  int get points {
    _$pointsAtom.reportRead();
    return super.points;
  }

  @override
  set points(int value) {
    _$pointsAtom.reportWrite(value, super.points, () {
      super.points = value;
    });
  }

  late final _$correctQuestionsAtom =
      Atom(name: '_PlayGameController.correctQuestions', context: context);

  @override
  int get correctQuestions {
    _$correctQuestionsAtom.reportRead();
    return super.correctQuestions;
  }

  @override
  set correctQuestions(int value) {
    _$correctQuestionsAtom.reportWrite(value, super.correctQuestions, () {
      super.correctQuestions = value;
    });
  }

  late final _$timeAtom =
      Atom(name: '_PlayGameController.time', context: context);

  @override
  String get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(String value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  late final _$testeAtom =
      Atom(name: '_PlayGameController.teste', context: context);

  @override
  int get teste {
    _$testeAtom.reportRead();
    return super.teste;
  }

  @override
  set teste(int value) {
    _$testeAtom.reportWrite(value, super.teste, () {
      super.teste = value;
    });
  }

  late final _$startGameAsyncAction =
      AsyncAction('_PlayGameController.startGame', context: context);

  @override
  Future<void> startGame() {
    return _$startGameAsyncAction.run(() => super.startGame());
  }

  late final _$actionPlayAsyncAction =
      AsyncAction('_PlayGameController.actionPlay', context: context);

  @override
  Future<void> actionPlay(String movie, BuildContext context) {
    return _$actionPlayAsyncAction.run(() => super.actionPlay(movie, context));
  }

  late final _$getScoreAsyncAction =
      AsyncAction('_PlayGameController.getScore', context: context);

  @override
  Future<void> getScore() {
    return _$getScoreAsyncAction.run(() => super.getScore());
  }

  late final _$_PlayGameControllerActionController =
      ActionController(name: '_PlayGameController', context: context);

  @override
  void switchLoadingGame() {
    final _$actionInfo = _$_PlayGameControllerActionController.startAction(
        name: '_PlayGameController.switchLoadingGame');
    try {
      return super.switchLoadingGame();
    } finally {
      _$_PlayGameControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startTimer() {
    final _$actionInfo = _$_PlayGameControllerActionController.startAction(
        name: '_PlayGameController.startTimer');
    try {
      return super.startTimer();
    } finally {
      _$_PlayGameControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopTimer() {
    final _$actionInfo = _$_PlayGameControllerActionController.startAction(
        name: '_PlayGameController.stopTimer');
    try {
      return super.stopTimer();
    } finally {
      _$_PlayGameControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigationPlayer(BuildContext context) {
    final _$actionInfo = _$_PlayGameControllerActionController.startAction(
        name: '_PlayGameController.navigationPlayer');
    try {
      return super.navigationPlayer(context);
    } finally {
      _$_PlayGameControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void backToStart(BuildContext context) {
    final _$actionInfo = _$_PlayGameControllerActionController.startAction(
        name: '_PlayGameController.backToStart');
    try {
      return super.backToStart(context);
    } finally {
      _$_PlayGameControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPlayGame: ${isPlayGame},
loadingGame: ${loadingGame},
loadingScore: ${loadingScore},
quests: ${quests},
score: ${score},
index: ${index},
points: ${points},
correctQuestions: ${correctQuestions},
time: ${time},
teste: ${teste},
token: ${token}
    ''';
  }
}
