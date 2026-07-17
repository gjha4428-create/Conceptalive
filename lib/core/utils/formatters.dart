import 'package:intl/intl.dart';

class Formatters {
  static String formatCurrency(double amount, {String symbol = '\$'}) {
    final formatter = NumberFormat('#,##0.00', 'en_US');
    return '$symbol${formatter.format(amount)}';
  }

  static String formatDate(DateTime date, {String format = 'MMM d, y'}) {
    final formatter = DateFormat(format);
    return formatter.format(date);
  }

  static String formatTime(DateTime time, {String format = 'hh:mm a'}) {
    final formatter = DateFormat(format);
    return formatter.format(time);
  }

  static String formatDateTime(DateTime dateTime, {String format = 'MMM d, y - hh:mm a'}) {
    final formatter = DateFormat(format);
    return formatter.format(dateTime);
  }

  static String formatPhoneNumber(String phoneNumber) {
    final digits = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.length == 10) {
      return '(${digits.substring(0, 3)}) ${digits.substring(3, 6)}-${digits.substring(6)}';
    }
    return phoneNumber;
  }

  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(2)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }

  static String formatNumber(num number) {
    final formatter = NumberFormat('#,##0.##', 'en_US');
    return formatter.format(number);
  }

  static String capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  static String formatRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else {
      return formatDate(dateTime);
    }
  }
}
