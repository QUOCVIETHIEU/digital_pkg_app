import 'package:json_annotation/json_annotation.dart';

import '../../../common/models/base_model.dart';
import 'models.dart';

part 'item_information.g.dart';

@JsonSerializable()
class ItemInformation {
  final String peopleDownload;
  @ApiDateTimeConverter()
  final DateTime dateTimeCreate;
  final String itemCode;
  final String itemName;
  final String? note;
  final List<BatchItem> batchItems;
  ItemInformation({
    required this.itemCode,
    required this.itemName,
    required this.note,
    required this.batchItems,
    required this.peopleDownload,
    required this.dateTimeCreate,
  });

  factory ItemInformation.fromJson(Map<String, dynamic> json) =>
      _$ItemInformationFromJson(json);
  Map<String, dynamic> toJson() => _$ItemInformationToJson(this);
}
