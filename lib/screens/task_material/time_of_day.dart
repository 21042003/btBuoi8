import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TimeOfDayExtensions on TimeOfDay{
  String formatTimeOfDay() {
    final now = DateTime.now();

    final dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    final format = DateFormat.jm();
    return format.format(dateTime);
  }
}