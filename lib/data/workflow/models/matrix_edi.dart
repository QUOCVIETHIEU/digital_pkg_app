import 'package:json_annotation/json_annotation.dart';

part 'matrix_edi.g.dart';

@JsonSerializable()
class MatrixEdi {
  final String line;
  final double size;
  final String unit;
  final String type;
  final double weight;
  final String unitWeight;
  final String supplier;
  final String resin;
  final String itemCode;
  final String mold;
  final String itemName;
  final List<MatrixEdiItem> items;
  final EdiStatus status;

  MatrixEdi({
    required this.line,
    required this.size,
    required this.unit,
    required this.type,
    required this.weight,
    required this.unitWeight,
    required this.supplier,
    required this.resin,
    required this.itemCode,
    required this.mold,
    required this.itemName,
    required this.items,
    required this.status,
  });

  factory MatrixEdi.fromJson(Map<String, dynamic> json) =>
      _$MatrixEdiFromJson(json);
  Map<String, dynamic> toJson() => _$MatrixEdiToJson(this);
}

enum EdiStatus { pending, approved, rejected }

@JsonSerializable()
class MatrixEdiItem {
  final String materialCode;
  final String materialName;
  MatrixEdiItem({required this.materialCode, required this.materialName});
  factory MatrixEdiItem.fromJson(Map<String, dynamic> json) =>
      _$MatrixEdiItemFromJson(json);
  Map<String, dynamic> toJson() => _$MatrixEdiItemToJson(this);
}
