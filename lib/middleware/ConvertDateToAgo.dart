import 'package:intl/intl.dart';

class TimePassedCalculator {
  static String calculateTimePassed(DateTime startDate) {
    final now = DateTime.now();
    final difference = now.difference(startDate);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} saniye önce';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} dakika önce';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} saat önce';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} gün önce';
    } else {
      final formatter = DateFormat.yMMMMd(); // Ay, gün, yıl formatı
      return 'Tarih: ${formatter.format(startDate)}';
    }
  }
}
