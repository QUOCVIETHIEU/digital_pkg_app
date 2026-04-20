part of 'preform_material_bloc_bloc.dart';

class PreformMaterialBlocState extends Equatable {
  final AppException? error;
  final Status status;
  final ListViewConfigModel listViewConfig;
  final List<MatrixEdi> matrixEdiList;
  final List<MatrixEdi> matrixEdiListOriginal;
  final String searchQuery;
  final PlantStatus plantStatus;
  const PreformMaterialBlocState({
    this.error,
    this.status = Status.initial,
    required this.listViewConfig,
    this.matrixEdiList = const [],
    this.matrixEdiListOriginal = const [],
    this.searchQuery = '',
    this.plantStatus = PlantStatus.none,
  });
  PreformMaterialBlocState copyWith({
    AppException? error,
    Status? status,
    ListViewConfigModel? listViewConfig,
    List<MatrixEdi>? matrixEdiList,
    List<MatrixEdi>? matrixEdiListOriginal,
    String? searchQuery,
    PlantStatus? plantStatus,
  }) {
    return PreformMaterialBlocState(
      error: error ?? this.error,
      status: status ?? this.status,
      listViewConfig: listViewConfig ?? this.listViewConfig,
      matrixEdiList: matrixEdiList ?? this.matrixEdiList,
      matrixEdiListOriginal:
          matrixEdiListOriginal ?? this.matrixEdiListOriginal,
      searchQuery: searchQuery ?? this.searchQuery,
      plantStatus: plantStatus ?? this.plantStatus,
    );
  }

  @override
  List<Object?> get props => [
    error,
    status,
    listViewConfig,
    matrixEdiList,
    matrixEdiListOriginal,
    searchQuery,
    plantStatus,
  ];
}
