import 'package:json_annotation/json_annotation.dart';

import '../../../common/models/base_model.dart';

part 'material_notification.g.dart';

@JsonSerializable()
class MaterialNotification {
  final String title;
  final String peopleDownload;
  @ApiDateTimeConverter()
  final DateTime datetimeCreate;
  final String sendToPeople;
  final String subject;
  final String peopleHeader;
  final String content;
  final String itemCode;
  final double quantity;
  final String lineName;
  final String unit;
  MaterialNotification({
    required this.peopleDownload,
    required this.datetimeCreate,
    required this.sendToPeople,
    required this.peopleHeader,
    required this.subject,
    required this.content,
    required this.itemCode,
    required this.quantity,
    required this.lineName,
    required this.unit,
    required this.title,
  });
  factory MaterialNotification.fromJson(Map<String, dynamic> json) =>
      _$MaterialNotificationFromJson(json);
  Map<String, dynamic> toJson() => _$MaterialNotificationToJson(this);
}
