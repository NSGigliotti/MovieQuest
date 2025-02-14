// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavigationStore on _NavigationStore, Store {
  late final _$currentPageAtom =
      Atom(name: '_NavigationStore.currentPage', context: context);

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

  late final _$_NavigationStoreActionController =
      ActionController(name: '_NavigationStore', context: context);

  @override
  void goToPage(String page) {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.goToPage');
    try {
      return super.goToPage(page);
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage}
    ''';
  }
}
