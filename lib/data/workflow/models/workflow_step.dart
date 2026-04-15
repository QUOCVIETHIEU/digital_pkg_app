import 'package:json_annotation/json_annotation.dart';

import '../../../common/models/models.dart';
import '../../../gen/assets.gen.dart';
import 'models.dart';

part 'workflow_step.g.dart';

@JsonSerializable()
class WorkflowStep {
  final String stepName;
  final String stepDescription;
  final String? stepPic;
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
    this.stepPic,
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

extension WorkflowStepStatusExtension on WorkflowStepStatus {
  String get icon => switch (this) {
    WorkflowStepStatus.testRequest => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.confirmRequest =>
      Assets.icons.common.icoCommonConfirmStep,
    WorkflowStepStatus.updateDoc => Assets.icons.common.icoActionEdit,
    WorkflowStepStatus.confirmDoc => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.itemExecutions => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.planExecution => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.confirmExecution =>
      Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.qcResult => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.qcConfirm => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.globalUpload => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.globalResult => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.pkgUpload => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.pkgResult => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.qcmInformation => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.qcmResult => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.qcMatrix => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.matrixNotification =>
      Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.itemCodeMaterial =>
      Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.itemCodeBom => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.itemCodeUpdated => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.shortRun => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.shortRunInformation =>
      Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.shortRunResult => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.massProductionSummary =>
      Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.massProductionNotification =>
      Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.failed => Assets.icons.common.icoCommonDoneStep,
  };
  String get buttonTitle => switch (this) {
    WorkflowStepStatus.testRequest => 'Xem thông tin item',
    WorkflowStepStatus.confirmRequest => 'Xem thông tin item',
    WorkflowStepStatus.updateDoc => 'Xem thông tin item',
    WorkflowStepStatus.confirmDoc => 'Xem thông tin item',
    WorkflowStepStatus.itemExecutions => 'Xem thông tin item',
    WorkflowStepStatus.planExecution => 'Xem thông tin item',
    WorkflowStepStatus.confirmExecution => 'Xem thông tin item',
    WorkflowStepStatus.qcResult => 'Xem thông tin item',
    WorkflowStepStatus.qcConfirm => 'Xem thông tin item',
    WorkflowStepStatus.globalUpload => 'Xem thông tin item',
    WorkflowStepStatus.globalResult => 'Xem thông tin item',
    WorkflowStepStatus.pkgUpload => 'Xem thông tin item',
    WorkflowStepStatus.pkgResult => 'Xem thông tin item',
    WorkflowStepStatus.qcmInformation => 'Xem thông tin item',
    WorkflowStepStatus.qcmResult => 'Xem thông tin item',
    WorkflowStepStatus.qcMatrix => 'Xem thông tin item',
    WorkflowStepStatus.matrixNotification => 'Xem thông tin item',
    WorkflowStepStatus.itemCodeMaterial => 'Xem thông tin item',
    WorkflowStepStatus.itemCodeBom => 'Xem thông tin item',
    WorkflowStepStatus.itemCodeUpdated => 'Xem thông tin item',
    WorkflowStepStatus.shortRun => 'Xem thông tin item',
    WorkflowStepStatus.shortRunInformation => 'Xem thông tin item',
    WorkflowStepStatus.shortRunResult => 'Xem thông tin item',
    WorkflowStepStatus.massProductionSummary => 'Xem thông tin item',
    WorkflowStepStatus.massProductionNotification => 'Xem thông tin item',
    WorkflowStepStatus.failed => 'Xem thông tin item',
  };
}
