import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../common/models/listview_config_model.dart';

class ListViewConfigConverter extends TypeConverter<ListViewConfigModel, String>
    with JsonTypeConverter2<ListViewConfigModel, String, Map<String, dynamic>> {
  const ListViewConfigConverter();

  @override
  ListViewConfigModel fromSql(String fromDb) {
    return fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(ListViewConfigModel value) {
    return jsonEncode(toJson(value));
  }

  @override
  ListViewConfigModel fromJson(Map<String, dynamic> json) {
    return ListViewConfigModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ListViewConfigModel value) {
    return value.toJson();
  }
}
