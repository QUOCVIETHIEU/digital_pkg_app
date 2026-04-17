part of 'request_manager_bloc.dart';

class RequestManagerState extends Equatable {
  final AppException? error;
  final Status status;
  final List<WorkflowTimelineItem> workflowTimelineItems;
  final ListViewConfigModel matrixEdiListViewConfig;
  const RequestManagerState({
    this.error,
    this.status = Status.loading,
    this.workflowTimelineItems = const [],
    required this.matrixEdiListViewConfig,
  });
  RequestManagerState copyWith({
    AppException? error,
    Status? status,
    List<WorkflowTimelineItem>? workflowTimelineItems,
    ListViewConfigModel? matrixEdiListViewConfig,
  }) {
    return RequestManagerState(
      error: error ?? this.error,
      status: status ?? this.status,
      workflowTimelineItems:
          workflowTimelineItems ?? this.workflowTimelineItems,
      matrixEdiListViewConfig:
          matrixEdiListViewConfig ?? this.matrixEdiListViewConfig,
    );
  }

  @override
  List<Object?> get props => [
    error,
    status,
    workflowTimelineItems,
    matrixEdiListViewConfig,
  ];
}
