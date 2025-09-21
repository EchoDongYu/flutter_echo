import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/services/permission_service.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 授权声明弹窗
class DisclosureDialog extends StatelessWidget {
  final VoidCallback onAgree;
  final VoidCallback onDisagree;

  const DisclosureDialog({
    super.key,
    required this.onAgree,
    required this.onDisagree,
  });

  /// 显示授权声明弹窗
  static Future<bool?> show(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      useSafeArea: true,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (_) => PopScope(
        canPop: false,
        child: DisclosureDialog(
          onAgree: () async {
            await LocalStorage().set(AppConst.disclosureKey, true);
            await PermissionService().requestAllPermissions();
            if (context.mounted) context.pop(true);
          },
          onDisagree: () async {
            await LocalStorage().set(AppConst.disclosureKey, false);
            if (context.mounted) context.pop(false);
          },
        ),
      ),
    );
  }

  static const permissionItems = [
    Pair(
      'SMS',
      """
Propósito del permiso:
Recopilaremos esta información con el único propósito de evaluar su situación financiera y determinar su elegibilidad para el préstamo, lo que nos permitirá realizar la gestión de riesgos y la evaluación antifraude. Tiene el derecho de rechazar el acceso a SMS, pero esto afectará nuestra evaluación de su situación crediticia, impactando el proceso completo de uso en nuestra aplicación. Puede habilitar o deshabilitar este permiso en cualquier momento desde la configuración.

Uso de los datos:
Recopilaremos sus SMS, incluyendo: el remitente, la fecha y el contenido. Estos serán transmitidos y almacenados a través de nuestro servidor (https://insights.credifacilgo.com/insights). No obstante, filtraremos y eliminaremos aquellos que no sean útiles para el análisis de riesgo financiero y no los almacenaremos. No abusaremos de la información ni la compartiremos con terceros. Cumpliremos con las regulaciones, normas y políticas de privacidad para proteger la seguridad de sus datos.

Seguridad de los datos:
Ciframos la información del registro de SMS del usuario utilizando el protocolo HTTPS y la transferimos a nuestro servidor (https://insights.credifacilgo.com/insights. Sin el consentimiento del usuario, no compartiremos los datos recopilados con terceros.""",
    ),
    Pair(
      'Los contactos de emergencia',
      """
Solo recopilaremos la información de dos contactos de emergencia que tú elijas o ingreses, incluyendo: tu relación con el contacto, el nombre del contacto y el número de teléfono del contacto. Esta información se utilizará únicamente para verificar tu autenticidad, evaluar tu elegibilidad crediticia, analizar riesgos y prevenir fraudes. Tú puedes elegir cómo proporcionar esta información: a) Rellenarla manualmente; b) Completarla automáticamente. La autocompletación es una forma de interacción eficiente que te permite seleccionar información específica de tu lista de contactos para subirla rápidamente a nuestra aplicación, ahorrando tiempo de llenado. Es importante señalar que este método solo obtendrá la información de los contactos que tú elijas, y no accederá a toda tu agenda de contactos. Sin tu permiso, nunca compartiremos tus datos con terceros. Todos los datos se subirán y almacenarán a través de una conexión segura (https) en nuestros servidores.""",
    ),
    Pair(
      'Cámara',
      """
Para garantizar que el proceso de servicio se realice sin problemas, necesitamos acceder a la cámara de tu dispositivo. Una vez que nos otorgues la autorización, podrás tomar fotos directamente de tu documento de identidad y de tu rostro y subirlas a nuestra plataforma para completar los pasos necesarios de verificación KYC (Conoce a tu Cliente). También podrás tomar fotos de tus comprobantes de pago de devolución y subirlos directamente a nuestra plataforma para completar la verificación de tu pago. Te aseguramos que no accederemos ni almacenaremos ninguna otra foto o video de tu dispositivo.

Le informamos que, sin su consentimiento, no podremos brindarle el servicio de captura y actualización de imágenes.""",
    ),
    Pair(
      'Ubicación',
      """
Recopilamos información aproximada de tu ubicación para asegurarnos de que tu solicitud de préstamo se realice dentro de las fronteras de Guatemala y para ayudarnos a realizar una evaluación de riesgos. Ten en cuenta que solo recopilamos datos de ubicación aproximada. La información de ubicación recopilada se subirá de manera segura a nuestros servidores en https://insights.credifacilgo.com/insights. Te garantizamos que tu información de ubicación no se asociará con ningún otro dato ni se compartirá con terceros.""",
    ),
    Pair(
      'Aplicaciones instaladas',
      """
Recopilamos información sobre las aplicaciones instaladas en tu dispositivo para ayudarnos a analizar tu perfil de usuario, evaluar tu nivel de riesgo y determinar tu límite de crédito. La información recopilada sobre las aplicaciones—incluyendo el nombre de la app, el nombre del paquete, la fecha de instalación, la fecha de actualización y la versión—se subirá de manera segura a nuestro servidor en https://insights.credifacilgo.com/insights. Te garantizamos que la información de tu lista de aplicaciones no se asociará con ningún otro dato ni se compartirá con terceros.""",
    ),
    Pair(
      'Información dispositivo',
      """
Recopilamos información de tu dispositivo para detectar mejor actividades fraudulentas. Solo se recopilará información específica del dispositivo utilizado para solicitar el préstamo (como detalles del hardware, versión del sistema operativo y datos de uso de aplicaciones). Todos los datos recopilados se subirán de manera segura a nuestro servidor en https://insights.credifacilgo.com/insights Te garantizamos que la información de tu dispositivo no se asociará con ningún otro dato ni se compartirá con terceros.""",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.8;
    return BottomSheet(
      onClosing: onDisagree,
      enableDrag: false,
      backgroundColor: Colors.white,
      constraints: BoxConstraints(maxHeight: height),
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            children: [
              SizedBox(height: 16.h),
              Text(
                'Solicitar permisos',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF1C1F23,
                  height: 24 / 18,
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                width: double.infinity,
                color: NowColors.c0xFFEFF7FF,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                child: Text(
                  'Para garantizar que pueda utilizar nuestros servicios de préstamo de manera adecuada, necesitamos obtener los siguientes permisos e informaciones.',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: NowColors.c0xFF3288F1,
                    height: 18 / 13,
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.fromLTRB(14.w, 22.h, 14.w, 90.h),
                  itemCount: permissionItems.length,
                  separatorBuilder: (context, index) => SizedBox(height: 22.h),
                  itemBuilder: (context, index) {
                    return _buildPermissionItem(permissionItems[index]);
                  },
                ),
              ),
            ],
          ),
          WidgetHelper.buildBottomBlurButton(
            confirmText: 'Siguiente',
            cancelText: 'Discrepar',
            onConfirm: onAgree,
            onCancel: onDisagree,
          ),
        ],
      ),
    );
  }

  /// 构建权限项目
  Widget _buildPermissionItem(Pair item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            Container(
              width: 22.r,
              height: 22.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [NowColors.c0xFF3389F2, NowColors.c0x474CA6FD],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 2.h),
              child: Text(
                item.first,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF1C1F23,
                  height: 30 / 20,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            item.second,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: NowColors.c0xFF494C4F,
              height: 20 / 13,
            ),
          ),
        ),
      ],
    );
  }
}
