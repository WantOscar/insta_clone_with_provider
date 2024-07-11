import 'package:flutter/material.dart';
import 'package:insta_clone/src/widget/image_avatar.dart';
import 'package:insta_clone/src/widget/image_data.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _story(),
            // _feeds(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() => AppBar(
        title: ImageData(path: ImagePath.logo, width: 300),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ImageData(path: ImagePath.active, width: 70),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ImageData(path: ImagePath.dm, width: 70),
          ),
        ],
      );

  Widget _story() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            20,
            (index) => const Padding(
              padding: EdgeInsets.all(8.0),
              child: ImageAvatar(
                path:
                    "https://cdnweb01.wikitree.co.kr/webdata/editor/202405/08/img_20240508134045_5a98bd30.webp",
                size: 70,
                type: ImageAvatarType.STORY,
              ),
            ),
          ),
        ),
      );
}
