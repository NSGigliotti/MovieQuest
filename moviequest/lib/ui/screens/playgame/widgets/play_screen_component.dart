import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviequest/controllers/playgame_controller.dart';
import 'package:moviequest/ui/core/theme/theme.dart';
import 'package:moviequest/ui/screens/playgame/widgets/box_buttons_component.dart';
import 'package:moviequest/ui/screens/playgame/widgets/image_display_component.dart';
import 'package:moviequest/ui/screens/playgame/widgets/result_screen_component.dart';
import 'package:provider/provider.dart';

class PlayScreenComponent extends StatefulWidget {
  PlayScreenComponent({Key? key}) : super(key: key);

  @override
  State<PlayScreenComponent> createState() => _PlayScreenComponentState();
}

class _PlayScreenComponentState extends State<PlayScreenComponent> {
  @override
  Widget build(BuildContext context) {
    final gameController = Provider.of<PlayGameController>(context);
    var size = MediaQuery.of(context).size;

    AppTheme appTheme = AppTheme();

    @override
    void initState() {
      super.initState();
      gameController.startGame();
    }

    return Container(
      decoration: appTheme.homeScreen,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Game"),
        ),
        body: Observer(
            builder: (_) => gameController.isPlayGame
                ? gameController.loadingGame
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        color: Colors.transparent,
                        width: size.width,
                        height: size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageDisplayComponent(
                              UrlImage: gameController
                                  .quests[gameController.index].imageURL!,
                            ),
                            SizedBox(height: 80),
                            BoxButtonsComponent(),
                          ],
                        ),
                      )
                : ResultScreenComponent()),
      ),
    );
  }
}
