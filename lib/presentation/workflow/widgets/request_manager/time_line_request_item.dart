import 'package:digital_pkg_system/presentation/workflow/widgets/request_manager/timeline_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/widgets/widgets.dart';
import '../../../../core/configs/themes/app_colors.dart';
import '../../../../data/workflow/models/models.dart';
import '../../../../gen/assets.gen.dart';
import 'work_flow_step_list.dart';

class TimeLineRequestItem extends StatelessWidget {
  const TimeLineRequestItem({
    super.key,
    required this.workflowTimelineItem,
    required this.isFirst,
    required this.index,
  });
  final WorkflowTimelineItem workflowTimelineItem;
  final bool isFirst;
  final int index;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 30,
        children: [
          Expanded(
            flex: 1,
            child: isFirst
                ? Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: _buildHeaderStep(context),
                  )
                : _buildHeaderStep(context),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (isFirst) TimelineLine(minHeight: 20),
              Container(
                height: 35,
                width: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: workflowTimelineItem.status.color,
                    width: 4.5,
                  ),
                ),
                child:
                    workflowTimelineItem.status ==
                        WorkflowTimelineItemStatus.done
                    ? SvgPicture.asset(
                        Assets.icons.actions.icoActionWorkflowCompleted,
                        width: 15,
                        height: 15,
                      )
                    : null,
              ),
              Expanded(child: TimelineLine(minHeight: 0)),
            ],
          ),
          Expanded(
            flex: 5,
            child: isFirst
                ? Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: _buildRequest(),
                  )
                : _buildRequest(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderStep(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 6,
      children: [
        Text(
          '${index < 9 ? '0${index + 1}' : index + 1} - ${workflowTimelineItem.stepName}',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.workFlowTextStepName,
            fontSize: 14,
          ),
        ),
        Text(
          workflowTimelineItem.stepDescription,
          style: TextStyle(
            color: AppColors.workFlowTextDescription,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildRequest() {
    return Column(
      spacing: 12,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  workflowTimelineItem.titleRequest,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.workFlowTextStepName,
                    fontSize: 14,
                  ),
                ),
                Text(
                  workflowTimelineItem.requestDescription,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.workFlowTextDescription,
                    fontSize: 12,
                  ),
                ),
                IRichTextValue(
                  label: 'Người thực hiện',
                  value: workflowTimelineItem.requestPeople,
                  fontSizeValue: 12,
                ),
                IRichTextValue(
                  label: 'Pic',
                  value: workflowTimelineItem.requestPic,
                  fontSizeValue: 12,
                ),
              ],
            ),
            Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: workflowTimelineItem.status.backgroundColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: workflowTimelineItem.status.borderColor,
                  width: 0.8,
                ),
              ),
              child: Center(
                child: Text(
                  workflowTimelineItem.status.name,
                  style: TextStyle(
                    color: workflowTimelineItem.status.color,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
        WorkFlowStepList(workflowSteps: workflowTimelineItem.workflowStep),
      ],
    );
  }
}
