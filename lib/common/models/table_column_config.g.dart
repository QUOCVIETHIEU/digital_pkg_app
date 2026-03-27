// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_column_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RangeData _$RangeDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RangeData', json, ($checkedConvert) {
      final val = RangeData(
        start: $checkedConvert('start', (v) => (v as num).toInt()),
        end: $checkedConvert('end', (v) => (v as num).toInt()),
        groupTitle: $checkedConvert('groupTitle', (v) => v as String),
        columns: $checkedConvert(
          'columns',
          (v) => (v as List<dynamic>)
              .map((e) => TableColumnConfig.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$RangeDataToJson(RangeData instance) => <String, dynamic>{
  'start': instance.start,
  'end': instance.end,
  'groupTitle': instance.groupTitle,
  'columns': instance.columns,
};

TableColumnConfig _$TableColumnConfigFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TableColumnConfig', json, ($checkedConvert) {
      final val = TableColumnConfig(
        title: $checkedConvert('title', (v) => v as String),
        width: $checkedConvert('width', (v) => (v as num).toDouble()),
        key: $checkedConvert('key', (v) => v as String),
        isCenter: $checkedConvert('isCenter', (v) => v as bool? ?? true),
        isSortable: $checkedConvert('isSortable', (v) => v as bool? ?? false),
        minWidth: $checkedConvert(
          'minWidth',
          (v) => (v as num?)?.toDouble() ?? 50.0,
        ),
        maxWidth: $checkedConvert(
          'maxWidth',
          (v) => (v as num?)?.toDouble() ?? 1000.0,
        ),
        isCanFreezed: $checkedConvert(
          'isCanFreezed',
          (v) => v as bool? ?? true,
        ),
        range: $checkedConvert(
          'range',
          (v) =>
              v == null ? null : RangeData.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TableColumnConfigToJson(TableColumnConfig instance) =>
    <String, dynamic>{
      'title': instance.title,
      'key': instance.key,
      'isCenter': instance.isCenter,
      'isSortable': instance.isSortable,
      'minWidth': instance.minWidth,
      'maxWidth': instance.maxWidth,
      'isCanFreezed': instance.isCanFreezed,
      'range': instance.range,
      'width': instance.width,
    };
