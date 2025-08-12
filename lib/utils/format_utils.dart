class FormatUtils {
  /// 手机号脱敏
  static String blurPhone(String phone) {
    if (phone.length >= 8) {
      return '${phone.substring(0, 2)}****${phone.substring(phone.length - 2)}';
    }
    return phone;
  }
}
