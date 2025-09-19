import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/providers/main_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/ui/widgets/home_arc_slider.dart';
import 'package:flutter_echo/ui/widgets/home_step.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// 产品+账单首页
class HomeLoanPage extends StatefulWidget {
  const HomeLoanPage({super.key});

  @override
  State<HomeLoanPage> createState() => _HomeLoanPageState();
}

class _HomeLoanPageState extends State<HomeLoanPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WidgetHelper.buildTopGradient(context: context, height: 55.h),
        SafeArea(
          child: Column(
            children: [
              EchoTopBar(title: AppConst.applicationName, showBack: false),
              Expanded(
                child: ListView(
                  primary: true,
                  padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 90.h),
                  children: [
                    _buildBill(),
                    _buildProductCard(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      child: Text(
                        'En solo 3 pasos',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: NowColors.c0xFF1C1F23,
                          height: 26 / 18,
                        ),
                      ),
                    ),
                    HomeBottomStep(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBill() => Consumer<MainModel>(
    builder: (context, provider, _) {
      final homeInfo = provider.homeInfo;
      final bill = homeInfo?.papuanOLastRecordLoan;
      final planList = bill?.outdoOPlanSimpleList;
      if (bill == null || planList == null) return SizedBox();
      return Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [NowColors.c0xFF3288F1, NowColors.c0xFF4FAAFF],
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: NowStyles.cardShadows,
        ),
        child: InkWell(
          onTap: () {
            // 1 账单详情
            switch (bill.suffOLoanStatus) {
              case -1:
              case 0:
                context.push(AppRouter.applyProcess);
              case 1:
                context.push(AppRouter.billDetail);
              case 2:
                context.push(AppRouter.applyFailed);
            }
          },
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Stack(
            children: [
              Image.asset(
                Drawable.bgLoginTop,
                width: planList.isEmpty ? 100.w : 200.w,
                fit: BoxFit.fitWidth,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Text(
                      bill.n410zdOLoanTime?.showDate ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        height: 18 / 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          bill.retiaryOLoanAmount?.showAmount ?? '',
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            height: 38 / 30,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            color: NowColors.c0xFF1C1F23.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                            border: Border.all(
                              width: 1.w,
                              color: Colors.white,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Pendiente',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  height: 18 / 14,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_right_rounded,
                                color: Colors.white,
                                size: 26,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 22.h),
                  ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: planList.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 12.h);
                    },
                    itemBuilder: (context, index) {
                      return WidgetHelper.buildPlanItem(
                        '${index + 1}/${planList.length}',
                        planList[index].r5k31qODueTime,
                        planList[index].wantonlyOLoanLeftAmount,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );

  Widget _buildProductCard() => Consumer<MainModel>(
    builder: (context, provider, _) {
      final homeInfo = provider.homeInfo;
      final list = homeInfo?.assurOFaceList;
      if (list == null || list.isEmpty == true) return SizedBox();
      return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(bottom: 20.h),
        padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 28.h),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: NowStyles.cardShadows,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Escolha o seu produto de empréstimo',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: NowColors.c0xFF1C1F23,
                height: 20 / 14,
              ),
            ),
            SizedBox(height: 16.h),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 72.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F3F2),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 82.h,
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return _buildTabItem(list[index], provider.pickedProduct);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 22.h),
            Text(
              'Escolha o valor do empréstimo',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: NowColors.c0xFF1C1F23,
                height: 20 / 14,
              ),
            ),
            SizedBox(height: 20.h),
            ArcSlider(
              min: provider.minValue,
              max: provider.maxValue,
              step: provider.step,
              value: provider.value,
              size: 305,
              onChanged: provider.updateValue,
            ),
            SizedBox(height: 7.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 45.w,
                  child: Text(
                    provider.minValue.showRound,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: NowColors.c0xFF77797B,
                      height: 14 / 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 45.w,
                  child: Text(
                    provider.maxValue.showRound,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: NowColors.c0xFF77797B,
                      height: 14 / 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            EchoPrimaryButton(
              onPressed: () async {
                final mainModel = context.read<MainModel>();
                final lok = await mainModel.launchOk(context);
                if (lok == true) mainModel.launchLoan();
              },
              enable: !provider.isLock,
              text: 'Solicítelo ya',
            ),
          ],
        ),
      );
    },
  );

  Widget _buildTabItem(
    HomeInfoResp$AssurOFaceList$Item item,
    HomeInfoResp$AssurOFaceList$Item? pickedProduct,
  ) {
    if (pickedProduct == item) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(Drawable.bgHomeSelect, fit: BoxFit.fitHeight),
          Container(
            height: 72.h,
            margin: EdgeInsets.only(bottom: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4.h,
              children: [
                Text(
                  '${item.b49d07OProductPeriodId} Dias',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: 24 / 18,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  child: Text(
                    '${item.peddlerOPeriodCountId} Cuota',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: NowColors.c0xFF3288F1,
                      height: 16 / 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
    return InkWell(
      onTap: () => context.read<MainModel>().changeProduct(item),
      child: Container(
        width: 128.w,
        height: 72.h,
        margin: EdgeInsets.only(bottom: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4.h,
          children: [
            Text(
              '${item.b49d07OProductPeriodId} Dias',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: NowColors.c0xFF1C1F23,
                height: 24 / 18,
              ),
            ),
            Text(
              '${item.peddlerOPeriodCountId} Cuota',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: NowColors.c0xFF494C4F,
                height: 16 / 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
