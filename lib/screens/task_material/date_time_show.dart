import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  DateTime get startOfWeek{
    return subtract(Duration(days: weekday -1 ));
  }

  DateTime get endOfWeek {
    return add(Duration(days: 7 - weekday));
  }

  DateTime get nextWeek {
    return  add(const Duration(days: 7));
  }

  DateTime get previousWeek {
    return  subtract(const Duration(days: 7));
  }

  List<DateTime> get daysPerWeek {
    final DateTime firstDay = startOfWeek;
    return List<DateTime>.generate(
        7,
        (int index) => firstDay.add(Duration(days: index)));
  }
  String displayDateString({
    String format = 'dd MMM',
}) {
    final  dateFormat = DateFormat(format);
    return dateFormat.format(this);
  }

  String displayDaysString(){
    return DateFormat('dd').format(this);
  }

  String displayWeekdayString(){
    return DateFormat('E').format(this);
  }
}

