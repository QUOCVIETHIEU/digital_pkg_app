import 'package:digital_pkg_system/presentation/workflow/widgets/request_manager/timeline_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/widgets/widgets.dart';
import '../../../../core/configs/themes/app_colors.dart';
import '../../../../data/workflow/models/models.dart';
import '../../../../gen/assets.gen.dart';

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
                        WorkflowTimelineItemStatus.completed
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isFirst
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: _buildHeaderRequest(),
                      )
                    : _buildHeaderRequest(),
              ],
            ),
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
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.workFlowTextStepName,
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

  Widget _buildHeaderRequest() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(
          workflowTimelineItem.titleRequest,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.workFlowTextStepName,
            fontSize: 16,
          ),
        ),
        Text(
          workflowTimelineItem.requestDescription,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.workFlowTextDescription,
            fontSize: 14,
          ),
        ),
        IRichTextValue(
          label: 'Người thực hiện',
          value: workflowTimelineItem.requestPeople,
          fontSizeValue: 14,
        ),
        IRichTextValue(
          label: 'Pic',
          value: workflowTimelineItem.requestPic,
          fontSizeValue: 14,
        ),
      ],
    );
  }

  Widget _buildBodyRequest() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [],
    );
  }
}
