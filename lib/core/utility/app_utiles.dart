class AppUtils {

  static String? emailValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // static String simpleFormatDate(DateTime? date) {
  //   if (date == null) return '';
  //   return DateFormat('dd MMM').format(date);
  // }

}