import 'package:flutter/material.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';

///还款银行页面-BAC
class RepayBankBacPage extends StatelessWidget {
  const RepayBankBacPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Banco BAC",
      ),
    );
  }
}
