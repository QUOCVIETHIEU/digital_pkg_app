import 'package:flutter/material.dart';

import '../../../../data/workflow/models/models.dart';
import 'time_line_request_item.dart';

class RequestManagerList extends StatelessWidget {
  const RequestManagerList({super.key, required this.workflowTimelineItems});
  final List<WorkflowTimelineItem> workflowTimelineItems;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView.builder(
        itemCount: workflowTimelineItems.length,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemBuilder: (context, index) {
          return TimeLineRequestItem(
            workflowTimelineItem: workflowTimelineItems[index],
            isFirst: index == 0,
            index: index,
          );
        },
      ),
    );
  }
}
