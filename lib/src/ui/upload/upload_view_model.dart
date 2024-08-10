import 'package:flutter/material.dart';
import 'package:insta_clone/src/model/album.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadViewModel extends ChangeNotifier {
  final List<Album> _albums = [];
  final int _albumIndex = 0;

  List<Album> get ablums => _albums;
  int get ablumIndex => _albumIndex;
  Album get currentAlbum => _albums[_albumIndex];

  UploadViewModel() {
    _checkPermission();
  }

  void _checkPermission() async {
    final ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth) {
      _getAlbums();
    } else {
      PhotoManager.openSetting();
    }
  }

  void _getAlbums() async {
    final paths = await PhotoManager.getAssetPathList();
    for (AssetPathEntity entity in paths) {
      final images = await entity.getAssetListRange(start: 0, end: 10000);
      if (images.isNotEmpty) {
        final album = Album(id: entity.id, name: entity.name, images: images);
        _albums.add(album);
      }
    }
    notifyListeners();
  }
}
