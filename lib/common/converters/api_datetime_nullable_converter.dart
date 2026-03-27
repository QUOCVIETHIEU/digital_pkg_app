import 'package:json_annotation/json_annotation.dart';

class ApiDateTimeNullableConverter
    implements JsonConverter<DateTime?, String?> {
  const ApiDateTimeNullableConverter();

  @override
  DateTime? fromJson(String? json) {
    if (json == null || json.isEmpty) return null;
    return DateTime.parse(
      '${json.substring(0, 4)}-'
      '${json.substring(4, 6)}-'
      '${json.substring(6, 8)}T'
      '${json.substring(8, 10)}:'
      '${json.substring(10, 12)}:'
      '${json.substring(12, 14)}',
    );
  }

  @override
  String? toJson(DateTime? object) {
    if (object == null) return null;
    return object.year.toString().padLeft(4, '0') +
        object.month.toString().padLeft(2, '0') +
        object.day.toString().padLeft(2, '0') +
        object.hour.toString().padLeft(2, '0') +
        object.minute.toString().padLeft(2, '0') +
        object.second.toString().padLeft(2, '0');
  }
}
