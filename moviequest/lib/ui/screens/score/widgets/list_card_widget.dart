import 'package:flutter/material.dart';
import 'package:moviequest/models/score_model.dart';
import 'package:moviequest/ui/core/theme/theme.dart';

class ListCardWidget extends StatelessWidget {
  ListCardWidget({super.key, required this.scoreUser, required this.position});

  ScoreModel scoreUser;

  int position;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = AppTheme();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5 ,vertical: 10),
      child: Material(
        color: Colors.transparent,
        shadowColor: position & 1 == 0 ? Colors.cyanAccent : Colors.blueAccent,
        borderRadius: BorderRadiusDirectional.circular(5),
        elevation: 2,
        child: SizedBox(
          height: 30,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 20,
                child:
                    Text(position.toString(), style: appTheme.scoreTextStyle),
              ),
              Text(scoreUser.userName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: appTheme.scoreTextStyle),
              Text(scoreUser.points.toString(), style: appTheme.scoreTextStyle),
              Text("${scoreUser.correctQuestions.toString()}/10",
                  style: appTheme.scoreTextStyle),
              Text(scoreUser.time, style: appTheme.scoreTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}
