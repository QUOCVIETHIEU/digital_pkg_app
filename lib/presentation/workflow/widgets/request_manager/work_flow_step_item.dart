import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/helpers/utils.dart';
import '../../../../common/widgets/widgets.dart';
import '../../../../core/configs/themes/app_colors.dart';
import '../../../../data/workflow/models/models.dart';
import '../../../../gen/assets.gen.dart';
import '../../../bloc.dart';
import 'bom_information.dart';
import 'item_code_sap.dart';
import 'item_executions.dart';
import 'matrix_material.dart';
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
        spacing: 2,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: SvgPicture.asset(
                      workflowStep.status.icon,
                      width: 16,
                      height: 16,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            workflowStep.stepName,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            workflowStep.stepDescription,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              color: AppColors.workFlowTextUpComing,
                            ),
                          ),
                        ],
                      ),
                      UtilsWorkFlow.isShowButtonConfirm(workflowStep.status)
                          ? _buildButtonViewConfirm(context)
                          : _buildButton(context),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 4,
                children: [
                  Text(
                    DateTimeUtils.formatDateTime(
                      workflowStep.stepDatetime,
                      DateTimeFormat.dateTimeWithPipeFormat,
                    ),
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      color: AppColors.workFlowTextDescription,
                    ),
                  ),
                  Text(
                    workflowStep.stepPeople,
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      color: AppColors.workFlowTextDescription,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (!isLast)
            const Divider(
              color: AppColors.workFlowBorderColorUpComing,
              thickness: 0.7,
            ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        IRectangleButton(
          leading: SvgPicture.asset(
            workflowStep.status.buttonIcon,
            width: 8,
            height: 8,
          ),
          title: workflowStep.status.buttonStepName,
          fontSize: 8,
          fontWeight: FontWeight.w500,
          backgroundColor: AppColors.workFlowButtonBackgroundColor,
          textColor: AppColors.primary,
          outlineColor: AppColors.workFlowButtonBackgroundColor,
          enableVerticalDivider: false,
          buttonPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          height: 22,
          onPressed: () => _handlePrimaryAction(context),
        ),
        if (workflowStep.status == WorkflowStepStatus.itemCodeMaterial)
          IRectangleButton(
            leading: SvgPicture.asset(
              Assets.icons.drawers.icoDrawerMatrix,
              width: 8,
              height: 8,
            ),
            title: 'Xem matrix update',
            fontSize: 8,
            fontWeight: FontWeight.w500,
            backgroundColor: AppColors.workFlowButtonMatrix,
            textColor: AppColors.primary,
            outlineColor: AppColors.workFlowButtonMatrix,
            enableVerticalDivider: false,
            buttonPadding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),

            height: 22,
            onPressed: () {
              _handleSecondaryAction(context);
            },
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
          height: 22,
          decoration: BoxDecoration(
            color: AppColors.workFlowBackgroundColorDone,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: AppColors.workFlowBorderColorDone,
              width: 0.8,
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
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  color: AppColors.workFlowTextDone,
                ),
              ),
            ],
          ),
        ),
        if (workflowStep.viewComment?.isNotEmpty ?? false)
          IRectangleButton(
            leading: SvgPicture.asset(
              Assets.icons.common.icoCommonComment,
              width: 8,
              height: 8,
            ),
            title: 'View comment',
            fontSize: 8,
            fontWeight: FontWeight.w600,
            backgroundColor: AppColors.workFlowBorderColorUpComing,
            textColor: AppColors.textColor,
            outlineColor: AppColors.workFlowTextDescription,
            enableVerticalDivider: false,
            buttonPadding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),

            height: 22,
            onPressed: () {
              _showCommentDialog(context);
            },
          ),
      ],
    );
  }

  void _handlePrimaryAction(BuildContext context) {
    final status = workflowStep.status;
    if (UtilsWorkFlow.isShowStepDetailDialog(status)) {
      _showStepDetailDialog(context);
      return;
    }
    if (UtilsWorkFlow.isShowItemExecutionsDialog(status)) {
      _showItemExecutionsDialog(context);
      return;
    }
    if (UtilsWorkFlow.isShowPlanExecutionsDialog(status)) {
      _showPlanExecutionsDialog(context);
      return;
    }
    if (UtilsWorkFlow.isShowUpdateDocDialog(status)) {
      _showUpdateDocDialog(context);
      return;
    }
    if (UtilsWorkFlow.isShowMatrixMaterialDialog(status)) {
      _showMatrixMaterialDialog(
        context,
        isHeader: status == WorkflowStepStatus.itemCodeMaterial,
      );
      return;
    }
    if (UtilsWorkFlow.isShowAddItemCodeSapDialog(status)) {
      _showAddItemCodeSapDialog(context);
      return;
    }
    if (UtilsWorkFlow.isShowBomInformationDialog(status)) {
      _showBomInformationDialog(context);
      return;
    }
  }

  void _handleSecondaryAction(BuildContext context) {
    final status = workflowStep.status;
    if (UtilsWorkFlow.isShowViewMatrixMaterialDialog(status)) {
      _showMatrixMaterialDialog(
        context,
        isHeader: status == WorkflowStepStatus.itemCodeMaterial,
      );
      return;
    }
  }

  void _showStepDetailDialog(BuildContext context) {
    final itemTesting = workflowStep.itemTesting;
    IDialog.showDialogLeft(
      context: context,
      content: TestingMaterial(itemTesting: itemTesting),
    );
  }

  void _showAddItemCodeSapDialog(BuildContext context) {
    final matrixEdi = workflowStep.matrixEdi;
    IDialog.showDialogLeft(
      context: context,
      content: ItemCodeSap(matrixEdi: matrixEdi),
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
      content: PlanExecutions(workflowStep: workflowStep),
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

  void _showMatrixMaterialDialog(
    BuildContext context, {
    bool isHeader = false,
  }) {
    IDialog.showDialogLeft(
      context: context,
      content: BlocProvider.value(
        value: context.read<RequestManagerBloc>(),
        child: MatrixMaterial(workflowStep: workflowStep, isHeader: isHeader),
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

  void _showBomInformationDialog(BuildContext context) {
    IDialog.showDialogLeft(context: context, content: BomInformation());
  }
}
