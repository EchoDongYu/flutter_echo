import 'package:flutter/material.dart';
import 'package:flutter_echo/pages/face/face_view/face_rotating_border.dart';
import 'package:flutter_echo/providers/identification_provider.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';

/// 授信认证页面
class FaceIdentificationPage extends StatelessWidget {
  const FaceIdentificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Foto de rosto"),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: 33.h),
          child: Consumer<IdentificationModel>(
            builder: (context, provider, child) {
              if (provider.cameraController == null ||
                  !provider.cameraController!.value.isInitialized) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                children: [
                  RotatingBorderBox(
                    child: CameraPreview(provider.cameraController!),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    provider.hintText,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}


//活动对比-成功/失败-弹框
// Future<void> _showFaceIdeStatusDialog(BuildContext context) async{
//   final result = await PromptDialog.show(
//     context: context,
//     icon: Drawable.iconSuccess,
//     title: 'Verificação Concluída!',
//     content:"Cambio de la contraseña de la transacción con éxito",
//     confirmText: 'Voltar Para',
//   );
//   if (result == true && context.mounted){
//
//   }
// }
