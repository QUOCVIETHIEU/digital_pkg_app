import 'package:json_annotation/json_annotation.dart';

import '../../../common/models/base_model.dart';

part 'material_notification.g.dart';

@JsonSerializable()
class MaterialNotification {
  final String peopleDownload;
  @ApiDateTimeConverter()
  final DateTime datetimeCreate;
  final String sendToPeople;
  @ApiDateTimeConverter()
  final DateTime datetimeConfirm;
  final String subject;
  @ApiDateTimeConverter()
  final DateTime dateTimeSend;
  final String itemCode;
  final double quantity;
  final String lineName;
  final String unit;
  MaterialNotification({
    required this.peopleDownload,
    required this.datetimeCreate,
    required this.sendToPeople,
    required this.datetimeConfirm,
    required this.subject,
    required this.dateTimeSend,
    required this.itemCode,
    required this.quantity,
    required this.lineName,
    required this.unit,
  });
  factory MaterialNotification.fromJson(Map<String, dynamic> json) =>
      _$MaterialNotificationFromJson(json);
  Map<String, dynamic> toJson() => _$MaterialNotificationToJson(this);
}
