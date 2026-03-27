import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../common/converters/api_datetime_converter.dart';
import '../../../../common/converters/api_datetime_nullable_converter.dart';

export '../converters/api_datetime_converter.dart';
export '../converters/api_datetime_nullable_converter.dart';

part 'base_model.g.dart';

abstract class Model {
  String get id;
  String getValueByColumn(int columnIndex);
}

@JsonSerializable()
class BaseModel extends Equatable {
  @JsonKey(name: "statusName", defaultValue: '')
  final String statusName;
  @JsonKey(name: "note", defaultValue: '')
  final String note;
  @JsonKey(name: "userCreatedId", defaultValue: '')
  final String userCreatedId;
  @JsonKey(name: "userCreatedFullName", defaultValue: '')
  final String userCreatedFullName;
  @ApiDateTimeConverter()
  @JsonKey(name: "createdDatetime", defaultValue: DateTime.now)
  final DateTime createdDatetime;
  @JsonKey(name: "userDeActiveId")
  final String? userDeActiveId;
  @JsonKey(name: "userDeActiveFullName")
  final String? userDeActiveFullName;
  @ApiDateTimeNullableConverter()
  @JsonKey(name: "deActiveDatetime")
  final DateTime? deActiveDatetime;

  const BaseModel({
    required this.statusName,
    required this.note,
    required this.userCreatedId,
    required this.userCreatedFullName,
    required this.createdDatetime,
    required this.userDeActiveId,
    required this.userDeActiveFullName,
    required this.deActiveDatetime,
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);
  Map<String, dynamic> toJson() => _$BaseModelToJson(this);
  @override
  List<Object?> get props => [
    statusName,
    note,
    userCreatedId,
    userCreatedFullName,
    createdDatetime,
    userDeActiveId,
    userDeActiveFullName,
    deActiveDatetime,
  ];
}
