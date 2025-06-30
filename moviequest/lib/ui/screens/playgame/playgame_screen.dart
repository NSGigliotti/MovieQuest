import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviequest/controllers/playgame_controller.dart';
import 'package:moviequest/ui/screens/home/widgets/play_button_component.dart';
import 'package:provider/provider.dart';

class PlaygameScreen extends StatelessWidget {
  PlaygameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final gameController = Provider.of<PlayGameController>(context);

    return Observer(
      builder: (_) => Container(
        height: size.height,
        width: size.width,
        child: Center(
          child: PlayButtonComponent(
            onCLick: () => gameController.navigationPlayer(context),
          ),
        ),
      ),
    );
  }
}
