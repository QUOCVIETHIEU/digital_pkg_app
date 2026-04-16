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
  final MaterialNotification? materialNotification;
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
    this.materialNotification,
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
    WorkflowStepStatus.updateDoc => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.confirmDoc => Assets.icons.common.icoCommonConfirmStep,
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
    WorkflowStepStatus.planExecution => 'Xem kế hoạch',
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
  String get buttonIcon => switch (this) {
    WorkflowStepStatus.testRequest => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.confirmRequest => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.updateDoc => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.confirmDoc => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.itemExecutions => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.planExecution => Assets.icons.drawers.icoDrawerPlan,
    WorkflowStepStatus.confirmExecution => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.qcResult => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.qcConfirm => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.globalUpload => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.globalResult => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.pkgUpload => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.pkgResult => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.qcmInformation => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.qcmResult => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.qcMatrix => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.matrixNotification => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.itemCodeMaterial => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.itemCodeBom => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.itemCodeUpdated => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.shortRun => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.shortRunInformation =>
      Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.shortRunResult => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.massProductionSummary =>
      Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.massProductionNotification =>
      Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.failed => Assets.icons.actions.icoActionFile,
  };
  String get buttonStepName => switch (this) {
    WorkflowStepStatus.testRequest => 'Xem thông tin item',
    WorkflowStepStatus.confirmRequest => 'Xem thông tin item',
    WorkflowStepStatus.updateDoc => 'Xem files upload',
    WorkflowStepStatus.confirmDoc => 'Xem thông tin item',
    WorkflowStepStatus.itemExecutions => 'Xem thông tin item',
    WorkflowStepStatus.planExecution => 'Xem kế hoạch',
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
