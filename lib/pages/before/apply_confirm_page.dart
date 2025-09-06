import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/providers/apply_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/countdown_widget.dart';
import 'package:flutter_echo/ui/widgets/step_select_field.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ApplyConfirmPage extends StatefulWidget {
  final int? productId;
  final double? amount;

  const ApplyConfirmPage({super.key, this.productId, this.amount});

  @override
  State<ApplyConfirmPage> createState() => _ApplyConfirmPageState();
}

class _ApplyConfirmPageState extends State<ApplyConfirmPage> {
  final _isErrors = List.generate(2, (index) {
    return false;
  }, growable: false);
  final _pickedItem = List<StepItem?>.generate(2, (index) {
    return null;
  }, growable: false);
  List<List<StepItem>?>? _stepItems;
  bool _expanded = false;

  ApplyModel get applyModel => Provider.of<ApplyModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      applyModel.getLoanPreInfo(widget.productId, widget.amount);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      body: Stack(
        children: [
          WidgetHelper.buildTopGradient(context: context, height: 55.h),
          SafeArea(
            child: Column(
              children: [
                EchoTopBar(title: 'Confirmación de préstamo'),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 36.h),
                    children: [
                      ..._buildCard1(context),
                      SizedBox(height: 12.h),
                      _buildCard2(),
                      SizedBox(height: 12.h),
                      _buildCard3(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: 'Enviar',
        onPressed: () => context.go(AppRouter.main),
      ),
    );
  }

  List<Widget> _buildCard1(BuildContext context) {
    return [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: NowStyles.cardShadows,
        ),
        child: Row(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: NowColors.c0xFFFF9817,
                    fontWeight: FontWeight.w500,
                    height: 18 / 12,
                  ),
                  children: [
                    const TextSpan(
                      text:
                          'Si presenta susolicitud antes delas\ntendraun indicede aprobados del ',
                    ),
                    TextSpan(
                      text: '99%',
                      style: TextStyle(fontSize: 16.sp, height: 18 / 16),
                    ),
                  ],
                ),
              ),
            ),
            CountdownWidget(duration: const Duration(minutes: 10)),
          ],
        ),
      ),
      Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 12.h),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [NowColors.c0xFF3288F1, NowColors.c0xFF4FAAFF],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: NowStyles.cardShadows,
        ),
        child: Consumer<ApplyModel>(
          builder: (context, provider, child) {
            return Column(
              children: [
                Text(
                  'Cantidad recibida (Q)',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: 18 / 13,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  provider.loanInfo?.pluralOReceiveAmount?.showAmount ?? '',
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 44 / 36,
                  ),
                ),
                SizedBox(height: 8.h),
                _buildCard1Expanded(provider.loanInfo),
                SizedBox(height: 8.h),
                ?child,
              ],
            );
          },
          child: InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Container(
              width: double.infinity,
              height: 30.h,
              decoration: const BoxDecoration(
                color: Color(0x1A000000),
                borderRadius: BorderRadius.all(Radius.circular(16)),
                boxShadow: NowStyles.cardShadows,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _expanded ? "Guardar" : "Ver detalles",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      height: 18 / 12,
                    ),
                  ),
                  Icon(
                    _expanded
                        ? Icons.arrow_drop_up_rounded
                        : Icons.arrow_drop_down_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ];
  }

  Widget _buildCard1Expanded(LoanPreInfoResp? loanInfo) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        constraints: _expanded
            ? const BoxConstraints()
            : const BoxConstraints(maxHeight: 0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  ..._buildCard1Item(
                    'Monto del préstamo',
                    loanInfo?.retiaryOLoanAmount,
                  ),
                  SizedBox(height: 16.h),
                  ..._buildCard1Item(
                    'Cargo por Interés',
                    loanInfo?.sk6s63OCouponAmount,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  ..._buildCard1Item('Comisión', loanInfo?.e88wy1OLoanFee),
                  SizedBox(height: 16.h),
                  ..._buildCard1Item(
                    'Monto a pagar',
                    loanInfo?.gatemanORepaymentAmount,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCard1Item(String first, double? second) {
    return [
      Text(
        first,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xCCFFFFFF),
          height: 18 / 12,
        ),
      ),
      SizedBox(height: 2.h),
      Text(
        second?.showAmount ?? '',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          height: 18 / 14,
        ),
      ),
    ];
  }

  Widget _buildCard2() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: NowStyles.cardShadows,
      ),
      child: Consumer<ApplyModel>(
        builder: (context, provider, child) {
          final planList = provider.loanInfo?.glacisORepaymentPlanList;
          return Column(
            children: [
              ?child,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: NowColors.c0xFFFFF9EA,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${planList?.length} Cuotas',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFFFF9817,
                        height: 24 / 14,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
                itemCount: planList?.length ?? 0,
                separatorBuilder: (context, index) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  return _buildCard2Item(
                    '${index + 1}/${planList?.length}',
                    planList?[index].r5k31qODueTime,
                    planList?[index].timesOBillAmount,
                  );
                },
              ),
            ],
          );
        },
        child: Text(
          'Plan de pago',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: NowColors.c0xFF1C1F23,
            height: 24 / 18,
          ),
        ),
      ),
    );
  }

  Widget _buildCard2Item(String index, int? first, double? second) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: NowColors.c0xFFF3F3F5,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: NowColors.c0xFFFF9817,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Text(
              index,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 16 / 12,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40.w, 12.h, 12.w, 12.h),
            child: Column(
              spacing: 6.h,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Vencimiento',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFF494C4F,
                        height: 18 / 12,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      first?.showDate ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFF1C1F23,
                        height: 18 / 14,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Monto a pagar',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFF494C4F,
                        height: 18 / 12,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      second?.showAmount ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFFFF9817,
                        height: 18 / 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard3(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: NowStyles.cardShadows,
      ),
      child: Column(
        spacing: 16.h,
        children: [
          StepSelectField.pickItem(
            context,
            items: _stepItems?[0],
            pickedItem: _pickedItem[0],
            onValueChange: (value) => setState(() {
              _pickedItem[0] = value;
              _isErrors[0] = false;
            }),
            hintText: 'Cuenta bancaria',
            isError: _isErrors[0],
            errorText: _errorHint[0],
          ),
          StepSelectField.pickItem(
            context,
            items: _stepItems?[1],
            pickedItem: _pickedItem[1],
            onValueChange: (value) => setState(() {
              _pickedItem[1] = value;
              _isErrors[1] = false;
            }),
            hintText: 'Objetivo del préstamo',
            isError: _isErrors[1],
            errorText: _errorHint[1],
          ),
        ],
      ),
    );
  }

  static const _errorHint = [
    'Por favor añadir una cuenta bancaria',
    'Por favor elige objetivo del préstamo',
  ];
}
