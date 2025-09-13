extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String toTitleCase() {
    return toLowerCase().replaceAllMapped(
        RegExp(
            r'[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+'),
        (Match match) {
      return "${match[0]![0].toUpperCase()}${match[0]!.substring(1).toLowerCase()}";
    });
  }

  String getArticle() {
    if (isEmpty) return 'a';
    final firstLetter = trim().toLowerCase()[0];
    return 'aeiou'.contains(firstLetter) ? 'an' : 'a';
  }
}
