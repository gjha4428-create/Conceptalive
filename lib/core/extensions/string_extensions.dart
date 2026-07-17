extension StringExtensions on String {
  bool isValidEmail() {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  bool isValidUrl() {
    try {
      Uri.parse(this);
      return true;
    } catch (e) {
      return false;
    }
  }

  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String toTitleCase() {
    return split(' ').map((word) => word.capitalize()).join(' ');
  }

  bool isNumeric() {
    return RegExp(r'^-?\d+(\.\d+)?$').hasMatch(this);
  }

  String truncate(int length, {String ellipsis = '...'}) {
    if (this.length <= length) return this;
    return '${substring(0, length - ellipsis.length)}$ellipsis';
  }
}
