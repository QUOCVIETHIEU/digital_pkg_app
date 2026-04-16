import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/helpers/utils.dart';
import '../../../../common/widgets/widgets.dart';
import '../../../../core/configs/themes/app_colors.dart';
import '../../../../data/workflow/models/models.dart';
import '../../../../gen/assets.gen.dart';
import 'item_executions.dart';
import 'moc_upload_file.dart';
import 'plan_executions.dart';
import 'testing_material.dart';
import 'view_comment.dart';

class WorkFlowStepItem extends StatelessWidget {
  const WorkFlowStepItem({
    super.key,
    required this.workflowStep,
    this.isLast = false,
  });
  final WorkflowStep workflowStep;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        spacing: 10,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  SvgPicture.asset(
                    workflowStep.status.icon,
                    width: 20,
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        workflowStep.stepName,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        workflowStep.stepDescription,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: AppColors.workFlowTextUpComing,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 8,
                children: [
                  Text(
                    DateTimeUtils.formatDateTime(
                      workflowStep.stepDatetime,
                      DateTimeFormat.dateTimeWithPipeFormat,
                    ),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColors.workFlowTextDescription,
                    ),
                  ),
                  Text(
                    workflowStep.stepPeople,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColors.workFlowTextDescription,
                    ),
                  ),
                ],
              ),
            ],
          ),
          workflowStep.status == WorkflowStepStatus.confirmRequest ||
                  workflowStep.status == WorkflowStepStatus.confirmDoc ||
                  workflowStep.status == WorkflowStepStatus.confirmExecution ||
                  workflowStep.status == WorkflowStepStatus.qcConfirm ||
                  workflowStep.status == WorkflowStepStatus.globalResult
              ? _buildButtonViewConfirm(context)
              : _buildButton(context),

          if (!isLast) const Divider(),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Row(
      children: [
        IRectangleButton(
          leading: SvgPicture.asset(
            workflowStep.status.buttonIcon,
            width: 10,
            height: 10,
          ),
          title: workflowStep.status.buttonStepName,
          fontSize: 10,
          fontWeight: FontWeight.w500,
          backgroundColor: AppColors.workFlowButtonBackgroundColor,
          textColor: AppColors.primary,
          outlineColor: AppColors.workFlowButtonBackgroundColor,
          enableVerticalDivider: false,
          buttonPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          height: 30,
          onPressed: () => workflowStep.status == WorkflowStepStatus.testRequest
              ? _showStepDetailDialog(context)
              : workflowStep.status == WorkflowStepStatus.itemExecutions
              ? _showItemExecutionsDialog(context)
              : workflowStep.status == WorkflowStepStatus.planExecution
              ? _showPlanExecutionsDialog(context)
              : workflowStep.status == WorkflowStepStatus.updateDoc ||
                    workflowStep.status == WorkflowStepStatus.qcResult ||
                    workflowStep.status == WorkflowStepStatus.globalUpload
              ? _showUpdateDocDialog(context)
              : null,
        ),
      ],
    );
  }

  Widget _buildButtonViewConfirm(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          height: 30,
          decoration: BoxDecoration(
            color: AppColors.workFlowBackgroundColorDone,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: AppColors.workFlowBorderColorDone,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 6,
            children: [
              SvgPicture.asset(
                workflowStep.status.buttonTitleConfirmIcon,
                width: 10,
                height: 10,
              ),
              Text(
                workflowStep.status.buttonTitleConfirm,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.workFlowTextDone,
                ),
              ),
            ],
          ),
        ),
        IRectangleButton(
          leading: SvgPicture.asset(
            Assets.icons.common.icoCommonComment,
            width: 10,
            height: 10,
          ),
          title: 'View comment',
          fontSize: 8,
          fontWeight: FontWeight.w600,
          backgroundColor: AppColors.workFlowBorderColorUpComing,
          textColor: AppColors.textColor,
          outlineColor: AppColors.workFlowTextDescription,
          enableVerticalDivider: false,
          buttonPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          height: 30,
          onPressed: () {
            _showCommentDialog(context);
          },
        ),
      ],
    );
  }

  void _showStepDetailDialog(BuildContext context) {
    final itemTesting = workflowStep.itemTesting;
    IDialog.showDialogLeft(
      context: context,
      content: TestingMaterial(itemTesting: itemTesting),
    );
  }

  void _showItemExecutionsDialog(BuildContext context) {
    IDialog.showDialogLeft(
      context: context,
      content: ItemExecutions(itemInformation: workflowStep.itemInformation!),
    );
  }

  void _showPlanExecutionsDialog(BuildContext context) {
    IDialog.showDialogLeft(
      context: context,
      content: PlanExecutions(
        materialNotification: workflowStep.materialNotification,
      ),
    );
  }

  void _showUpdateDocDialog(BuildContext context) {
    IDialog.showDialogLeft(
      context: context,
      content: MocUploadFile(
        documentMaterial: workflowStep.documentMaterial!,
        status: workflowStep.status,
      ),
    );
  }

  void _showCommentDialog(BuildContext context) {
    IDialog.showCommonDialog(
      context: context,
      barrierDismissible: false,
      content: ViewComment(comment: workflowStep.viewComment ?? ''),
    );
  }
}
