import 'package:intl/intl.dart';

class AppUtils {
  // Private constructor to prevent instantiation
  AppUtils._();

  /// Formats a chat timestamp to a user-friendly string
  static String formatMessageTime(String dateTimeString) {
    if (dateTimeString.isEmpty) return "";

    final messageTime = DateTime.tryParse(dateTimeString);
    if (messageTime == null) return "";

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final messageDate = DateTime(messageTime.year, messageTime.month, messageTime.day);

    if (messageDate == today) {
      // Show time only e.g., 10:30 AM
      return DateFormat.jm().format(messageTime);
    } else if (messageDate == yesterday) {
      return "Yesterday";
    } else {
      // Show date e.g., 06 Sep or 06 Sep 2024 if different year
      if (messageTime.year == now.year) {
        return DateFormat('dd MMM').format(messageTime);
      } else {
        return DateFormat('dd MMM yyyy').format(messageTime);
      }
    }
  }
}
