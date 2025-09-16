import 'package:flutter/material.dart';
import 'package:flutter_echo/ui/widgets/common_photo_view.dart';

class PhotoViewPage extends StatelessWidget {
  const PhotoViewPage({super.key, this.url });

  final String? url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CommonPhotoView(photoViewUrl: "$url"));

    // return Container(
    //     child: PhotoViewGallery.builder(
    //       scrollPhysics: const BouncingScrollPhysics(),
    //       builder: (BuildContext context, int index) {
    //         return PhotoViewGalleryPageOptions(
    //           imageProvider: AssetImage(widget.galleryItems[index].image),
    //           initialScale: PhotoViewComputedScale.contained * 0.8,
    //           heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id),
    //         );
    //       },
    //       itemCount: galleryItems.length,
    //       loadingBuilder: (context, event) => Center(
    //         child: Container(
    //           width: 20.0,
    //           height: 20.0,
    //           child: CircularProgressIndicator(
    //             value: event == null
    //                 ? 0
    //                 : event.cumulativeBytesLoaded / event.expectedTotalBytes,
    //           ),
    //         ),
    //       ),
    //       backgroundDecoration: widget.backgroundDecoration,
    //       pageController: widget.pageController,
    //       onPageChanged: onPageChanged,
    //     )
    // );
  }
}
