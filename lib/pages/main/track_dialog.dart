import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/page_consumer.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/providers/track_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// 数据上报倒计时弹窗
class TrackUploadDialog extends StatefulWidget {
  final int countdown;

  const TrackUploadDialog({super.key, required this.countdown});

  /// 显示数据上报说明弹窗
  static Future<bool?> show(BuildContext context, {required int countdown}) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: ChangeNotifierProvider(
          create: (_) => TrackModel(),
          builder: (_, _) => PageConsumer<TrackModel>(
            child: TrackUploadDialog(countdown: countdown),
          ),
        ),
      ),
    );
  }

  @override
  State<TrackUploadDialog> createState() => _TrackUploadDialogState();
}

class _TrackUploadDialogState extends State<TrackUploadDialog> {
  late int _countdown;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _countdown = widget.countdown;
    _startTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      uploadTrack(context);
    });
  }

  void uploadTrack(BuildContext context) async {
    TrackModel trackModel = Provider.of<TrackModel>(context, listen: false);
    final uploadOk = await trackModel.uploadTrack();
    if (context.mounted) context.pop(uploadOk);
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown <= 0) {
        timer.cancel();
        context.pop(false);
      } else {
        setState(() => _countdown--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Drawable.imageShildsequere,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 12.h),
                Text(
                  'Se estan cargando datos personales para evaluar su riesgo',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFF494C4F,
                    height: 24 / 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 24.h,
                  ),
                  decoration: BoxDecoration(
                    color: NowColors.c0xFFF3F3F5,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${_countdown}s',
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w500,
                          color: NowColors.c0xFF3288F1,
                          height: 42 / 32,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'Se estacalculando su credito de\nprestamo,espere pacientemente',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: NowColors.c0xFF494C4F,
                          height: 22 / 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 数据上报说明弹窗
class TrackIntroDialog extends StatelessWidget {
  final VoidCallback onAgree;
  final VoidCallback onDisagree;

  const TrackIntroDialog({
    super.key,
    required this.onAgree,
    required this.onDisagree,
  });

  /// 显示数据上报说明弹窗
  static Future<bool?> show(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      useSafeArea: true,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (_) => PopScope(
        canPop: false,
        child: TrackIntroDialog(
          onAgree: () => context.pop(true),
          onDisagree: () => context.pop(false),
        ),
      ),
    );
  }

  static const permissionItems = [
    Pair(
      'SMS',
      'Estimado estos son los nombres de refer encias encias disponibles para poder dlarle un ej emplo y facilitar cuando completas las infommaciones del prestamo que pago.Estimado estos son los nombres de refer encias disponibles para poder dlarle un ej emplo y facilitar cuando completas las infommaciones del prestamo que pago.',
    ),
    Pair(
      'Solo contacto de emergencia',
      'Estimado estos son los nombres de refer encias encias disponibles para poder dlarle un ej emplo y facilitar cuando completas las ',
    ),
    Pair(
      'Ubicaciones',
      'Estimado estos son los nombres de refer encias encias disponibles para poder dla',
    ),
    Pair(
      'Camara',
      'Estimado estos son los nombres de refer encias encias disponibles para poder dla',
    ),
    Pair(
      'Datos del dispositivo',
      'Estimado estos son los nombres de refer encias encias disponibles para poder dlaEstimado estos son los nombres de refer encias encias disponibles para poder dlaEstimado estos son los nombres de refer encias encias disponibles para poder dla',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.8;
    return BottomSheet(
      onClosing: onDisagree,
      enableDrag: false,
      backgroundColor: Colors.white,
      constraints: BoxConstraints(maxHeight: height),
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: onDisagree,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        width: 24.r,
                        height: 24.r,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: BoxBorder.all(
                            color: NowColors.c0xFF1C1F23,
                            width: 1.6.w,
                          ),
                        ),
                        child: const Icon(
                          Icons.close_rounded,
                          color: NowColors.c0xFF1C1F23,
                          size: 16,
                        ),
                      ),
                    ),
                    Text(
                      'Consulta de carga de datos',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFF1C1F23,
                        height: 24 / 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 24.r, height: 24.r),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 90.h),
                  itemCount: permissionItems.length,
                  separatorBuilder: (context, index) => SizedBox(height: 22.h),
                  itemBuilder: (context, index) {
                    return _buildPermissionItem(permissionItems[index]);
                  },
                ),
              ),
            ],
          ),
          WidgetHelper.buildBottomBlurButton(
            confirmText: 'Aceptar',
            cancelText: 'Rechazar',
            onConfirm: onAgree,
            onCancel: onDisagree,
          ),
        ],
      ),
    );
  }

  /// 构建权限项目
  Widget _buildPermissionItem(Pair item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            Container(
              width: 22.r,
              height: 22.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [NowColors.c0xFF3389F2, NowColors.c0x474CA6FD],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 2.h),
              child: Text(
                item.first,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF1C1F23,
                  height: 30 / 20,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            item.second,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: NowColors.c0xFF494C4F,
              height: 20 / 13,
            ),
          ),
        ),
      ],
    );
  }
}
