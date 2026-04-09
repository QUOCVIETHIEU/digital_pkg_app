part of 'workflow_request_bloc.dart';

class WorkflowRequestState extends Equatable {
  final List<WorkflowRequest> originalMaterials;
  final List<WorkflowRequest> allMaterials;
  final WorkflowRequest? selectedMaterial;
  final String searchQuery;
  final Status status;
  final ListViewConfigModel listViewConfig;
  final int? sortColumnIndex;
  final bool sortAscending;
  final String filePath;
  final AppException? error;
  const WorkflowRequestState({
    this.selectedMaterial,
    this.allMaterials = const [],
    this.originalMaterials = const [],
    this.status = Status.loading,
    required this.listViewConfig,
    this.sortColumnIndex,
    this.sortAscending = true,
    this.filePath = '',
    this.error,
    this.searchQuery = '',
  });

  WorkflowRequestState copyWith({
    List<WorkflowRequest>? allMaterials,
    List<WorkflowRequest>? originalMaterials,
    WorkflowRequest? selectedMaterial,
    Status? status,
    ListViewConfigModel? listViewConfig,
    int? sortColumnIndex,
    bool? sortAscending,
    String? filePath,
    AppException? error,
    String? searchQuery,
  }) {
    return WorkflowRequestState(
      allMaterials: allMaterials ?? this.allMaterials,
      originalMaterials: originalMaterials ?? this.originalMaterials,
      selectedMaterial: selectedMaterial ?? this.selectedMaterial,
      status: status ?? this.status,
      listViewConfig: listViewConfig ?? this.listViewConfig,
      sortColumnIndex: sortColumnIndex ?? this.sortColumnIndex,
      sortAscending: sortAscending ?? this.sortAscending,
      filePath: filePath ?? this.filePath,
      error: error ?? this.error,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [
    allMaterials,
    originalMaterials,
    status,
    listViewConfig,
    selectedMaterial,
    sortColumnIndex,
    sortAscending,
    filePath,
    error,
    searchQuery,
  ];
}
