import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatDDmmYY(DateTime dateTime) {
    final dateFormat = DateFormat('dd/MM/yy');
    final dateAsString = dateFormat.format(dateTime);
    return dateAsString;
  }
}