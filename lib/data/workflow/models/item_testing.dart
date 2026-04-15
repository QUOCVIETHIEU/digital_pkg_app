import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../common/models/base_model.dart';

part 'item_testing.g.dart';

@JsonSerializable()
class ItemTesting extends Equatable {
  final String peopleCreate;
  @ApiDateTimeConverter()
  final DateTime datetimeCreate;
  final String product;
  final double netContent;
  final List<String> trial;
  final double weight;
  final String supplier;
  final double cav;
  final String unit;
  final String typeColor;
  final String resinCodeSupplier;
  final String gasVolume;
  final String closureType;
  final double closureWeight;
  final String closureColor;
  final String closureSupplier;
  final String closureLine;
  final String additive;
  final String note;
  const ItemTesting({
    required this.peopleCreate,
    required this.datetimeCreate,
    required this.product,
    required this.netContent,
    required this.trial,
    required this.weight,
    required this.supplier,
    required this.cav,
    required this.unit,
    required this.typeColor,
    required this.resinCodeSupplier,
    required this.gasVolume,
    required this.closureType,
    required this.closureWeight,
    required this.closureColor,
    required this.closureSupplier,
    required this.closureLine,
    required this.additive,
    required this.note,
  });

  ItemTesting copyWith({
    String? product,
    double? netContent,
    List<String>? trial,
    double? weight,
    String? supplier,
    double? cav,
    String? unit,
    String? typeColor,
    String? resinCodeSupplier,
    String? gasVolume,
    String? closureType,
    double? closureWeight,
    String? closureColor,
    String? closureSupplier,
    String? closureLine,
    String? additive,
    String? note,
    String? peopleCreate,
    DateTime? datetimeCreate,
  }) {
    return ItemTesting(
      peopleCreate: peopleCreate ?? this.peopleCreate,
      datetimeCreate: datetimeCreate ?? this.datetimeCreate,
      product: product ?? this.product,
      netContent: netContent ?? this.netContent,
      trial: trial ?? this.trial,
      weight: weight ?? this.weight,
      supplier: supplier ?? this.supplier,
      cav: cav ?? this.cav,
      unit: unit ?? this.unit,
      typeColor: typeColor ?? this.typeColor,
      resinCodeSupplier: resinCodeSupplier ?? this.resinCodeSupplier,
      gasVolume: gasVolume ?? this.gasVolume,
      closureType: closureType ?? this.closureType,
      closureWeight: closureWeight ?? this.closureWeight,
      closureColor: closureColor ?? this.closureColor,
      closureSupplier: closureSupplier ?? this.closureSupplier,
      closureLine: closureLine ?? this.closureLine,
      additive: additive ?? this.additive,
      note: note ?? this.note,
    );
  }

  factory ItemTesting.fromJson(Map<String, dynamic> json) =>
      _$ItemTestingFromJson(json);
  Map<String, dynamic> toJson() => _$ItemTestingToJson(this);

  @override
  List<Object?> get props => [
    product,
    netContent,
    trial,
    weight,
    supplier,
    cav,
    unit,
    typeColor,
    resinCodeSupplier,
    gasVolume,
    closureType,
    closureWeight,
    closureColor,
    closureSupplier,
    closureLine,
    additive,
    note,
    peopleCreate,
    datetimeCreate,
  ];
}
