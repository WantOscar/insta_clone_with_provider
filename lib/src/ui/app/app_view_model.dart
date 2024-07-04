import 'package:flutter/material.dart';

enum Page { HOME, SEARCH, UPLOAD, REELS, MYPAGE }

class AppViewModel extends ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  void changePage(int value) {
    final page = Page.values[value];

    switch (page) {
      case Page.HOME:
      case Page.SEARCH:
      case Page.UPLOAD:
      case Page.REELS:
      case Page.MYPAGE:
        changeIndex(page.index);
    }
  }

  void changeIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }
}
