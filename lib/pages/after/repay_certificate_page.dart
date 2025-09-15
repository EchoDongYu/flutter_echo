import 'package:flutter/material.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';

///还款凭证页面
class RepayCertificatePage extends StatelessWidget {
  const RepayCertificatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Envía comprobante",
      ),
    );
  }
}
