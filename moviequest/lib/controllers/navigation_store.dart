import 'package:mobx/mobx.dart';

part 'navigation_store.g.dart';

class NavigationStore = _NavigationStore with _$NavigationStore;

abstract class _NavigationStore with Store {
  @observable
  String currentPage = 'home';

  @action
  void goToPage(String page) {
    currentPage = page;
  }
}
