import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/helpers/utils.dart';
import '../../../../common/widgets/widgets.dart';
import '../../../../core/configs/themes/app_colors.dart';
import '../../../../data/workflow/models/models.dart';
import '../../../../gen/assets.gen.dart';

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
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        workflowStep.stepDescription,
                        style: TextStyle(
                          fontSize: 13,
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
          workflowStep.status == WorkflowStepStatus.confirmRequest
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
            Assets.icons.actions.icoActionFile,
            width: 10,
            height: 10,
          ),
          title: 'Xem thông tin item',
          fontSize: 10,
          fontWeight: FontWeight.w500,
          backgroundColor: AppColors.workFlowButtonBackgroundColor,
          textColor: AppColors.primary,
          outlineColor: AppColors.workFlowButtonBackgroundColor,
          enableVerticalDivider: false,
          buttonPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          height: 30,
          onPressed: () {},
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
          width: 80,
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
                Assets.icons.drawers.icoDrawerFile,
                width: 10,
                height: 10,
              ),
              Text(
                'Created',
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
          onPressed: () {},
        ),
      ],
    );
  }
}
