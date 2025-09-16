import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/before/trader_password_dialog.dart';
import 'package:flutter_echo/pages/user/user_bank_dialog.dart';
import 'package:flutter_echo/providers/apply_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/countdown_widget.dart';
import 'package:flutter_echo/ui/widgets/step_select_field.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  BankCardResp$Item? _pickedBank;
  List<StepItem>? _stepItems;
  StepItem? _pickedPurpose;
  bool _expanded = false;
  bool _showBankDialog = false;

  ApplyModel get applyModel => Provider.of<ApplyModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final dict = await applyModel.getLoanPreInfo(
        widget.productId,
        widget.amount,
      );
      setState(() => _stepItems = dict?['${ApplyModel.dictType}']);
    });
  }

  void _confirmLoan(BuildContext context) async {
    setState(() {
      _isErrors[0] = _pickedBank == null;
      _isErrors[1] = _pickedPurpose == null;
    });
    if (!_isErrors.contains(true)) {
      final loanInfo = applyModel.loanInfo;
      String? password;
      if (loanInfo?.cressyOTraderPwd == true) {
        password = await TraderPasswordDialog.show(
          context,
          hasTransPwd: loanInfo?.qn9yimOHasTransPwd == 1,
          orderGid: loanInfo?.z38e62OOrderGid,
        );
      }
      applyModel.confirmLoan(
        bank: _pickedBank,
        purpose: _pickedPurpose?.key,
        password: password,
      );
    }
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
                    primary: true,
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
        onPressed: () => _confirmLoan(context),
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
                    loanInfo?.centiareOServiceFee,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  ..._buildCard1Item('Comisión', loanInfo?.spriteOBusinessFee),
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
    return Consumer<ApplyModel>(
      builder: (context, provider, child) {
        final planList = provider.loanInfo?.glacisORepaymentPlanList;
        if (planList == null) return SizedBox();
        final length = planList.length;
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: NowStyles.cardShadows,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ?child,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: NowColors.c0xFFFFF9EA,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '$length Cuotas',
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
                physics: const NeverScrollableScrollPhysics(),
                itemCount: length,
                separatorBuilder: (context, index) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  return WidgetHelper.buildPlanItem(
                    '${index + 1}/$length',
                    planList[index].r5k31qODueTime,
                    planList[index].timesOBillAmount,
                  );
                },
              ),
            ],
          ),
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
          if (!_showBankDialog) ...[
            StepSelectField.pickBankCard(
              context,
              prefix: _buildPickedLogo(),
              pickedItem: _pickedBank,
              onValueChange: () async {
                setState(() => _showBankDialog = true);
                final result = await UserBankDialog.show(context);
                setState(() => _showBankDialog = false);
                if (result != null) {
                  setState(() {
                    _pickedBank = result;
                    _isErrors[0] = false;
                  });
                }
              },
              hintText: 'Cuenta bancaria',
              isError: _isErrors[0],
              errorText: _errorHint[0],
            ),
            StepSelectField.pickItem(
              context,
              items: _stepItems,
              pickedItem: _pickedPurpose,
              onValueChange: (value) => setState(() {
                _pickedPurpose = value;
                _isErrors[1] = false;
              }),
              hintText: 'Objetivo del préstamo',
              isError: _isErrors[1],
              errorText: _errorHint[1],
            ),
          ],
        ],
      ),
    );
  }

  /// 构建银行 Logo
  Widget? _buildPickedLogo() {
    final logo = _pickedBank?.m871v6OBankLogo;
    if (logo == null) return null;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        border: BoxBorder.all(color: NowColors.c0xFFD8D8D8, width: 0.6.w),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.r),
        child: CachedNetworkImage(
          imageUrl: logo,
          height: 22.h,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  static const _errorHint = [
    'Por favor añadir una cuenta bancaria',
    'Por favor elige objetivo del préstamo',
  ];
}
