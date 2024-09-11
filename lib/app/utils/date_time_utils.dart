import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatDDmmYY(DateTime dateTime) {
    final dateFormat = DateFormat('dd/MM/yy');
    final dateAsString = dateFormat.format(dateTime);
    return dateAsString;
  }

  static String getFormattedDate(Timestamp? timestamp) {
    var timestampAsDate = timestamp?.toDate() ?? DateTime.now();
    return DateTimeUtils.formatDDmmYY(timestampAsDate);
  }
}