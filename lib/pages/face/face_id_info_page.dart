import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echo/event/event_data.dart';
import 'package:flutter_echo/event/event_service.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/pages/face/face_guide_dialog.dart';
import 'package:flutter_echo/pages/face/face_id_guide_dialog.dart';
import 'package:flutter_echo/pages/face/face_view/face_id_info_dpi.dart';
import 'package:flutter_echo/pages/face/face_view/face_id_info_facial.dart';
import 'package:flutter_echo/pages/face/face_view/face_id_info_tips.dart';
import 'package:flutter_echo/providers/id_card_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

/// 授信证件信息页面
class FaceIdInfoPage extends StatefulWidget {
  const FaceIdInfoPage({super.key});

  @override
  State<StatefulWidget> createState() => _FaceIdInfoPageState();
}

class _FaceIdInfoPageState extends State<FaceIdInfoPage> {
  // 添加 GlobalKey 来访问子组件状态
  final GlobalKey<FaceIDInfoDpi2State> _formKey = GlobalKey();

  @override
  void deactivate() {
    // 获取组件数据
    final formData =
        _formKey.currentState?.getFormData().map(
          (key, value) => MapEntry(key, value),
        ) ??
        {};
    final idNumber = formData['idNumber'];
    final lastName = formData['lastName'];
    final firstName = formData['firstName'];
    // final name = formData['name'];
    final gender = formData['gender'];
    final birthday = formData['birthday'];
    final email = formData['email'];
    context.read<IdCardModel>().cacheIdCardInfo(
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      birthday: birthday,
      idNumber: idNumber,
      f31u3kOEmail: email,
    );
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Autenticación de identidad"),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: Column(
          children: [
            WidgetHelper.buildStepProgress(step: 3, maxStep: 3),
            SizedBox(height: 16.h),
            FaceIdInfoTips(),
            SizedBox(height: 12.h),
            FaceIDInfoDpi2(
              key: _formKey,
              dpiTitle: context.read<IdCardModel>().fontTitle(),
              dpiBackTitle: context.read<IdCardModel>().backTitle(),
              dpiTap: () {
                _showStepFaceIdDialog(context, PicType.front);
              },
              dpiBackTap: () {
                _showStepFaceIdDialog(context, PicType.back);
              },
            ),
            SizedBox(height: 12.h),
            FaceIdInfoFacial(
              dpiFaceTitle: "",
              dpiFaceTap: () async {
                if (!context.read<IdCardModel>().mFontUrl.isNotEmptyOrNull) {
                  toast("No has subido la foto del frente del DPI");
                  return;
                }

                if (!context.read<IdCardModel>().mBackUrl.isNotEmptyOrNull) {
                  toast("No has subido la foto del reverso del DPI");
                  return;
                }

                final result = await FaceGuideDialog.show(context);
                if (result == true) {
                  if (context.mounted) {
                    final capturedImages = await context.push<List<String>>(
                      AppRouter.faceIdentification,
                    );
                    if (capturedImages != null) {
                      if (context.mounted) {
                        context.read<IdCardModel>().uploadFaceImage(
                          capturedImages,
                        );
                      }
                    }
                    debugLog("reslut capturedImages=${capturedImages}");
                  }
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: "Enviar",
        onPressed: () async {
          EventService.batchUploadEvents(uploadMode: 2);
          _handleSubmit(context);
        },
      ),
    );
  }

  Future<void> _showStepFaceIdDialog(
    BuildContext context,
    PicType picType,
  ) async {
    // 1-身份证正面，2-身份证反面
    final result = await FaceIdGuideDialog.show(context, picType.value);
    if (context.mounted) {
      if (result != null) {
        final model = context.read<IdCardModel>();
        if (result == PicType.album) {
          //图库选择
          final ImagePicker picker = ImagePicker();
          final XFile? file = await picker.pickImage(
            source: ImageSource.gallery,
          );
          final fileData = await file?.readAsBytes();
          if (fileData is Uint8List && context.mounted) {
            model.uploadImage(fileData, picType, PicType.album);
          }
        } else if (result == PicType.camera) {
          //拍照
          context.push(AppRouter.faceCamera).then((e) {
            debugLog(" push result faceCamera");
            if (e != null && e is Uint8List) {
              // 使用 read() 来避免触发 rebuild
              if (context.mounted) {
                model.uploadImage(e, picType, PicType.camera);
              }
            } else {
              // 处理 e 为空或类型不匹配的情况
              debugLog("Error: Expected Uint8List, but got ${e.runtimeType}");
            }
          });
        }
      }
    }
  }

  Future<void> _handleSubmit(BuildContext context) async {
    // 关键点4：调用子组件验i证
    final isValid = _formKey.currentState?.validateForm() ?? false;

    if (!isValid) {
      return;
    }
    IdCardModel idCardModel = context.read<IdCardModel>();
    if (!idCardModel.mFontUrl.isNotEmptyOrNull) {
      toast("No has subido la foto del frente del DPI");
      return;
    }

    if (!idCardModel.mBackUrl.isNotEmptyOrNull) {
      toast("No has subido la foto del reverso del DPI");
      return;
    }
    if (!idCardModel.isFaceUploadSuccess()) {
      toast("No has subido tu autenticación facial");
      return;
    }

    // 获取组件数据
    final formData =
        _formKey.currentState?.getFormData().map(
          (key, value) => MapEntry(key, value),
        ) ??
        {};
    final idNumber = formData['idNumber'] as String;
    final lastName = formData['lastName'];
    final firstName = formData['firstName'];
    final gender = formData['gender'] as int;
    final birthday = formData['birthday'] as int;
    final email = formData['email'] as String;

    idCardModel.submitPhoto(
      f31u3kOEmail: email,
      firstName: firstName,
      lastName: lastName,
      idNumber: idNumber,
      birthday: birthday,
      gender: gender,
    );
  }
}
