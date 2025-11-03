import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/submit/dpi_number_dialog.dart';
import 'package:flutter_echo/providers/id_card_provider.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/ui/widgets/step_check_field.dart';
import 'package:flutter_echo/ui/widgets/step_email_field.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/step_select_field.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FaceIDInfoDpi2 extends StatefulWidget {
  const FaceIDInfoDpi2({
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
  State<StatefulWidget> createState() => FaceIDInfoDpi2State();
}

class FaceIDInfoDpi2State extends State<FaceIDInfoDpi2> {
  final TextEditingController _idController = TextEditingController();

  ///final TextEditingController _nameController = TextEditingController();
  final TextEditingController _firstNameController =
      TextEditingController(); //名
  final TextEditingController _lastNameController = TextEditingController(); //姓

  final TextEditingController _emailController = TextEditingController(); //邮箱
  List<DictItem>? _genderItems;
  DictItem? _genderSelectItem;
  DateTime? _pickedDate;
  bool _showIdErrors = false;

  // bool _showNameErrors = false;
  bool _showBirthdayErrors = false;
  bool _showGenderErrors = false;
  String idErrors = "";

  bool _showFirstNameError = false; //名
  bool _showLastNameError = false; //姓

  bool isFontBackUploadSuccess = false;

  bool _showEmailError = false; //邮箱

  String? _emailError; //邮箱

  // 暴露给父组件的验证方法
  bool validateForm() {
    final idValid =
        _idController.text.isNotEmpty && idNumValid(_idController.text);
    //final nameValid = _nameController.text.isNotEmpty;

    final firstnameValid = _firstNameController.text.isNotEmpty; //名
    final lastnameValid = _lastNameController.text.isNotEmpty; //姓
    final email = _emailController.text; //email
    final emailValid = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email);
    setState(() {
      _showIdErrors = !idValid;
      _showFirstNameError = !firstnameValid;
      _showLastNameError = !lastnameValid;

      _showBirthdayErrors = _pickedDate == null;
      _showGenderErrors = _genderSelectItem == null;

      idErrors = _idController.text.isEmpty
          ? "Por favor introduzca su CUI"
          : (!idNumValid(_idController.text) ? "Formato CUI incorrecto" : "");

      _emailError = email.isEmpty
          ? 'Por favor introduzca su correo electrónico'
          : !emailValid
          ? 'Formatode correo electrónico incorrecto'
          : null;
    });
    return idValid &&
        firstnameValid &&
        lastnameValid &&
        _pickedDate != null &&
        _genderSelectItem != null &&
        (email.isNotEmpty && emailValid);
  }

  // 暴露给父组件的数据获取方法
  Map<String, dynamic> getFormData() => {
    'idNumber': _idController.text,
    // 'name': _nameController.text,
    'lastName': _lastNameController.text,
    'firstName': _firstNameController.text,
    'birthday': _pickedDate?.secondSinceEpoch,
    'gender': _genderSelectItem?.key,
    'email': _emailController.text,
  };

  @override
  void initState() {
    super.initState();

    _idController.addListener(_handleIdTextChange);
    // _nameController.addListener(_handleNameTextChange);
    _firstNameController.addListener(_handleFirstNameTextChange);
    _lastNameController.addListener(_handleLastNameTextChange);
    _emailController.addListener(_handleEmailTextChange);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      IdCardModel idCardModel = context.read<IdCardModel>();

      final dict = await idCardModel.getDictionary();
      _genderItems = dict?["0"];
      PhotoSubmitReq? cachedData = idCardModel.getCachedData();

      isFontBackUploadSuccess = idCardModel.isFontBackUploadSuccess();

      if (cachedData != null) {
        setState(() {
          _genderSelectItem = _genderItems?.findKey(
            cachedData.loanParam001OGender,
          );
          _pickedDate = cachedData.gargetOBirthday?.fromSecondsSinceEpoch;
          _idController.text = cachedData.attributionSubOIdCardNum ?? "";

          _firstNameController.text = cachedData.lq1s05OFirstName ?? "";
          _lastNameController.text = cachedData.darktownOLastName ?? "";
        });
      }
    });
  }

  @override
  void dispose() {
    _idController.removeListener(_handleIdTextChange);
    _firstNameController.removeListener(_handleIdTextChange);
    _lastNameController.removeListener(_handleIdTextChange);
    _emailController.removeListener(_handleEmailTextChange);
    super.dispose();
  }

  void _handleIdTextChange() {
    if (_showIdErrors == true) {
      setState(() {
        _showIdErrors = false;
      }); // 触发UI更新
    }
  }

  // void _handleNameTextChange() {
  //   if (_showNameErrors == true) {
  //     setState(() {
  //       _showNameErrors = false;
  //     }); // 触发UI更新
  //   }
  // }

  void _handleFirstNameTextChange() {
    if (_showFirstNameError == true) {
      setState(() {
        _showFirstNameError = false;
      }); // 触发UI更新
    }
  }

  void _handleLastNameTextChange() {
    if (_showLastNameError == true) {
      setState(() {
        _showLastNameError = false;
      }); // 触发UI更新
    }
  }

  void _handleEmailTextChange() {
    if (_showEmailError == true) {
      setState(() {
        _showEmailError = false;
      }); // 触发UI更新
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                  onTap: widget.dpiTap,
                  borderWidth: 1,
                  borderColor: NowColors.c0xFFD8D8D8,
                  child: Column(
                    children: [
                      Consumer<IdCardModel>(
                        builder: (_, provider, _) {
                          String? fontUrl = provider.mFontUrl;
                          UploadImageStatus uploadStatus =
                              provider.mFontUploadStatus;
                          if (uploadStatus == UploadImageStatus.success &&
                              fontUrl != null) {
                            return Image.network(
                              fontUrl,
                              width: context.screenWidth,
                              height: 160.h,
                            );
                          } else if (uploadStatus == UploadImageStatus.failed) {
                            return SizedBox(
                              height: 160.h, // 设置父容器高度为 160.h
                              child: Center(
                                // 使用 Center 来居中子元素
                                child: Image.asset(
                                  Drawable.iconImgbrokea1,
                                  width: 64.h, // 设置图片宽度为 64.h
                                  height: 64.h, // 设置图片高度为 64.h
                                ),
                              ),
                            );
                          } else {
                            return Image.asset(
                              Drawable.iconIdCard,
                              width: context.screenWidth,
                              height: 160.h,
                            );
                          }
                        },
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        widget.dpiTitle,
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
                  onTap: widget.dpiBackTap,
                  borderWidth: 1,
                  borderColor: NowColors.c0xFFD8D8D8,
                  child: Column(
                    children: [
                      Consumer<IdCardModel>(
                        builder: (_, provider, _) {
                          String? mBackUrl = provider.mBackUrl;
                          UploadImageStatus uploadStatus =
                              provider.mBackUploadStatus;
                          if (uploadStatus == UploadImageStatus.success &&
                              mBackUrl != null) {
                            return Image.network(
                              mBackUrl,
                              width: context.screenWidth,
                              height: 160.h,
                            );
                          } else if (uploadStatus == UploadImageStatus.failed) {
                            return SizedBox(
                              height: 160.h, // 设置父容器高度为 160.h
                              child: Center(
                                // 使用 Center 来居中子元素
                                child: Image.asset(
                                  Drawable.iconImgbrokea1,
                                  width: 64.h, // 设置图片宽度为 64.h
                                  height: 64.h, // 设置图片高度为 64.h
                                ),
                              ),
                            );
                          } else {
                            return Image.asset(
                              Drawable.iconIdCardBack,
                              width: context.screenWidth,
                              height: 160.h,
                            );
                          }

                          if (mBackUrl == null) {
                            return Image.asset(
                              Drawable.iconIdCardBack,
                              width: context.screenWidth,
                              height: 160.h,
                            );
                          } else {
                            return Image.network(
                              mBackUrl,
                              width: context.screenWidth,
                              height: 160.h,
                            );
                          }
                        },
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        widget.dpiBackTitle,
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
                Consumer<IdCardModel>(
                  builder: (_, provider, _) {
                    isFontBackUploadSuccess = provider
                        .isFontBackUploadSuccess();
                    if (provider.idNumOcr != null) {
                      _idController.text = provider.idNumOcr ?? "";
                      provider.idNumOcr = null;
                    }
                    // if (provider.nameOcr != null) {
                    //   _nameController.text = provider.nameOcr!;
                    //   provider.nameOcr = null;
                    // }

                    if (provider.firstNameOcr != null) {
                      _firstNameController.text = provider.firstNameOcr!;
                      provider.firstNameOcr = null;
                    }
                    if (provider.lastNameOcr != null) {
                      _lastNameController.text = provider.lastNameOcr!;
                      provider.lastNameOcr = null;
                    }

                    if (provider.birthdayOcr != null) {
                      _pickedDate = provider.birthdayOcr?.fromSecondsSinceEpoch;
                      provider.birthdayOcr = null;
                    }
                    if (provider.genderOcr != null) {
                      _genderSelectItem = _genderItems?.findKey(
                        provider.genderOcr,
                      );
                      provider.genderOcr = null;
                    }

                    return Visibility(
                      visible: isFontBackUploadSuccess,
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

                          StepInputField(
                            controller: _idController,
                            hintText: 'CUI',
                            maxLength: 13,
                            showCounter: true,
                            suffix: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: InkWell(
                                onTap: () => DpiNumberDialog.show(context),
                                child: Image.asset(
                                  Drawable.iconQuestion,
                                  width: 20.r,
                                  height: 20.r,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            isError: _showIdErrors,
                            errorText: idErrors,
                          ),

                          // StepInputField(
                          // controller: _idController,
                          // hintText: 'Número de DPI',
                          // maxLength: AppConst.idNumLen,
                          // keyboardType: TextInputType.number,
                          // isError: _showIdErrors,
                          // errorText: idErrors,
                          // ),
                          SizedBox(height: 16.h),
                          //  'Por favor introduzca un nombre',
                          //     'Por favor introduzca un Apellidos',
                          StepInputField(
                            //名
                            controller: _firstNameController,
                            hintText: 'Nombre(s)',
                            maxLength: 30,
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                RegExp(r'[0-9]'),
                              ),
                              FilteringTextInputFormatter.deny(emojiReg),
                            ],
                            isError: _showFirstNameError,
                            errorText: "Por favor introduzca un nombre",
                          ),
                          SizedBox(height: 16.h),
                          StepInputField(
                            //姓
                            controller: _lastNameController,
                            hintText: 'Apellidos',
                            maxLength: 30,
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                RegExp(r'[0-9]'),
                              ),
                              FilteringTextInputFormatter.deny(emojiReg),
                            ],
                            isError: _showLastNameError,
                            errorText: "Por favor introduzca un Apellidos",
                          ),
                          // StepInputField(
                          //   controller: _nameController,
                          //   hintText: 'Nombre completo',
                          //   maxLength: AppConst.idNameLen,
                          //   keyboardType: TextInputType.text,
                          //   isError: _showNameErrors,
                          //   errorText: 'No has ingresado tu nombre',
                          // ),
                          SizedBox(height: 16.h),
                          StepSelectField.pickDate(
                            context,
                            initSubYear: 20,
                            pickedDate: _pickedDate,
                            onValueChange: (value) => setState(() {
                              _pickedDate = value;
                              if (_showBirthdayErrors) {
                                _showBirthdayErrors = false;
                              }
                            }),
                            hintText: 'Fecha de Nacimiento',
                            isError: _showBirthdayErrors,
                            errorText:
                                "Por favor seleccione un fecha de nacimiento",
                          ),
                          SizedBox(height: 16.h),

                          StepCheckField.pickItem(
                            context,
                            items: _genderItems,
                            pickedItem: _genderSelectItem,
                            onValueChange: (value) => setState(() {
                              _genderSelectItem = value;
                              if (_showGenderErrors) {
                                setState(() {
                                  _showGenderErrors = false;
                                });
                              }
                            }),
                            hintText: 'Género',
                            isError: _showGenderErrors,
                            errorText: "Por favor seleccione la Género",
                          ),
                          SizedBox(height: 16.h),
                          StepEmailField(
                            controller: _emailController,
                            hintText: 'Correo electrónico',
                            isError: _showEmailError,
                            errorText:
                                _emailError ??
                                'Por favor introduzca su correo electrónico',
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class FaceIdInfoDpi extends StatelessWidget {
//   const FaceIdInfoDpi({
//     super.key,
//     required this.dpiTitle,
//     required this.dpiBackTitle,
//     this.dpiTap,
//     this.dpiBackTap,
//   });
//
//   final String dpiTitle;
//   final String dpiBackTitle;
//   final VoidCallback? dpiTap;
//   final VoidCallback? dpiBackTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return CommonBox(
//       padding: EdgeInsets.zero,
//       child: Column(
//         children: [
//           CommonBox(
//             color: NowColors.c0xFF3288F1,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(12),
//               topRight: Radius.circular(12),
//             ),
//             child: Text(
//               "Subir foto del DPI",
//               style: TextStyle(
//                 fontSize: 18.sp,
//                 color: NowColors.c0xFFFFFFFF,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//           CommonBox(
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(12),
//               bottomRight: Radius.circular(12),
//             ),
//             child: Column(
//               children: [
//                 CommonBox(
//                   onTap: dpiTap,
//                   borderWidth: 1,
//                   borderColor: NowColors.c0xFFD8D8D8,
//                   child: Column(
//                     children: [
//                       Consumer<IdCardModel>(
//                         builder: (_, provider, _) {
//                           String? fontUrl = provider.mFontUrl;
//                           UploadImageStatus uploadStatus =
//                               provider.mFontUploadStatus;
//                           if (uploadStatus == UploadImageStatus.success &&
//                               fontUrl != null) {
//                             return Image.network(
//                               fontUrl,
//                               width: context.screenWidth,
//                               height: 160.h,
//                             );
//                           } else if (uploadStatus == UploadImageStatus.failed) {
//                             return SizedBox(
//                               height: 160.h, // 设置父容器高度为 160.h
//                               child: Center(
//                                 // 使用 Center 来居中子元素
//                                 child: Image.asset(
//                                   Drawable.iconImgbrokea1,
//                                   width: 64.h, // 设置图片宽度为 64.h
//                                   height: 64.h, // 设置图片高度为 64.h
//                                 ),
//                               ),
//                             );
//                           } else {
//                             return Image.asset(
//                               Drawable.iconIdCard,
//                               width: context.screenWidth,
//                               height: 160.h,
//                             );
//                           }
//                         },
//                       ),
//                       SizedBox(height: 12.h),
//                       Text(
//                         dpiTitle,
//                         style: TextStyle(
//                           fontSize: 14.sp,
//                           color: NowColors.c0xFF3288F1,
//                           fontWeight: FontWeight.w400,
//                           decoration: TextDecoration.underline,
//                           decorationColor: NowColors.c0xFF3288F1,
//                           decorationThickness: 1,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 16.h),
//                 CommonBox(
//                   onTap: dpiBackTap,
//                   borderWidth: 1,
//                   borderColor: NowColors.c0xFFD8D8D8,
//                   child: Column(
//                     children: [
//                       Consumer<IdCardModel>(
//                         builder: (_, provider, _) {
//                           String? mBackUrl = provider.mBackUrl;
//                           if (mBackUrl == null) {
//                             return Image.asset(
//                               Drawable.iconIdCardBack,
//                               width: context.screenWidth,
//                               height: 160.h,
//                             );
//                           } else {
//                             return Image.network(
//                               mBackUrl,
//                               width: context.screenWidth,
//                               height: 160.h,
//                             );
//                           }
//                         },
//                       ),
//                       SizedBox(height: 12.h),
//                       Text(
//                         dpiBackTitle,
//                         style: TextStyle(
//                           fontSize: 14.sp,
//                           color: NowColors.c0xFF3288F1,
//                           fontWeight: FontWeight.w400,
//                           decoration: TextDecoration.underline,
//                           decorationColor: NowColors.c0xFF3288F1,
//                           decorationThickness: 1,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Visibility(
//                   visible: context
//                       .read<IdCardModel>()
//                       .isFontBackUploadSuccess(),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 16.h),
//                       Text(
//                         "Verifica cuidadosamente la siguiente información identificada en tu DPI",
//                         style: TextStyle(
//                           fontSize: 12.sp,
//                           color: NowColors.c0xFFFF9817,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       SizedBox(height: 16.h),
//                       StepInputField(
//                         controller: TextEditingController(),
//                         hintText: 'Número de DPI',
//                         maxLength: 30,
//                         keyboardType: TextInputType.text,
//                         isError: false,
//                         errorText: "",
//                       ),
//                       SizedBox(height: 16.h),
//                       StepInputField(
//                         controller: TextEditingController(),
//                         hintText: 'Nombre completo',
//                         maxLength: 30,
//                         keyboardType: TextInputType.text,
//                         isError: false,
//                         errorText: "",
//                       ),
//                       SizedBox(height: 16.h),
//                       StepSelectField.pickDate(
//                         context,
//                         pickedDate: DateTime(123654987),
//                         onValueChange: (value) {},
//                         hintText: 'Fecha de nacimiento',
//                         isError: false,
//                         errorText: "",
//                       ),
//                       SizedBox(height: 16.h),
//                       CommonToggleBox(
//                         title: "Sexo",
//                         options: ["Masculino", "Femenino"],
//                         onChanged: (val) {},
//                       ),
//                       // CommonBox(
//                       //   height: 60.h,
//                       //   borderWidth: 1,
//                       //   padding: EdgeInsets.symmetric(vertical: 14.h,horizontal: 12.w),
//                       //   borderColor: NowColors.c0xFFD8D8D8,
//                       //   child: Row(
//                       //     children: [
//                       //       Text(
//                       //         "Sexo",
//                       //         style: TextStyle(
//                       //           fontSize: 16.sp,
//                       //           color: NowColors.c0xFF77797B,
//                       //           fontWeight: FontWeight.w400,
//                       //         ),
//                       //       ),
//                       //       SizedBox(width: 65.w),
//                       //       Expanded(
//                       //           child: CommonBox(
//                       //             height: 32.h,
//                       //             alignment: Alignment.center,
//                       //             color: NowColors.c0xFF3288F1,
//                       //             padding: EdgeInsets.zero,
//                       //               child:  Text(
//                       //                 "Masculino",
//                       //                 style: TextStyle(
//                       //                   fontSize: 14.sp,
//                       //                   color: NowColors.c0xFFFFFFFF,
//                       //                   fontWeight: FontWeight.w500,
//                       //                 ),
//                       //               ),
//                       //           ),
//                       //       ),
//                       //       SizedBox(width: 12.w),
//                       //       Expanded(
//                       //         child: CommonBox(
//                       //           height: 32.h,
//                       //           alignment: Alignment.center,
//                       //           borderWidth: 1,
//                       //           borderColor: NowColors.c0xFFD8D8D8,
//                       //           padding: EdgeInsets.zero,
//                       //           child:  Text(
//                       //             "Femenino",
//                       //             style: TextStyle(
//                       //               fontSize: 14.sp,
//                       //               color: NowColors.c0xFF494C4F,
//                       //               fontWeight: FontWeight.w500,
//                       //             ),
//                       //           ),
//                       //         ),
//                       //       ),
//                       //     ],
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
