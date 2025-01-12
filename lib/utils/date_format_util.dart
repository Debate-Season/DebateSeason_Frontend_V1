import 'package:intl/intl.dart';

class DateFormatUtil {
  static String yyyyMD({required DateTime dateTime}) {
    final dateFormat = DateFormat('yyyy.M.d');
    return dateFormat.format(dateTime);
  }
}
