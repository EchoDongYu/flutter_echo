import 'package:flutter/material.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';

///还款银行页面
class RepayBankPage extends StatelessWidget {
  const RepayBankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Reembolso bancario",
      ),
    );
  }
}
