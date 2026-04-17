import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../gen/assets.gen.dart';

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
  final List<TestingStatus> status;
  final PlantStatus plantStatus;
  final String? note;

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
    required this.plantStatus,
    this.note,
  });

  factory MatrixEdi.fromJson(Map<String, dynamic> json) =>
      _$MatrixEdiFromJson(json);
  Map<String, dynamic> toJson() => _$MatrixEdiToJson(this);
}

enum TestingStatus { testing, testingFollow, testingConfirm, none }

enum PlantStatus { hmp, dop, ctp, qnp, bnp, lap, none }

extension PlantStatusExtension on PlantStatus {
  String get name => switch (this) {
    PlantStatus.hmp => 'HMP',
    PlantStatus.dop => 'DOP',
    PlantStatus.ctp => 'CTP',
    PlantStatus.qnp => 'QNP',
    PlantStatus.bnp => 'BNP',
    PlantStatus.lap => 'LAP',
    PlantStatus.none => 'Tất cả',
  };
  String get iconPath => switch (this) {
    PlantStatus.hmp => Assets.icons.common.icoCommonPlant,
    PlantStatus.dop => Assets.icons.common.icoCommonPlant,
    PlantStatus.ctp => Assets.icons.common.icoCommonPlant,
    PlantStatus.qnp => Assets.icons.common.icoCommonPlant,
    PlantStatus.bnp => Assets.icons.common.icoCommonPlant,
    PlantStatus.lap => Assets.icons.common.icoCommonPlant,
    PlantStatus.none => Assets.icons.common.icoCommonAllPlant,
  };
}

extension TestingStatusExtension on TestingStatus {
  String get name => switch (this) {
    TestingStatus.testing => 'W',
    TestingStatus.testingFollow => 'X0',
    TestingStatus.testingConfirm => 'X1',
    TestingStatus.none => '',
  };
  String get statusName => switch (this) {
    TestingStatus.testing => 'Testing',
    TestingStatus.testingFollow => 'X0',
    TestingStatus.testingConfirm => 'X1',
    TestingStatus.none => '',
  };
  String get statusDescription => switch (this) {
    TestingStatus.testing => '(đang đợi approve)',
    TestingStatus.testingFollow => '(chạy theo dõi 10 lot)',
    TestingStatus.testingConfirm => '(chạy ổn định sau 10 lot)',
    TestingStatus.none => '',
  };
  Color get color => switch (this) {
    TestingStatus.testing => AppColors.textEdi,
    TestingStatus.testingFollow => AppColors.batchColor,
    TestingStatus.testingConfirm => AppColors.batchColor,
    TestingStatus.none => AppColors.textColor,
  };
  Color get backgroundColor => switch (this) {
    TestingStatus.testing => AppColors.itemStatusTestingColor,
    TestingStatus.testingFollow => AppColors.itemStatusTestingFollowColor,
    TestingStatus.testingConfirm => AppColors.itemStatusTestingConfirmColor,
    TestingStatus.none => Colors.transparent,
  };
}

@JsonSerializable()
class MatrixEdiItem {
  final String materialCode;
  final String materialName;
  MatrixEdiItem({required this.materialCode, required this.materialName});
  factory MatrixEdiItem.fromJson(Map<String, dynamic> json) =>
      _$MatrixEdiItemFromJson(json);
  Map<String, dynamic> toJson() => _$MatrixEdiItemToJson(this);
}
