part of 'request_manager_bloc.dart';

class RequestManagerState extends Equatable {
  final AppException? error;
  final Status status;
  final List<WorkflowTimelineItem> workflowTimelineItems;
  const RequestManagerState({
    this.error,
    this.status = Status.loading,
    this.workflowTimelineItems = const [],
  });
  RequestManagerState copyWith({
    AppException? error,
    Status? status,
    List<WorkflowTimelineItem>? workflowTimelineItems,
  }) {
    return RequestManagerState(
      error: error ?? this.error,
      status: status ?? this.status,
      workflowTimelineItems:
          workflowTimelineItems ?? this.workflowTimelineItems,
    );
  }

  @override
  List<Object?> get props => [error, status, workflowTimelineItems];
}
