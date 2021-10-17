import 'package:intl/intl.dart';

class CalendarHelper {
  static bool compareDates(DateTime a, DateTime b) {
    var format = DateFormat.yMMMMEEEEd().format(a);
    return DateFormat.yMMMMEEEEd().format(a).compareTo(format) == 0;
  }
}
