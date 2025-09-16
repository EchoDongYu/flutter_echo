
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CommonPhotoView extends StatelessWidget {
  const CommonPhotoView({super.key, required this.photoViewUrl});

  final String photoViewUrl;

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: AssetImage(photoViewUrl),
    );
  }
}
