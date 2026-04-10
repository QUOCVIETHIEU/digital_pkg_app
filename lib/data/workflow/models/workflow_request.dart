import 'package:equatable/equatable.dart';

import '../../../common/models/models.dart';

enum WorkflowRequestType { primary, secondary }

class WorkflowRequest extends Equatable implements Exportable {
  final String id;
  final String requestId;
  final WorkflowRequestType type;
  final String itemCodeTesting;
  final String itemCodeSapUpdate;
  final String itemName;
  final String category;
  final String quantity;
  final String plantNameRunTrials;
  final String requestDatetime;
  final String globalApproveDatetime;
  final String qcmApproveDatetime;
  final String shortRunDatetime;

  const WorkflowRequest({
    required this.id,
    required this.requestId,
    required this.type,
    required this.itemCodeTesting,
    required this.itemCodeSapUpdate,
    required this.itemName,
    required this.category,
    required this.quantity,
    required this.plantNameRunTrials,
    required this.requestDatetime,
    required this.globalApproveDatetime,
    required this.qcmApproveDatetime,
    required this.shortRunDatetime,
  });

  factory WorkflowRequest.empty() {
    return const WorkflowRequest(
      id: '',
      requestId: '',
      type: WorkflowRequestType.primary,
      itemCodeTesting: '',
      itemCodeSapUpdate: '',
      itemName: '',
      category: '',
      quantity: '',
      plantNameRunTrials: '',
      requestDatetime: '',
      globalApproveDatetime: '',
      qcmApproveDatetime: '',
      shortRunDatetime: '',
    );
  }

  WorkflowRequest copyWith({
    String? id,
    String? requestId,
    WorkflowRequestType? type,
    String? itemCodeTesting,
    String? itemCodeSapUpdate,
    String? itemName,
    String? category,
    String? quantity,
    String? plantNameRunTrials,
    String? requestDatetime,
    String? globalApproveDatetime,
    String? qcmApproveDatetime,
    String? shortRunDatetime,
  }) {
    return WorkflowRequest(
      id: id ?? this.id,
      requestId: requestId ?? this.requestId,
      type: type ?? this.type,
      itemCodeTesting: itemCodeTesting ?? this.itemCodeTesting,
      itemCodeSapUpdate: itemCodeSapUpdate ?? this.itemCodeSapUpdate,
      itemName: itemName ?? this.itemName,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      plantNameRunTrials: plantNameRunTrials ?? this.plantNameRunTrials,
      requestDatetime: requestDatetime ?? this.requestDatetime,
      globalApproveDatetime:
          globalApproveDatetime ?? this.globalApproveDatetime,
      qcmApproveDatetime: qcmApproveDatetime ?? this.qcmApproveDatetime,
      shortRunDatetime: shortRunDatetime ?? this.shortRunDatetime,
    );
  }

  String getValueByColumn(int columnIndex) {
    switch (columnIndex) {
      case 1:
        return requestId;
      case 2:
        return type.name;
      case 3:
        return itemCodeTesting;
      case 4:
        return itemCodeSapUpdate;
      case 5:
        return itemName;
      case 6:
        return category;
      case 7:
        return quantity;
      case 8:
        return plantNameRunTrials;
      case 9:
        return requestDatetime;
      case 10:
        return globalApproveDatetime;
      case 11:
        return qcmApproveDatetime;
      case 12:
        return shortRunDatetime;
      default:
        return '';
    }
  }

  @override
  List<Object?> get props => [
    id,
    requestId,
    type,
    itemCodeTesting,
    itemCodeSapUpdate,
    itemName,
    category,
    quantity,
    plantNameRunTrials,
    requestDatetime,
    globalApproveDatetime,
    qcmApproveDatetime,
    shortRunDatetime,
  ];

  @override
  List<Object> toExportData(int index) {
    // TODO: implement toExportData
    throw UnimplementedError();
  }
}
