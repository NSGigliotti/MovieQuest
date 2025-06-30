import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:moviequest/ui/screens/playgame/playgame_screen.dart';
import 'package:moviequest/ui/screens/profile/profile_screen.dart';
import 'package:moviequest/ui/screens/score/score_screen.dart';

part 'navigation_controller.g.dart';

class NavigationController = _NavigationController with _$NavigationController;

abstract class _NavigationController with Store {
  @observable
  String currentPage = 'home';

  @action
  void goToPage(String page) {
    currentPage = page;
  }

  //*------------------------------------------------------------

  @observable
  int selectedIndex = 0;

  @observable
  List<Widget> screenList = <Widget>[
    PlaygameScreen(),
    ScoreScreen(),
    ProfileScreen(),
  ];

  @action
  void onItemTapped(int index) {
    selectedIndex = index;
  }
}
