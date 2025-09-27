import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/pages/after/centificate_view/repay_certificate_diagram.dart';
import 'package:flutter_echo/pages/after/centificate_view/repay_certificate_info.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/providers/bill_detail_provider.dart';
import 'package:flutter_echo/ui/dialogs/box_dialog.dart';
import 'package:flutter_echo/ui/dialogs/prompt_dialog.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/step_select_field.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

///还款凭证页面
class RepayCertificatePage extends StatefulWidget {
  const RepayCertificatePage({super.key});

  @override
  State<RepayCertificatePage> createState() => _RepayCertificatePageState();
}

class _RepayCertificatePageState extends State<RepayCertificatePage> {
  int _certificateStep = 1;
  final _controllers = List.generate(3, (index) {
    return TextEditingController();
  }, growable: false);
  final _isErrors = List.generate(5, (index) {
    return false;
  }, growable: false);
  BankDictV0Item? _pickedBank;
  DateTime? _pickedDate;

  @override
  void initState() {
    super.initState();
    _controllers[0].addListener(() => _onInputChanged(1));
    _controllers[1].addListener(() => _onAmountChanged());
    _controllers[2].addListener(() => _onInputChanged(4));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final model = context.read<BillDetailModel>();
      _pickedBank = model.selectedBank;
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  /// 输入变化监听
  void _onInputChanged(int pos) {
    if (_isErrors[pos] != false) setState(() => _isErrors[pos] = false);
  }

  /// 金额输入变化监听
  void _onAmountChanged() {
    final text = _controllers[1].text;
    final length = text.length;
    final model = context.read<BillDetailModel>();
    final channelRate = model.selectedChannel?.kd94z7OChannelRate ?? 0;
    final totalValue = model.totalAmount ?? 0;
    final maxValue = totalValue + (totalValue * channelRate).truncate();
    final currentValue = text.tryParseDouble ?? 0;
    if (currentValue > maxValue) {
      toast('El monto ingreso es mas lo que tiene que pagar');
      _controllers[1].text = text.substring(0, length - 1);
    }
    if (_isErrors[2] != false) setState(() => _isErrors[2] = false);
  }

  void _applyRepay(BuildContext context) async {
    setState(() {
      _isErrors[0] = _pickedBank == null;
      _isErrors[1] = _controllers[0].text.isEmpty;
      _isErrors[2] = _controllers[1].text.isEmpty;
      _isErrors[3] = _pickedDate == null;
      _isErrors[4] = _controllers[2].text.isEmpty;
    });
    if (!_isErrors.contains(true)) {
      final model = context.read<BillDetailModel>();
      final minValue = model.selectedChannel?.minAmount ?? 0;
      final currentValue = _controllers[1].text.tryParseDouble ?? 0;
      if (currentValue < minValue) {
        toast('El monto ingreso hay que ser mayor de $minValue');
        return;
      }
      model.applyRepay(
        inputs: _controllers.map((it) => it.text).toList(),
        date: _pickedDate?.secondSinceEpoch,
        bank: _pickedBank,
      );
    }
  }

  Future<void> pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    final fileData = await file?.readAsBytes();
    if (context.mounted) saveImage(fileData);
  }

  Future<void> saveImage(Object? photo) async {
    if (photo is Uint8List) {
      context.read<BillDetailModel>().confimPhoto(photo);
      setState(() => _certificateStep = 2);
    }
  }

