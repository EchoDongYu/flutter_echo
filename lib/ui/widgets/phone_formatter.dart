import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digits = newValue.text.replaceAll(' ', '');
    StringBuffer buffer = StringBuffer();

    for (int i = 0; i < digits.length; i++) {
      buffer.write(digits[i]);
      if (i == 3 && i != digits.length - 1) {
        buffer.write(' ');
      }
    }

    // 光标位置
    int selectionIndex = buffer.toString().length;
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
