import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

export '../../core/constants/datetime_format.dart';

class DateTimeUtils {
  static String formatDateTime(DateTime dateTime, String format) {
    return DateFormat(format).format(dateTime);
  }

  static DateTime? parseDateTime(String dateTime, List<String> formats) {
    for (var format in formats) {
      try {
        return DateFormat(format).parse(dateTime);
      } catch (e) {
        continue;
      }
    }
    return null;
  }

  static String formatDateTimeToFormat(DateTime dateTime, String format) {
    return DateFormat(format).format(dateTime);
  }

  static Future<DateTime?> showDateTimePicker(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    bool showTimePickerFlag = false,
    String? helpText,
  }) async {
    DateTime? pickedDate = await showDatePicker(
      barrierDismissible: false,
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(2100),
      helpText: helpText,
    );

    if (pickedDate != null) {
      DateTime picked = pickedDate;
      if (context.mounted && showTimePickerFlag) {
        final time = await showTimePicker(
          barrierDismissible: false,
          context: context,
          initialTime: TimeOfDay.now(),
          initialEntryMode: TimePickerEntryMode.input,
        );
        if (time == null) return null;
        picked = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          time.hour,
          time.minute,
        );
        return picked;
      }
      return pickedDate;
    }
    return null;
  }
}
