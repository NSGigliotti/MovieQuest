import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviequest/controllers/playgame_controller.dart';
import 'package:moviequest/ui/core/theme/theme.dart';
import 'package:moviequest/ui/screens/score/widgets/list_card_widget.dart';
import 'package:provider/provider.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  late PlayGameController _gameController;

  @override
  void initState() {
    super.initState();
    _gameController = Provider.of<PlayGameController>(context, listen: false);
    _gameController.getScore();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

      AppTheme appTheme = AppTheme();

    return Observer(
      builder: (_) => _gameController.loadingScore
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("  ",style: appTheme.scoreTextStyle, ),
                        Text("Nome",style: appTheme.scoreTextStyle, ),
                        Text("Pontos",style: appTheme.scoreTextStyle, ),
                        Text("Acetos",style: appTheme.scoreTextStyle, ),
                        Text("tempo",style: appTheme.scoreTextStyle, ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: _gameController.getScore,
                      child: ListView.builder(
                        itemCount: _gameController.score.length,
                        itemBuilder: (context, index) {
                          return _gameController.score.length == 0
                              ? Text("Sem resultados ainda")
                              : ListCardWidget(
                                  scoreUser: _gameController.score[index],
                                  position: index + 1,
                                );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
