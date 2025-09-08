import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/providers/about_us_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

/// 关于我们页面
class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  List<StepItem>? _stepItems;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final aboutModel = Provider.of<AboutUsModel>(context, listen: false);
      final dict = await aboutModel.getDictionary();
      setState(() {
        _stepItems = AboutUsModel.types
            .map((it) => dict?['$it'])
            .expand((it) => it ?? List<StepItem>.empty())
            .toList();
      });
    });
  }

  static final Map<String, String> _iconMap = {
    '17': Drawable.iconAboutPhone,
    '18': Drawable.iconAboutCopy,
    '21': Drawable.iconAboutPhone,
    '23': Drawable.iconAboutForward,
    '24': Drawable.iconAboutCopy,
  };

  static final Map<String, String> _labelMap = {
    '17': 'WhatsApp',
    '18': 'E-mail',
    '21': 'Teléfono',
    '23': 'Website',
    '24': 'Address',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          WidgetHelper.buildTopGradient(context: context, height: 55.h),
          SafeArea(
            child: Column(
              spacing: 32.h,
              children: [
                EchoTopBar(title: 'Sobre nosotros', showSupport: false),
                Image.asset(Drawable.iconLogo, width: 80.r, height: 80.r),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: NowStyles.cardShadows,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 12.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 32.h,
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: _stepItems?.length ?? 0,
                    separatorBuilder: (context, _) => SizedBox(height: 32.h),
                    itemBuilder: (context, index) {
                      return _buildAboutItem(_stepItems?[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutItem(StepItem? item) {
    final label = _labelMap[item?.type];
    final icon = _iconMap[item?.type];
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 4.h,
            children: [
              Text(
                label ?? '',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: NowColors.c0xFF494C4F,
                  height: 20 / 14,
                ),
              ),
              Text(
                item?.value ?? '',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF1C1F23,
                  height: 28 / 18,
                ),
              ),
            ],
          ),
        ),
        if (icon != null)
          InkWell(
            onTap: () {
              switch (item?.type) {
                case '17':
                  FlutterPlatform.launchWhatsApp(item?.value);
                case '21':
                  launchUrl(Uri.parse('tel:${item?.value}'));
                case '23':
                  launchUrl(Uri.parse('https:${item?.value}'));
                default:
                  Clipboard.setData(ClipboardData(text: item?.value ?? ''));
                  Fluttertoast.showToast(msg: 'copiar');
              }
            },
            child: Image.asset(icon, width: 40.r, height: 40.r),
          ),
      ],
    );
  }
}
