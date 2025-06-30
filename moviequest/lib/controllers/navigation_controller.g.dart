// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavigationController on _NavigationController, Store {
  late final _$currentPageAtom =
      Atom(name: '_NavigationController.currentPage', context: context);

  @override
  String get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(String value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: '_NavigationController.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$screenListAtom =
      Atom(name: '_NavigationController.screenList', context: context);

  @override
  List<Widget> get screenList {
    _$screenListAtom.reportRead();
    return super.screenList;
  }

  @override
  set screenList(List<Widget> value) {
    _$screenListAtom.reportWrite(value, super.screenList, () {
      super.screenList = value;
    });
  }

  late final _$_NavigationControllerActionController =
      ActionController(name: '_NavigationController', context: context);

  @override
  void goToPage(String page) {
    final _$actionInfo = _$_NavigationControllerActionController.startAction(
        name: '_NavigationController.goToPage');
    try {
      return super.goToPage(page);
    } finally {
      _$_NavigationControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onItemTapped(int index) {
    final _$actionInfo = _$_NavigationControllerActionController.startAction(
        name: '_NavigationController.onItemTapped');
    try {
      return super.onItemTapped(index);
    } finally {
      _$_NavigationControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
selectedIndex: ${selectedIndex},
screenList: ${screenList}
    ''';
  }
}
