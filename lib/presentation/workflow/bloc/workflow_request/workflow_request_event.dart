part of 'workflow_request_bloc.dart';

abstract class WorkflowRequestEvent extends Equatable {
  const WorkflowRequestEvent();
  @override
  List<Object?> get props => [];
}

class WorkflowRequestLoadRequested extends WorkflowRequestEvent {
  final String processOrder;
  const WorkflowRequestLoadRequested(this.processOrder);
  @override
  List<Object?> get props => [processOrder];
}

class WorkflowRequestSearchRequested extends WorkflowRequestEvent {
  final String query;
  const WorkflowRequestSearchRequested(this.query);
  @override
  List<Object?> get props => [query];
}

class WorkflowRequestDeleted extends WorkflowRequestEvent {
  final WorkflowRequest material;
  const WorkflowRequestDeleted(this.material);
  @override
  List<Object?> get props => [material];
}

class WorkflowRequestSelectedChanged extends WorkflowRequestEvent {
  final WorkflowRequest material;
  const WorkflowRequestSelectedChanged(this.material);
  @override
  List<Object?> get props => [material];
}

class WorkflowRequestSortRequested extends WorkflowRequestEvent {
  final int columnIndex;
  final bool ascending;
  const WorkflowRequestSortRequested(this.columnIndex, this.ascending);
  @override
  List<Object?> get props => [columnIndex, ascending];
}

class WorkflowRequestExportRequested extends WorkflowRequestEvent {
  const WorkflowRequestExportRequested();
  @override
  List<Object?> get props => [];
}

class WorkflowRequestListViewConfigUpdated extends WorkflowRequestEvent {
  final ListViewConfigName name;
  final TableColumnConfig newConfig;
  final bool isFixed;
  const WorkflowRequestListViewConfigUpdated(
    this.name,
    this.newConfig,
    this.isFixed,
  );
  @override
  List<Object> get props => [name, newConfig, isFixed];
}

class WorkflowRequestConfirm extends WorkflowRequestEvent {
  final List<WorkflowRequest> allMaterials;
  const WorkflowRequestConfirm(this.allMaterials);
  @override
  List<Object?> get props => [allMaterials];
}

class UpdateWorkflowRequest extends WorkflowRequestEvent {
  final List<WorkflowRequest> allMaterials;
  const UpdateWorkflowRequest(this.allMaterials);
  @override
  List<Object?> get props => [allMaterials];
}

class AddWorkflowRequest extends WorkflowRequestEvent {
  final WorkflowRequest request;
  const AddWorkflowRequest(this.request);
  @override
  List<Object?> get props => [request];
}

