import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/providers/bill_detail_provider.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class CertPhotoPage extends StatelessWidget {
  const CertPhotoPage({super.key});

  ImageProvider? imageProvider(BuildContext context) {
    final photo = context.read<BillDetailModel>().certPhoto;
    if (photo == null) return null;
    return MemoryImage(photo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PhotoView(
            backgroundDecoration: BoxDecoration(color: NowColors.c0xFF000000),
            imageProvider: imageProvider(context),
          ),
          Positioned(
            top: 56.h,
            right: 24.w,
            child: GestureDetector(
              onTap: () => context.pop(),
              child: Image.asset(Drawable.iconClose, width: 36.w, height: 36.h),
            ),
          ),
        ],
      ),
    );
  }
}
