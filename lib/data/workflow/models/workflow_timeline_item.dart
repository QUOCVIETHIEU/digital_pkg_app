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
  final String requestApprovePeople;
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
    required this.requestApprovePeople,
  });

  WorkflowTimelineItem copyWith({
    String? stepName,
    String? stepDescription,
    String? titleRequest,
    String? requestDescription,
    String? requestPeople,
    String? requestApprovePeople,
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
      requestApprovePeople: requestApprovePeople ?? this.requestApprovePeople,
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
    requestApprovePeople,
  ];
}

enum WorkflowTimelineItemStatus { upComing, inProgress, done, failed }

extension WorkflowTimelineItemStatusExtension on WorkflowTimelineItemStatus {
  String get name => switch (this) {
    WorkflowTimelineItemStatus.upComing => 'Upcoming',
    WorkflowTimelineItemStatus.inProgress => 'In Progress',
    WorkflowTimelineItemStatus.done => 'Done',
    WorkflowTimelineItemStatus.failed => 'Failed',
  };
  Color get color => switch (this) {
    WorkflowTimelineItemStatus.upComing => AppColors.workFlowTimeLineInProgress,
    WorkflowTimelineItemStatus.inProgress =>
      AppColors.workFlowTimeLineInProgress,
    WorkflowTimelineItemStatus.done => AppColors.workFlowTimeLineCompleted,
    WorkflowTimelineItemStatus.failed => AppColors.errorColor,
  };
  String get icon => switch (this) {
    WorkflowTimelineItemStatus.upComing =>
      Assets.icons.actions.icoActionWorkflowError,
    WorkflowTimelineItemStatus.inProgress =>
      Assets.icons.actions.icoActionWorkflowError,
    WorkflowTimelineItemStatus.done =>
      Assets.icons.actions.icoActionWorkflowCompleted,
    WorkflowTimelineItemStatus.failed =>
      Assets.icons.actions.icoActionWorkflowError,
  };
  Color get borderColor => switch (this) {
    WorkflowTimelineItemStatus.upComing =>
      AppColors.workFlowBorderColorUpComing,
    WorkflowTimelineItemStatus.inProgress =>
      AppColors.workFlowBorderColorInProgress,
    WorkflowTimelineItemStatus.done => AppColors.workFlowBorderColorDone,
    WorkflowTimelineItemStatus.failed => AppColors.workFlowBorderColorFailed,
  };
  Color get backgroundColor => switch (this) {
    WorkflowTimelineItemStatus.upComing =>
      AppColors.workFlowBackgroundColorUpComing,
    WorkflowTimelineItemStatus.inProgress =>
      AppColors.workFlowBackgroundColorInProgress,
    WorkflowTimelineItemStatus.done => AppColors.workFlowBackgroundColorDone,
    WorkflowTimelineItemStatus.failed =>
      AppColors.workFlowBackgroundColorFailed,
  };
}
