import 'package:intl/intl.dart';

class AppDateUtils {
  static DateTime firstDateOfWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  static DateTime lastDateOfWeek(DateTime dateTime) {
    return dateTime
        .add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  static List<DateTime> getDaysInWeek(DateTime dateTime) {
    var days = List<DateTime>.filled(7, DateTime.fromMillisecondsSinceEpoch(0));
    var firstDay = firstDateOfWeek(dateTime);
    for (var i = 0; i <= 6; i++) {
      days[i] = firstDay.add(Duration(days: i));
    }
    return days;
  }
}

extension DateExtension on DateTime {
  String toFormatString(String format) => DateFormat(format).format(this);

  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }
}
