import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:insta_clone/src/ui/upload/upload_view.dart';
import 'package:insta_clone/src/utils/global_variable.dart';

enum Page { HOME, SEARCH, UPLOAD, REELS, MYPAGE }

class AppViewModel extends ChangeNotifier {
  final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();

  int _pageIndex = 0;
  bool _canPop = false;
  final List<int> _history = [0];

  int get pageIndex => _pageIndex;
  bool get canPop => _canPop;
  GlobalKey<NavigatorState> get key => _key;

  void changePage(int value) {
    final page = Page.values[value];

    switch (page) {
      case Page.HOME:
      case Page.SEARCH:
      case Page.REELS:
      case Page.MYPAGE:
        changeIndex(page.index);
      case Page.UPLOAD:
        moveToUpload();
    }
  }

  void changeIndex(int value) {
    if (_history.last != value) {
      _history.add(value);
    }
    print(_history);
    _pageIndex = value;
    notifyListeners();
  }

  void back(bool didPop) {
    if (_history.length > 1) {
      _history.removeLast();
      _pageIndex = _history.last;
      notifyListeners();
    } else {
      _canPop = true;
      notifyListeners();
    }
  }
}

void moveToUpload() {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    final context = GlobalVariable.navigatorState.currentContext!;
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const UploadView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(-1.0, 0.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  });
}
