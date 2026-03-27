import 'package:json_annotation/json_annotation.dart';

class ApiDateTimeConverter implements JsonConverter<DateTime, String> {
  const ApiDateTimeConverter();

  @override
  DateTime fromJson(String json) {
    if (json.isEmpty) {
      throw const FormatException('Empty string cannot be parsed to DateTime');
    }
    // Parse 'yyyyMMddHHmmss' to DateTime
    return DateTime.parse(
      '${json.substring(0, 4)}-' // year
      '${json.substring(4, 6)}-' // month
      '${json.substring(6, 8)}T' // day
      '${json.substring(8, 10)}:' // hour
      '${json.substring(10, 12)}:' // minute
      '${json.substring(12, 14)}', // second
    );
  }

  @override
  String toJson(DateTime object) {
    // Format DateTime to 'yyyyMMddHHmmss'
    return object.year.toString().padLeft(4, '0') +
        object.month.toString().padLeft(2, '0') +
        object.day.toString().padLeft(2, '0') +
        object.hour.toString().padLeft(2, '0') +
        object.minute.toString().padLeft(2, '0') +
        object.second.toString().padLeft(2, '0');
  }
}
