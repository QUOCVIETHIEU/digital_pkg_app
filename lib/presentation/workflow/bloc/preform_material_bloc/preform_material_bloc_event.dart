part of 'preform_material_bloc_bloc.dart';

sealed class PreformMaterialBlocEvent extends Equatable {
  const PreformMaterialBlocEvent();

  @override
  List<Object?> get props => [];
}

class PreformMaterialBlocEventLoadRequested extends PreformMaterialBlocEvent {
  final List<MatrixEdi>? matrixEdiList;
  const PreformMaterialBlocEventLoadRequested({required this.matrixEdiList});
  @override
  List<Object?> get props => [matrixEdiList];
}

class FilterMaterialStatus extends PreformMaterialBlocEvent {
  final PlantStatus plantStatus;
  const FilterMaterialStatus(this.plantStatus);
  @override
  List<Object?> get props => [plantStatus];
}

class SearchMaterialStatus extends PreformMaterialBlocEvent {
  final String searchQuery;
  const SearchMaterialStatus(this.searchQuery);
  @override
  List<Object?> get props => [searchQuery];
}
