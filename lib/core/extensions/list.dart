extension ListExtension<T> on List<T>? {
  T? getAtIndexOrNull(int index) =>
      this != null && index < this!.length ? this![index] : null;
  T? firstWhereOrNull(bool Function(T) test) {
    for (var element in this ?? []) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}
