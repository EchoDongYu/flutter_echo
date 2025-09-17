import 'package:flutter/material.dart';
import 'package:flutter_echo/pages/face/face_view/face_identification_box.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 授信认证页面
class FaceIdentificationPage extends StatelessWidget {
  const FaceIdentificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
          title: "Foto de rosto",
      ),
      body: Align(
        alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 33.h),
            child: FaceIdentificationBox(),
          ),
      ),
    );
  }
}

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
