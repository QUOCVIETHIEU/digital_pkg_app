import 'package:json_annotation/json_annotation.dart';

part 'batch_item.g.dart';

@JsonSerializable()
class BatchItem {
  final String batchLot;
  final double quantity;
  final String? note;
  BatchItem({
    required this.batchLot,
    required this.quantity,
    required this.note,
  });

  factory BatchItem.fromJson(Map<String, dynamic> json) =>
      _$BatchItemFromJson(json);
  Map<String, dynamic> toJson() => _$BatchItemToJson(this);
}
