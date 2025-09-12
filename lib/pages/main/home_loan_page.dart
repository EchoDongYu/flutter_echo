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
  HomeInfoResp$AssurOFaceList$Item? _pickedProduct;
  double _minValue = 0;
  double _maxValue = 0;
  double _step = 0;
  double _value = 0;

  MainModel get mainModel => Provider.of<MainModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final homeProduct = mainModel.homeInfo;
      final item = homeProduct?.assurOFaceList?.firstOrNull;
      final allLock = homeProduct?.nailheadOIsSpareLockAll == true;
      setState(() {
        _pickedProduct = allLock ? null : item;
        if (item == null) {
          _maxValue = homeProduct?.xuwh2oOLoanRangeMax ?? 0;
          _minValue = homeProduct?.mojr11OLoanRangeMin ?? 0;
          _step = homeProduct?.marrowOLoanRangeUnit ?? 0;
          _value = homeProduct?.xuwh2oOLoanRangeMax ?? 0;
        } else {
          _maxValue = item.xuwh2oOLoanRangeMax ?? 0;
          _minValue = item.mojr11OLoanRangeMin ?? 0;
          _step = item.marrowOLoanRangeUnit ?? 0;
          _value = item.xuwh2oOLoanRangeMax ?? 0;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _setValue(double newValue) {
    double clamped = newValue.clamp(_minValue, _maxValue);
    double steps = ((clamped - _minValue) / _step).roundToDouble();
    double snapped = (_minValue + steps * _step).clamp(_minValue, _maxValue);
    setState(() => _value = snapped);
  }

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
                      return _buildTabItem(list[index]);
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
              min: _minValue,
              max: _maxValue,
              step: _step,
              value: _value,
              size: 305,
              onChanged: _setValue,
            ),
            SizedBox(height: 7.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 45.w,
                  child: Text(
                    _minValue.showRound,
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
                    _maxValue.showRound,
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
                final lok = await mainModel.launchOk(context);
                if (lok == true) {
                  mainModel.launchLoan(
                    productId: _pickedProduct?.foreyardOProductId,
                    amount: _value,
                  );
                }
              },
              enable: _pickedProduct?.faroucheOIsLock != true,
              text: 'Solicítelo ya',
            ),
          ],
        ),
      );
    },
  );

  Widget _buildTabItem(HomeInfoResp$AssurOFaceList$Item item) {
    if (_pickedProduct == item) {
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
                    '${item.peddlerOPeriodCountId} Parcela',
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
      onTap: () {
        setState(() {
          _pickedProduct = item;
          _maxValue = item.xuwh2oOLoanRangeMax ?? 0;
          _minValue = item.mojr11OLoanRangeMin ?? 0;
          _step = item.marrowOLoanRangeUnit ?? 0;
          _value = item.xuwh2oOLoanRangeMax ?? 0;
        });
      },
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
              '${item.peddlerOPeriodCountId} Parcela',
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
