import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum ImageAvatarType { ON, OFF, STORY }

class ImageAvatar extends StatelessWidget {
  final String path;
  final double size;
  final ImageAvatarType type;

  const ImageAvatar(
      {super.key, required this.path, required this.size, required this.type});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ImageAvatarType.STORY:
        return _story();
      case ImageAvatarType.ON:
      case ImageAvatarType.OFF:
        return _bottomNavAvatar();
      default:
        return _story();
    }
  }

  Widget _story() => Container(
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xfffce80a),
              Color(0xfffc3a0a),
              Color(0xffc80afc),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Container(
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: _basic(),
        ),
      );

  Widget _bottomNavAvatar() => Container(
        padding: const EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          color: (type == ImageAvatarType.ON) ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Container(
          padding: const EdgeInsets.all(1.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: _basic(),
        ),
      );

  Widget _basic() => ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: SizedBox(
          width: size,
          height: size,
          child: CachedNetworkImage(
            imageUrl: path,
            fit: BoxFit.cover,
          ),
        ),
      );
}