  Future<void> showDialog() async {
    if (_certificateStep == 1) {
      final result = await PromptDialog.show(
        context: context,
        title: 'Recordatorio',
        //content:'Excedio limite de intento de envios, por favor envíe de nuevo después de dos horas',
        content: 'Por favor, no suba nuevamente el mismo comprobante.',
        confirmText: 'Enviar el registro',
        cancelText: 'Cerrar',
      );
      if (result == true && context.mounted) {}
    } else {
      await BoxDialog.show(
        context: context,
        title: 'Diagrama de ejemplo de vale',
        btnText: 'Confirmar',
        centerLayout: RepayCertificateDiagram(),
        onConfirm: () {
          context.pop(true);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      appBar: CommonAppBar(title: 'Envía comprobante'),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: Column(
          children: [
            WidgetHelper.buildStepProgress(
              step: _certificateStep < 3 ? 1 : 2,
              maxStep: 2,
            ),
            SizedBox(height: 16.h),
            _buildCertPhoto(context),
            if (_certificateStep == 3) ...[
              SizedBox(height: 12.h),
              _buildCertField(context),
              SizedBox(height: 32.h),
              _buildCertSupport(context),
            ],
          ],
        ),
      ),
      bottomNavigationBar: _certificateStep == 1
          ? null
          : _certificateStep == 2
          ? WidgetHelper.buildBottomButton(
              text: 'Confirmar esta imagen',
              onPressed: () => setState(() => _certificateStep = 3),
            )
          : WidgetHelper.buildBottomButton(
              text: 'Enviar pago',
              onPressed: () => _applyRepay(context),
            ),
    );
  }

  Widget _buildCertPhoto(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: NowColors.c0xFFFFFFFF,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: NowStyles.cardShadows,
      ),
      child: Column(
        children: [
          CommonBox(
            color: NowColors.c0xFFFF9817.withValues(alpha: 0.1),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Text(
              'Confirmar tu depósito enviando una foto oimagen clara y legible de tu comprobante.',
              style: TextStyle(
                fontSize: 13.sp,
                color: NowColors.c0xFFFF9817,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          RepayCertificateInfo(step: _certificateStep),
          if (_certificateStep != 3) SizedBox(height: 28.h),
          if (_certificateStep == 1) ...[
            ElevatedButton(
              onPressed: () {
                context.push(AppRouter.certCamera).then((e) => saveImage(e));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50.h),
                backgroundColor: NowColors.c0xFF3288F1,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Drawable.iconTake, width: 20, height: 20),
                  SizedBox(width: 10.w),
                  Text(
                    'Tomar fotografia',
                    style: TextStyle(
                      color: NowColors.c0xFFFFFFFF,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            OutlinedButton(
              onPressed: () => pickImage(context),
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50.h),
                backgroundColor: NowColors.c0xFFFFFFFF,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                side: BorderSide(color: NowColors.c0xFFB0B1B2, width: 1),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Drawable.iconPhoto, width: 20, height: 20),
                  SizedBox(width: 10.w),
                  Text(
                    'Seleccionar imagen',
                    style: TextStyle(
                      color: NowColors.c0xFF1C1F23,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (_certificateStep == 2)
            EchoOutlinedButton(
              text: 'Volver a subir',
              onPressed: () => setState(() => _certificateStep = 1),
            ),
        ],
      ),
    );
  }

  Widget _buildCertField(BuildContext context) {
    final provider = context.read<BillDetailModel>();
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
            'Detalles de pago',
            style: TextStyle(
              fontSize: 18.sp,
              color: NowColors.c0xFF1C1F23,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Ingresa los datos de tu depósito como aparecenen tu comprobante.',
            style: TextStyle(
              fontSize: 12.sp,
              color: NowColors.c0xFFFF9817,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16.h),
          StepSelectField.pickRepayBank(
            context,
            items: provider.bankDictItems,
            prefix: _buildPickedLogo(),
            pickedItem: _pickedBank,
            onValueChange: (value) => setState(() {
              _pickedBank = value;
              _isErrors[0] = false;
            }),
            hintText: 'Depósito al banco',
            isError: _isErrors[0],
            errorText: _errorHint[0],
          ),
          SizedBox(height: 16.h),
          StepInputField(
            controller: _controllers[0],
            hintText: 'Número de autorización',
            maxLength: 30,
            suffix: InkWell(
              onTap: () {
                BoxDialog.show(
                  context: context,
                  title: 'Diagrama de ejemplo de vale',
                  btnText: 'Confirmar',
                  centerLayout: RepayCertificateDiagram(),
                  onConfirm: () => context.pop(),
                );
              },
              child: Image.asset(
                Drawable.iconQuestion,
                width: 20.r,
                height: 20.r,
              ),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            isError: _isErrors[1],
            errorText: _errorHint[1],
          ),
          SizedBox(height: 16.h),
          StepInputField(
            controller: _controllers[1],
            hintText: 'Importe del pago',
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            isError: _isErrors[2],
            errorText: _errorHint[2],
          ),
          SizedBox(height: 16.h),
          StepSelectField.pickDate(
            context,
            pickedDate: _pickedDate,
            onValueChange: (value) => setState(() {
              _pickedDate = value;
              _isErrors[3] = false;
            }),
            hintText: 'Fecha del depósito',
            isError: _isErrors[3],
            errorText: _errorHint[3],
          ),
          SizedBox(height: 16.h),
          StepInputField(
            controller: _controllers[2],
            hintText: 'Nombre del pagador',
            maxLength: 30,
            keyboardType: TextInputType.text,
            isError: _isErrors[4],
            errorText: _errorHint[4],
          ),
        ],
      ),
    );
  }

  Widget _buildCertSupport(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              final uri = Uri(
                path: AppRouter.certRecord,
                queryParameters: {
                  NavKey.id: context.read<BillDetailModel>().loanGid,
                },
              );
              context.push(uri.toString());
              // context.read<BillDetailModel>().queryRepaymentRecord(
              //   inputs: _controllers.map((it) => it.text).toList(),
              //   date: _pickedDate?.secondSinceEpoch,
              //   bank: _pickedBank,
              // );
            },
            child: Text(
              'Historial de pagos subidos',
              style: TextStyle(
                fontSize: 14.sp,
                decoration: TextDecoration.underline,
                decorationColor: NowColors.c0xFF3288F1,
                decorationThickness: 2,
                color: NowColors.c0xFF3288F1,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 32.h),
          Divider(height: 1, color: NowColors.c0xFFD8D8D8),
          SizedBox(height: 16.h),
          Text(
            'Si tiene algún problema con el pago, póngase en contacto con nosotros.',
            style: TextStyle(
              fontSize: 14.sp,
              color: NowColors.c0xFF494C4F,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12.h),
          GestureDetector(
            onTap: () async {
              final phone = await context
                  .read<BillDetailModel>()
                  .getWhatsDictionary();
              FlutterPlatform.launchWhatsApp(phone);
            },
            child: Text(
              'Suporte via WhatsApp',
              style: TextStyle(
                fontSize: 14.sp,
                decoration: TextDecoration.underline,
                decorationColor: NowColors.c0xFF3288F1,
                decorationThickness: 2,
                color: NowColors.c0xFF3288F1,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 56.h),
        ],
      ),
    );
  }

  /// 构建银行 Logo
  Widget? _buildPickedLogo() {
    final logo = _pickedBank?.m871v6;
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
    'Por favor seleccione',
    'Por favor introduzca el número de comprobante/número de cuenta de pago',
    'Por favor introduzca el importe del pago',
    'Por favor seleccione un fecha del depósito',
    'Por favor introduzca el nombre del pagador',
  ];
}
