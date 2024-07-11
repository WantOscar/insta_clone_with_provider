import 'package:flutter/material.dart';
import 'package:insta_clone/src/ui/app/app_view_model.dart';
import 'package:insta_clone/src/ui/widget/image_avatar.dart';
import 'package:insta_clone/src/ui/widget/image_data.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<AppViewModel>(context);

    return PopScope(
      canPop: _viewModel.canPop,
      onPopInvoked: _viewModel.back,
      child: Scaffold(
        body: _body(),
        bottomNavigationBar: _bottomNav(),
      ),
    );
  }

  Widget _body() => Consumer<AppViewModel>(
        builder: (context, provider, child) {
          return IndexedStack(
            index: provider.pageIndex,
            children: [
              Container(color: Colors.red),
              Container(color: Colors.blue),
              Container(color: Colors.yellow),
              Container(color: Colors.green),
              Container(color: Colors.black),
            ],
          );
        },
      );

  Widget _bottomNav() => Consumer<AppViewModel>(
        builder: (context, provider, child) {
          return BottomNavigationBar(
            currentIndex: provider.pageIndex,
            onTap: provider.changePage,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: ImageData(path: ImagePath.homeOff),
                  activeIcon: ImageData(path: ImagePath.homeOn),
                  label: ""),
              BottomNavigationBarItem(
                  icon: ImageData(path: ImagePath.searchOff),
                  activeIcon: ImageData(path: ImagePath.searchOn),
                  label: ""),
              BottomNavigationBarItem(
                  icon: ImageData(path: ImagePath.upload), label: ""),
              BottomNavigationBarItem(
                  icon: ImageData(path: ImagePath.reelsOff),
                  activeIcon: ImageData(path: ImagePath.reelsOn),
                  label: ""),
              const BottomNavigationBarItem(
                  icon: ImageAvatar(
                    path:
                        "https://cdnweb01.wikitree.co.kr/webdata/editor/202405/08/img_20240508134045_5a98bd30.webp",
                    size: 28,
                    type: ImageAvatarType.OFF,
                  ),
                  activeIcon: ImageAvatar(
                    path:
                        "https://cdnweb01.wikitree.co.kr/webdata/editor/202405/08/img_20240508134045_5a98bd30.webp",
                    size: 28,
                    type: ImageAvatarType.ON,
                  ),
                  label: ""),
            ],
          );
        },
      );
}
