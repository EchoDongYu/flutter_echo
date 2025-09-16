import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewPage extends StatelessWidget {
  const PhotoViewPage({super.key, this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PhotoView(
            backgroundDecoration: BoxDecoration(
              color: NowColors.c0x00000000,
            ),
            imageProvider: AssetImage(url ?? ""),
          ),
          Positioned(
            top: 56.h,
            right: 24.w,
            child: GestureDetector(
              onTap: (){
                context.pop(true);
              },
              child: Image.asset(Drawable.iconClose, width: 36.w, height: 36.h),
            ),
          ),
        ],
      ),
    );

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
