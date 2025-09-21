import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/step_select_field.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepayCertificatePayment extends StatelessWidget {
  const RepayCertificatePayment({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBox(
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
          StepSelectField.pickDate(
            context,
            pickedDate: DateTime(123654987),
            onValueChange: (value) {},
            hintText: 'Depósito al banco',
            isError: false,
            errorText: "",
          ),
          SizedBox(height: 16.h),
          StepInputField(
            controller: TextEditingController(),
            hintText: 'Número de autorización',
            maxLength: 13,
            showCounter: true,
            suffix: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  Drawable.iconQuestion,
                  width: 20.r,
                  height: 20.r,
                ),
              ),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            isError: false,
            errorText: "",
          ),
          SizedBox(height: 16.h),
          StepInputField(
            controller: TextEditingController(),
            hintText: 'Importe del pago',
            maxLength: 30,
            keyboardType: TextInputType.text,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
            ],
            isError: false,
            errorText: "",
          ),
          SizedBox(height: 16.h),
          StepInputField(
            controller: TextEditingController(),
            hintText: 'Fecha del depósito',
            maxLength: 13,
            showCounter: true,
            suffix: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  Drawable.iconContact,
                  width: 20.r,
                  height: 20.r,
                ),
              ),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            isError: false,
            errorText: "",
          ),
          SizedBox(height: 16.h),
          StepInputField(
            controller: TextEditingController(),
            hintText: 'Nombre del pagador',
            maxLength: 30,
            keyboardType: TextInputType.text,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
            ],
            isError: false,
            errorText: "",
          ),
        ],
      ),
    );
  }
}
