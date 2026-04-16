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
  final MatrixEdi? matrixEdi;
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
    this.matrixEdi,
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
      Assets.icons.common.icoCommonConfirmStep,
    WorkflowStepStatus.qcResult => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.qcConfirm => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.globalUpload => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.globalResult =>
      Assets.icons.drawers.icoDrawerApprovalGlobal,
    WorkflowStepStatus.pkgUpload => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.pkgResult =>
      Assets.icons.drawers.icoDrawerApprovalGlobal,
    WorkflowStepStatus.qcmInformation => Assets.icons.common.icoCommonDoneStep,
    WorkflowStepStatus.qcmResult =>
      Assets.icons.drawers.icoDrawerApprovalGlobal,
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

  String get buttonIcon => switch (this) {
    WorkflowStepStatus.testRequest => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.confirmRequest => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.updateDoc => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.confirmDoc => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.itemExecutions => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.planExecution => Assets.icons.drawers.icoDrawerPlan,
    WorkflowStepStatus.confirmExecution => Assets.icons.drawers.icoDrawerPlan,
    WorkflowStepStatus.qcResult => Assets.icons.drawers.icoDrawerEyesResult,
    WorkflowStepStatus.qcConfirm => Assets.icons.drawers.icoDrawerEyesResult,
    WorkflowStepStatus.globalUpload => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.globalResult => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.pkgUpload => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.pkgResult => Assets.icons.actions.icoActionFile,
    WorkflowStepStatus.qcmInformation =>
      Assets.icons.drawers.icoDrawerEyesResult,
    WorkflowStepStatus.qcmResult => Assets.icons.drawers.icoDrawerEyesResult,
    WorkflowStepStatus.qcMatrix => Assets.icons.drawers.icoDrawerMatrix,
    WorkflowStepStatus.matrixNotification =>
      Assets.icons.drawers.icoDrawerMatrix,
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
    WorkflowStepStatus.qcResult => 'Xem kết quả',
    WorkflowStepStatus.qcConfirm => 'Xem kết quả',
    WorkflowStepStatus.globalUpload => 'Global upload files',
    WorkflowStepStatus.globalResult => 'Global upload files',
    WorkflowStepStatus.pkgUpload => 'Xem files upload',
    WorkflowStepStatus.pkgResult => 'Xem files upload',
    WorkflowStepStatus.qcmInformation => 'Xem thông tin',
    WorkflowStepStatus.qcmResult => 'Xem thông tin',
    WorkflowStepStatus.qcMatrix => 'Xem matrix',
    WorkflowStepStatus.matrixNotification => 'Xem matrix',
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
  String get buttonTitleConfirm => switch (this) {
    WorkflowStepStatus.testRequest => 'Created',
    WorkflowStepStatus.confirmRequest => 'Created',
    WorkflowStepStatus.updateDoc => 'Uploaded',
    WorkflowStepStatus.confirmDoc => 'Uploaded',
    WorkflowStepStatus.itemExecutions => 'Confirmed',
    WorkflowStepStatus.planExecution => 'Confirmed',
    WorkflowStepStatus.confirmExecution => 'Confirmed',
    WorkflowStepStatus.qcResult => 'Passed',
    WorkflowStepStatus.qcConfirm => 'Passed',
    WorkflowStepStatus.globalUpload => 'Approved',
    WorkflowStepStatus.globalResult => 'Approved',
    WorkflowStepStatus.pkgUpload => 'Approved',
    WorkflowStepStatus.pkgResult => 'Approved',
    WorkflowStepStatus.qcmInformation => 'Approved',
    WorkflowStepStatus.qcmResult => 'Approved',
    WorkflowStepStatus.qcMatrix => 'Đã gửi mail',
    WorkflowStepStatus.matrixNotification => 'Đã gửi mail',
    WorkflowStepStatus.itemCodeMaterial => 'Xác nhận',
    WorkflowStepStatus.itemCodeBom => 'Xác nhận',
    WorkflowStepStatus.itemCodeUpdated => 'Xác nhận',
    WorkflowStepStatus.shortRun => 'Xác nhận',
    WorkflowStepStatus.shortRunInformation => 'Xác nhận',
    WorkflowStepStatus.shortRunResult => 'Xác nhận',
    WorkflowStepStatus.massProductionSummary => 'Xác nhận',
    WorkflowStepStatus.massProductionNotification => 'Xác nhận',
    WorkflowStepStatus.failed => 'Xác nhận',
  };
  String get buttonTitleConfirmIcon => switch (this) {
    WorkflowStepStatus.testRequest => Assets.icons.drawers.icoDrawerFile,
    WorkflowStepStatus.confirmRequest => Assets.icons.drawers.icoDrawerFile,
    WorkflowStepStatus.updateDoc => Assets.icons.drawers.icoDrawerCompleted,
    WorkflowStepStatus.confirmDoc => Assets.icons.drawers.icoDrawerCompleted,
    WorkflowStepStatus.itemExecutions => Assets.icons.drawers.icoDrawerFile,
    WorkflowStepStatus.planExecution => Assets.icons.drawers.icoDrawerFile,
    WorkflowStepStatus.confirmExecution => Assets.icons.drawers.icoDrawerFile,
    WorkflowStepStatus.qcResult => Assets.icons.drawers.icoDrawerQcResult,
    WorkflowStepStatus.qcConfirm => Assets.icons.drawers.icoDrawerQcResult,
    WorkflowStepStatus.globalUpload => Assets.icons.drawers.icoDrawerGlobal,
    WorkflowStepStatus.globalResult => Assets.icons.drawers.icoDrawerGlobal,
    WorkflowStepStatus.pkgUpload => Assets.icons.drawers.icoDrawerGlobal,
    WorkflowStepStatus.pkgResult => Assets.icons.drawers.icoDrawerGlobal,
    WorkflowStepStatus.qcmInformation => Assets.icons.drawers.icoDrawerGlobal,
    WorkflowStepStatus.qcmResult => Assets.icons.drawers.icoDrawerGlobal,
    WorkflowStepStatus.qcMatrix => Assets.icons.drawers.icoDrawerEmail,
    WorkflowStepStatus.matrixNotification =>
      Assets.icons.drawers.icoDrawerEmail,
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
}
