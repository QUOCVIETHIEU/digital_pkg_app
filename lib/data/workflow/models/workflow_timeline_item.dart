import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../gen/assets.gen.dart';
import 'workflow_step.dart';

part 'workflow_timeline_item.g.dart';

@JsonSerializable()
class WorkflowTimelineItem extends Equatable {
  final String stepName;
  final String stepDescription;
  final String titleRequest;
  final String requestDescription;
  final String requestPeople;
  final String requestPic;
  final WorkflowTimelineItemStatus status;
  final List<WorkflowStep> workflowStep;

  const WorkflowTimelineItem({
    required this.stepName,
    required this.stepDescription,
    required this.titleRequest,
    required this.requestDescription,
    required this.requestPeople,
    required this.requestPic,
    required this.status,
    required this.workflowStep,
  });

  WorkflowTimelineItem copyWith({
    String? stepName,
    String? stepDescription,
    String? titleRequest,
    String? requestDescription,
    String? requestPeople,
    String? requestPic,
    WorkflowTimelineItemStatus? status,
    List<WorkflowStep>? workflowStep,
  }) {
    return WorkflowTimelineItem(
      stepName: stepName ?? this.stepName,
      stepDescription: stepDescription ?? this.stepDescription,
      titleRequest: titleRequest ?? this.titleRequest,
      requestDescription: requestDescription ?? this.requestDescription,
      requestPeople: requestPeople ?? this.requestPeople,
      requestPic: requestPic ?? this.requestPic,
      status: status ?? this.status,
      workflowStep: workflowStep ?? this.workflowStep,
    );
  }

  factory WorkflowTimelineItem.fromJson(Map<String, dynamic> json) =>
      _$WorkflowTimelineItemFromJson(json);
  Map<String, dynamic> toJson() => _$WorkflowTimelineItemToJson(this);

  @override
  List<Object?> get props => [
    stepName,
    stepDescription,
    titleRequest,
    requestDescription,
    requestPeople,
    requestPic,
    status,
    workflowStep,
  ];
}

enum WorkflowTimelineItemStatus { pending, inProgress, completed, failed }

extension WorkflowTimelineItemStatusExtension on WorkflowTimelineItemStatus {
  String get name => switch (this) {
    WorkflowTimelineItemStatus.pending => 'Pending',
    WorkflowTimelineItemStatus.inProgress => 'In Progress',
    WorkflowTimelineItemStatus.completed => 'Completed',
    WorkflowTimelineItemStatus.failed => 'Failed',
  };
  Color get color => switch (this) {
    WorkflowTimelineItemStatus.pending => AppColors.workFlowTimeLineInProgress,
    WorkflowTimelineItemStatus.inProgress =>
      AppColors.workFlowTimeLineInProgress,
    WorkflowTimelineItemStatus.completed => AppColors.workFlowTimeLineCompleted,
    WorkflowTimelineItemStatus.failed => AppColors.errorColor,
  };
  String get icon => switch (this) {
    WorkflowTimelineItemStatus.pending =>
      Assets.icons.actions.icoActionWorkflowError,
    WorkflowTimelineItemStatus.inProgress =>
      Assets.icons.actions.icoActionWorkflowError,
    WorkflowTimelineItemStatus.completed =>
      Assets.icons.actions.icoActionWorkflowCompleted,
    WorkflowTimelineItemStatus.failed =>
      Assets.icons.actions.icoActionWorkflowError,
  };
}
