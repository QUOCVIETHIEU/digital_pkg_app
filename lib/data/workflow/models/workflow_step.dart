import 'package:json_annotation/json_annotation.dart';

import '../../../common/models/models.dart';
import 'models.dart';

part 'workflow_step.g.dart';

@JsonSerializable()
class WorkflowStep {
  final String stepName;
  final String stepDescription;
  final String stepPeople;
  @ApiDateTimeConverter()
  final DateTime stepDatetime;
  final WorkflowStepStatus status;
  final String? viewComment;
  final ItemTesting? itemTesting;
  final DocumentMaterial? documentMaterial;
  final ItemInformation? itemInformation;
  const WorkflowStep({
    required this.stepName,
    required this.stepDescription,
    required this.stepPeople,
    required this.stepDatetime,
    this.viewComment,
    this.itemTesting,
    this.documentMaterial,
    this.itemInformation,
    required this.status,
  });

  factory WorkflowStep.fromJson(Map<String, dynamic> json) =>
      _$WorkflowStepFromJson(json);
  Map<String, dynamic> toJson() => _$WorkflowStepToJson(this);
}

enum WorkflowStepStatus {
  testRequest,
  confirmRequest,
  updateDoc,
  confirmDoc,
  itemExecutions,
  planExecution,
  confirmExecution,
  qcResult,
  qcConfirm,
  globalUpload,
  globalResult,
  pkgUpload,
  pkgResult,
  qcmInformation,
  qcmResult,
  qcMatrix,
  matrixNotification,
  itemCodeMaterial,
  itemCodeBom,
  itemCodeUpdated,
  shortRun,
  shortRunInformation,
  shortRunResult,
  massProductionSummary,
  massProductionNotification,
  failed,
}
