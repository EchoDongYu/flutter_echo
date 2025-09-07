import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/providers/main_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/ui/widgets/home_arc_slider.dart';
import 'package:flutter_echo/ui/widgets/home_step.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

/// 产品+账单首页
class HomeLoanPage extends StatefulWidget {
  const HomeLoanPage({super.key});

  @override
  State<HomeLoanPage> createState() => _HomeLoanPageState();
}

class _HomeLoanPageState extends State<HomeLoanPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  MainModel get mainModel => Provider.of<MainModel>(context, listen: false);
  double minValue = 200;
  double maxValue = 2000;
  double step = 100;
  double value = 1000;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _setValue(double newValue) {
    double clamped = newValue.clamp(minValue, maxValue);
    double steps = ((clamped - minValue) / step).roundToDouble();
    double snapped = (minValue + steps * step).clamp(minValue, maxValue);
    setState(() => value = snapped);
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
                  padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 36.h),
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
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
                          TabBar(
                            controller: _tabController,
                            labelColor: NowColors.c0xFF3288F1,
                            unselectedLabelColor: NowColors.c0xFF1C1F23,
                            dividerHeight: 0,
                            tabs: [
                              Tab(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("MOVIES"),
                                ),
                              ),
                              Tab(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("GASMES"),
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
                            min: minValue,
                            max: maxValue,
                            step: step,
                            value: value,
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
                                  minValue.showRound,
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
                                  maxValue.showRound,
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
                            onPressed: () => mainModel.launchLoan(),
                            text: 'Solicítelo ya',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
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
                    SizedBox(height: 10.h),
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
}
