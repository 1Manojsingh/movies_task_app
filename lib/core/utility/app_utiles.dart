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

  static String getDuration(int? runtime) {
    if (runtime == null) return 'Unknown';
    final hours = runtime ~/ 60;
    final minutes = runtime % 60;
    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }
    return '${minutes}m';
  }

  static String formatDate(String? date) {
    if (date == null || date.isEmpty) return 'Unknown';
    try {
      final DateTime parsedDate = DateTime.parse(date);
      return '${parsedDate.day}/${parsedDate.month}/${parsedDate.year}';
    } catch (e) {
      return date;
    }
  }

  static String getYear(String? date) {
    if (date == null || date.isEmpty) return '';
    try {
      final DateTime parsedDate = DateTime.parse(date);
      return parsedDate.year.toString();
    } catch (e) {
      // Fallback to substring if parsing fails
      return date.length >= 4 ? date.substring(0, 4) : '';
    }
  }

}