import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviequest/controllers/playgame_controller.dart';
import 'package:moviequest/ui/core/theme/theme.dart';
import 'package:moviequest/ui/widgets/button.dart';
import 'package:provider/provider.dart';

class ResultScreenComponent extends StatelessWidget {
  const ResultScreenComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final gameController = Provider.of<PlayGameController>(context);

    AppTheme appTheme = AppTheme();

    return Observer(
      builder: (_) => SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Center(
                child: Image.asset('lib/ui/core/assets/picmix.com_352162.gif')),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(gameController.points.toString(),
                      style: appTheme.pointStyle),
                ),
                Center(
                  child: Text(
                      "Respostas corretas ${gameController.correctQuestions}/10",
                      style: appTheme.subtitlePointStyle),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(flex: 3, child: Container()),
                SizedBox(
                  width: size.width * 0.8,
                  height: size.height * 0.08,
                  child: Button(
                    text: "Voltar",
                    onClick: () => gameController.backToStart(context),
                  ),
                ),
                Expanded(flex: 1, child: Container()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
