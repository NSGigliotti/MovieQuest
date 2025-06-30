import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviequest/controllers/playgame_controller.dart';
import 'package:moviequest/ui/screens/playgame/widgets/button_quest_component.dart';
import 'package:provider/provider.dart';

class BoxButtonsComponent extends StatelessWidget {
  BoxButtonsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final gameController = Provider.of<PlayGameController>(context);

    return Observer(
      builder: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              ButtonQuestComponent(
                movie: gameController.quests[gameController.index].answers![0],
                actionPlay: () => gameController.actionPlay(
                    gameController.quests[gameController.index].answers![0],
                    context),
              ),
              Expanded(child: Container()),
              ButtonQuestComponent(
                movie: gameController.quests[gameController.index].answers![1],
                actionPlay: () => gameController.actionPlay(
                    gameController.quests[gameController.index].answers![1],
                    context),
              ),
              Expanded(child: Container()),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              ButtonQuestComponent(
                movie: gameController.quests[gameController.index].answers![2],
                actionPlay: () => gameController.actionPlay(
                    gameController.quests[gameController.index].answers![2],
                    context),
              ),
              Expanded(child: Container()),
              ButtonQuestComponent(
                movie: gameController.quests[gameController.index].answers![3],
                actionPlay: () => gameController.actionPlay(
                    gameController.quests[gameController.index].answers![3],
                    context),
              ),
              Expanded(child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}
