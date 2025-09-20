import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/step_select_field.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaceIdInfoDpi extends StatelessWidget {
  const FaceIdInfoDpi({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBox(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          CommonBox(
            color: NowColors.c0xFF3288F1,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Text(
              "Subir foto del DPI",
              style: TextStyle(
                fontSize: 18.sp,
                color: NowColors.c0xFFFFFFFF,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          CommonBox(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            child: Column(
              children: [
                CommonBox(
                  borderWidth: 1,
                  borderColor: NowColors.c0xFFD8D8D8,
                  child: Column(
                    children: [
                      Image.asset(
                        Drawable.iconIdCard,
                        width: context.screenWidth,
                        height: 160.h,
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        "Foto del frente del DPI",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: NowColors.c0xFF3288F1,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          decorationColor:NowColors.c0xFF3288F1,
                          decorationThickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                CommonBox(
                  borderWidth: 1,
                  borderColor: NowColors.c0xFFD8D8D8,
                  child: Column(
                    children: [
                      Image.asset(
                        Drawable.iconIdCard,
                        width: context.screenWidth,
                        height: 160.h,
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        "Foto del frente del DPI",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: NowColors.c0xFF3288F1,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          decorationColor:NowColors.c0xFF3288F1,
                          decorationThickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      Text(
                        "Verifica cuidadosamente la siguiente información identificada en tu DPI",
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
                        hintText: 'Número de DPI',
                        isError: false,
                        errorText: "",
                      ),
                      SizedBox(height: 16.h),
                      StepInputField(
                        controller: TextEditingController(),
                        hintText: 'Nombre completo',
                        maxLength: 30,
                        keyboardType: TextInputType.text,
                        isError: false,
                        errorText: "",
                      ),
                      SizedBox(height: 16.h),
                      StepSelectField.pickDate(
                        context,
                        pickedDate: DateTime(123654987),
                        onValueChange: (value) {},
                        hintText: 'Fecha de nacimiento',
                        isError: false,
                        errorText: "",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
