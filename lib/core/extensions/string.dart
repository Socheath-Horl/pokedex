extension StringX on String {
  String capitalize() {
    if (length > 0) {
      return '${this[0].toUpperCase()}${substring(1)}';
    }

    return this;
  }

  double parseDouble([double deafaultValue = 0.01]) {
    return double.tryParse(replaceAll(RegExp(r'[^0-9\.]'), '')) ??
        deafaultValue;
  }
}
