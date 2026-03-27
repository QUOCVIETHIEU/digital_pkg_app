import 'models.dart';

class RecipeMaterialTableRow implements Model, Exportable {
  final int index;
  final int groupNo;
  final int sequence;
  final int mixingTime;
  final String itemCode;
  final String? itemName;
  final double quantity;
  final String unit;
  final String? unitReal;
  final int? packCount;
  final String mixerTank;
  final String station;
  final String note;

  RecipeMaterialTableRow({
    required this.index,
    required this.groupNo,
    required this.sequence,
    required this.mixingTime,
    required this.itemCode,
    required this.itemName,
    required this.quantity,
    required this.unit,
    required this.unitReal,
    required this.packCount,
    required this.mixerTank,
    required this.station,
    required this.note,
  });

  @override
  String getValueByColumn(int columnIndex) {
    switch (columnIndex) {
      case 0:
        return id;
      case 1:
        return groupNo.toString();
      case 2:
        return sequence.toString();
      case 3:
        return mixingTime.toString();
      case 4:
        return itemCode;
      case 5:
        return itemName ?? '';
      case 6:
        return unitReal ?? '';
      case 7:
        return quantity.toString();
      case 8:
        return packCount?.toString() ?? '';
      case 9:
        return station;
      case 10:
        return mixerTank;
      case 11:
        return note;
      default:
        return '';
    }
  }

  @override
  String get id => itemCode;

  @override
  List<Object> toExportData(int index) {
    return [
      index + 1,
      groupNo,
      sequence,
      mixingTime,
      itemCode,
      itemName ?? '',
      unitReal ?? '',
      quantity,
      packCount ?? '---',
      station,
      mixerTank,
      note,
    ];
  }
}
