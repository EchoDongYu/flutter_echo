import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/ui/widgets/common_toggle_box.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/step_select_field.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaceIdInfoDpi extends StatelessWidget {
  const FaceIdInfoDpi({
    super.key,
    required this.dpiTitle,
    required this.dpiBackTitle,
    this.dpiTap,
    this.dpiBackTap,
  });

  final String dpiTitle;
  final String dpiBackTitle;
  final VoidCallback? dpiTap;
  final VoidCallback? dpiBackTap;

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
                  onTap: dpiTap,
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
                        dpiTitle,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: NowColors.c0xFF3288F1,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          decorationColor: NowColors.c0xFF3288F1,
                          decorationThickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                CommonBox(
                  onTap: dpiBackTap,
                  borderWidth: 1,
                  borderColor: NowColors.c0xFFD8D8D8,
                  child: Column(
                    children: [
                      Image.asset(
                        Drawable.iconIdCardBack,
                        width: context.screenWidth,
                        height: 160.h,
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        dpiBackTitle,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: NowColors.c0xFF3288F1,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          decorationColor: NowColors.c0xFF3288F1,
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
                      SizedBox(height: 16.h),
                      CommonToggleBox(
                        title: "Sexo",
                        options: ["Masculino", "Femenino"],
                        onChanged: (val) {
                          print("选中了: $val");
                        },
                      ),
                      // CommonBox(
                      //   height: 60.h,
                      //   borderWidth: 1,
                      //   padding: EdgeInsets.symmetric(vertical: 14.h,horizontal: 12.w),
                      //   borderColor: NowColors.c0xFFD8D8D8,
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         "Sexo",
                      //         style: TextStyle(
                      //           fontSize: 16.sp,
                      //           color: NowColors.c0xFF77797B,
                      //           fontWeight: FontWeight.w400,
                      //         ),
                      //       ),
                      //       SizedBox(width: 65.w),
                      //       Expanded(
                      //           child: CommonBox(
                      //             height: 32.h,
                      //             alignment: Alignment.center,
                      //             color: NowColors.c0xFF3288F1,
                      //             padding: EdgeInsets.zero,
                      //               child:  Text(
                      //                 "Masculino",
                      //                 style: TextStyle(
                      //                   fontSize: 14.sp,
                      //                   color: NowColors.c0xFFFFFFFF,
                      //                   fontWeight: FontWeight.w500,
                      //                 ),
                      //               ),
                      //           ),
                      //       ),
                      //       SizedBox(width: 12.w),
                      //       Expanded(
                      //         child: CommonBox(
                      //           height: 32.h,
                      //           alignment: Alignment.center,
                      //           borderWidth: 1,
                      //           borderColor: NowColors.c0xFFD8D8D8,
                      //           padding: EdgeInsets.zero,
                      //           child:  Text(
                      //             "Femenino",
                      //             style: TextStyle(
                      //               fontSize: 14.sp,
                      //               color: NowColors.c0xFF494C4F,
                      //               fontWeight: FontWeight.w500,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
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
