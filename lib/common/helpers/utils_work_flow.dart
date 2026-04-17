import '../../data/workflow/models/models.dart';

class UtilsWorkFlow {
  static bool isShowButtonConfirm(WorkflowStepStatus workflowStep) {
    return switch (workflowStep) {
      WorkflowStepStatus.confirmRequest => true,
      WorkflowStepStatus.confirmDoc => true,
      WorkflowStepStatus.confirmExecution => true,
      WorkflowStepStatus.qcConfirm => true,
      WorkflowStepStatus.globalResult => true,
      WorkflowStepStatus.pkgResult => true,
      WorkflowStepStatus.qcmResult => true,
      WorkflowStepStatus.matrixNotification => true,
      WorkflowStepStatus.itemCodeConfirm => true,
      _ => false,
    };
  }

  static bool isShowStepDetailDialog(WorkflowStepStatus workflowStep) {
    return switch (workflowStep) {
      WorkflowStepStatus.testRequest => true,
      _ => false,
    };
  }

  static bool isShowItemExecutionsDialog(WorkflowStepStatus workflowStep) {
    return switch (workflowStep) {
      WorkflowStepStatus.itemExecutions => true,
      _ => false,
    };
  }

  static bool isShowPlanExecutionsDialog(WorkflowStepStatus workflowStep) {
    return switch (workflowStep) {
      WorkflowStepStatus.planExecution => true,
      WorkflowStepStatus.qcmInformation => true,
      _ => false,
    };
  }

  static bool isShowUpdateDocDialog(WorkflowStepStatus workflowStep) {
    return switch (workflowStep) {
      WorkflowStepStatus.updateDoc => true,
      WorkflowStepStatus.qcResult => true,
      WorkflowStepStatus.globalUpload => true,
      WorkflowStepStatus.pkgUpload => true,
      _ => false,
    };
  }

  static bool isShowMatrixMaterialDialog(WorkflowStepStatus workflowStep) {
    return switch (workflowStep) {
      WorkflowStepStatus.qcMatrix => true,
      _ => false,
    };
  }
}
