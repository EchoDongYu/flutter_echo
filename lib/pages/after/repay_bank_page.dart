import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/pages/after/bank_view/repay_bank_box.dart';
import 'package:flutter_echo/pages/after/bank_view/repay_bank_step.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/providers/bill_detail_provider.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

///还款银行页面
class RepayBankPage extends StatefulWidget {
  const RepayBankPage({super.key});

  @override
  State<RepayBankPage> createState() => _RepayBankPageState();
}

class _RepayBankPageState extends State<RepayBankPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BillDetailModel>().getBankDictionary();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      appBar: CommonAppBar(
        title: 'Pago por bancos',
        onPopBack: () {
          final model = context.read<BillDetailModel>();
          if (model.selectedBank == null) {
            context.pop();
          } else {
            model.selectBankDict(null);
          }
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: Column(
          children: [
            Consumer<BillDetailModel>(
              builder: (_, provider, _) {
                final selectedBankItem = provider.selectedBank;
                if (selectedBankItem != null) {
                  return Column(
                    children: [
                      _buildDetailCard(selectedBankItem),
                      SizedBox(height: 12.h),
                      _buildTipCard(),
                    ],
                  );
                }
                return _buildListCard(provider.bankDictItems);
              },
            ),
            SizedBox(height: 12.h),
            _buildBottomCard(),
          ],
        ),
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: 'Pagar inmediatamente',
        onPressed: () => context.push(AppRouter.repayCert),
      ),
    );
  }

  Widget _buildListCard(List<BankDictV0Item> bankItems) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: NowColors.c0xFFFFFFFF,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: NowStyles.cardShadows,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '¿Cómo quieres pagar tu crédito?',
            style: TextStyle(
              fontSize: 18.sp,
              color: NowColors.c0xFF1C1F23,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16.h),
          RepayBankStep(
            stepNumber: '1',
            'Paga a través de comercios afiliados o condepósitos bancarios.',
          ),
          SizedBox(height: 16.h),
          RepayBankStep(
            stepNumber: '2',
            'Por favor, utilice el banco del que tenemos para pagar su préstamo.',
          ),
          SizedBox(height: 20.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: bankItems.length,
            separatorBuilder: (_, _) => SizedBox(height: 10.h),
            itemBuilder: (context, index) {
              final itemData = bankItems[index];
              return RepayBankBox(
                bankImage: itemData.m871v6 ?? '',
                bankTitle: itemData.t1h91p ?? '',
                onTap: () {
                  context.read<BillDetailModel>().selectBankDict(itemData);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDetailCard(BankDictV0Item item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonBox(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: BoxBorder.all(
                    color: NowColors.c0xFFD8D8D8,
                    width: 0.6.w,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CachedNetworkImage(
                    imageUrl: item.m871v6 ?? '',
                    height: 45.h,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.ruschuk ?? '',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: NowColors.c0xFF000000,
                    ),
                  ),
                  Text(
                    item.t1h91p ?? '',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: NowColors.c0xFF3288F1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        CommonBox(
          color: NowColors.c0xFF3288F1,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tipo de cuenta',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: NowColors.c0xFFFFFFFF.withValues(alpha: 0.8),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                item.exhedra ?? '',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFFFFFFFF,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Nombre',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: NowColors.c0xFFFFFFFF.withValues(alpha: 0.8),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                item.k5j6q9 ?? '',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFFFFFFFF,
                ),
              ),
              SizedBox(height: 16.h),
              CommonBox(
                color: NowColors.c0x00000000.withValues(alpha: 0.1),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Námero de cuenta',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: NowColors.c0xFFFFFFFF.withValues(alpha: 0.8),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          item.yca98c ?? '',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: NowColors.c0xFFFFFFFF,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Clipboard.setData(
                          ClipboardData(text: item.yca98c ?? ''),
                        );
                        toast('copiar');
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: NowColors.c0x00000000,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: NowColors.c0xFFFFFFFF,
                            width: 1,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Clipboard.setData(
                              ClipboardData(text: item.yca98c ?? ''),
                            );
                            toast('copiar');
                          },
                          child: Text(
                            'Copiar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: NowColors.c0xFFFFFFFF,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTipCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: NowColors.c0xFFFFFFFF,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: NowStyles.cardShadows,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '¿Cómo quieres pagar tu crédito?',
            style: TextStyle(
              fontSize: 18.sp,
              color: NowColors.c0xFF1C1F23,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16.h),
          RepayBankStep(
            stepNumber: '1',
            'Deposita en efectivo o transfiere a nuestra cuenta.',
          ),
          SizedBox(height: 16.h),
          RepayBankStep(
            stepNumber: '2',
            'cuando realice la transferencia por favor en la NOTA colocar el siguiente numero de telefono (${LocalStorage().realAccount})',
          ),
          SizedBox(height: 16.h),
          RepayBankStep(
            stepNumber: '3',
            'Envia una foto o captura de tu comprobante desde la app CashiGO',
          ),
          SizedBox(height: 16.h),
          RepayBankStep(
            stepNumber: '4',
            'Después de que sube el comprobante, el sistema será validara el mismo día, si la validacion se retrasa reducirá automáticamente el coste de intereses que genera.',
          ),
        ],
      ),
    );
  }

  Widget _buildBottomCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: NowColors.c0xFFFFFFFF,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: NowStyles.cardShadows,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '¿Ya realizaste tu depósito?',
            style: TextStyle(
              fontSize: 18.sp,
              color: NowColors.c0xFF1C1F23,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Envia tu comprobante para confirmar.',
            style: TextStyle(
              fontSize: 12.sp,
              color: NowColors.c0xFF494C4F,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'El pago se completara correctamente, si ha sido verificado por el sistema.',
            style: TextStyle(
              fontSize: 12.sp,
              color: NowColors.c0xFFFF9817,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
