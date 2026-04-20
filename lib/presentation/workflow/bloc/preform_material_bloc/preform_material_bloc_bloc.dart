import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tableview2/tableview2.dart';

import '../../../../common/helpers/utils.dart';
import '../../../../common/models/models.dart';
import '../../../../core/configs/listview/listview_config.dart';
import '../../../../core/constants/constants.dart';
import '../../../../data/workflow/models/models.dart';

part 'preform_material_bloc_event.dart';
part 'preform_material_bloc_state.dart';

class PreformMaterialBlocBloc
    extends Bloc<PreformMaterialBlocEvent, PreformMaterialBlocState> {
  PreformMaterialBlocBloc()
    : super(
        PreformMaterialBlocState(
          listViewConfig: ListViewConfigProvider
              .configs[ListViewConfigName.matrixEdi.name]!,
        ),
      ) {
    on<PreformMaterialBlocEventLoadRequested>(_onLoadRequested);
    on<FilterMaterialStatus>(_onFilterMaterialStatus);
    on<SearchMaterialStatus>(
      _onSearchMaterialStatus,
      transformer: (events, mapper) =>
          events.debounceTime(AppConfigs.debounceTime).switchMap(mapper),
    );
  }

  Future<void> _onLoadRequested(
    PreformMaterialBlocEventLoadRequested event,
    Emitter<PreformMaterialBlocState> emit,
  ) async {
    List<MatrixEdi> matrixEdiList = event.matrixEdiList ?? [];
    emit(
      state.copyWith(
        matrixEdiList: matrixEdiList,
        matrixEdiListOriginal: matrixEdiList,
      ),
    );
  }

  Future<void> _onFilterMaterialStatus(
    FilterMaterialStatus event,
    Emitter<PreformMaterialBlocState> emit,
  ) async {
    List<MatrixEdi> filteredMatrixEdiList = [];
    filteredMatrixEdiList =
        SearchUtils.filterListBySearchAndStatus<MatrixEdi, PlantStatus>(
          items: state.matrixEdiListOriginal,
          search: state.searchQuery,
          getSearchableFields: (m) => [
            m.size.toString(),
            m.unit,
            m.type,
            m.line,
            m.weight.toString(),
            m.unitWeight,
            m.supplier,
            m.resin,
            m.itemCode,
            m.mold,
          ],
          statusFilter: event.plantStatus,
          noneValue: PlantStatus.none,
          getStatus: (m) => m.plantStatus,
        );
    emit(
      state.copyWith(
        matrixEdiList: filteredMatrixEdiList,
        status: Status.filtered,
        plantStatus: event.plantStatus,
      ),
    );
  }

  Future<void> _onSearchMaterialStatus(
    SearchMaterialStatus event,
    Emitter<PreformMaterialBlocState> emit,
  ) async {
    final searchQuery = event.searchQuery;
    List<MatrixEdi> filteredMatrixEdiList = [];
    filteredMatrixEdiList =
        SearchUtils.filterListBySearchAndStatus<MatrixEdi, PlantStatus>(
          items: state.matrixEdiListOriginal,
          search: searchQuery,
          getSearchableFields: (m) => [
            m.size.toString(),
            m.line,
            m.unit,
            m.type,
            m.weight.toString(),
            m.unitWeight,
            m.supplier,
            m.resin,
            m.itemCode,
            m.mold,
          ],
          statusFilter: state.plantStatus,
          noneValue: PlantStatus.none,
          getStatus: (m) => m.plantStatus,
        );
    emit(
      state.copyWith(
        searchQuery: event.searchQuery,
        status: Status.search,
        matrixEdiList: filteredMatrixEdiList,
      ),
    );
  }
}
