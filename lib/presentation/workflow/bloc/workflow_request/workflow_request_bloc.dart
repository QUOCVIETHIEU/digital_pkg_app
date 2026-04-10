import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tableview2/tableview2.dart';

import '../../../../common/helpers/utils.dart';
import '../../../../common/models/models.dart';
import '../../../../core/configs/listview/listview_config.dart';
import '../../../../core/constants/constants.dart';
import '../../../../data/workflow/models/workflow_request.dart';
import '../../../../domain/database/repositories/app_database.dart';
import '../../../../service_locator.dart';

part 'workflow_request_event.dart';
part 'workflow_request_state.dart';

class WorkflowRequestBloc
    extends Bloc<WorkflowRequestEvent, WorkflowRequestState> {
  WorkflowRequestBloc()
    : super(
        WorkflowRequestState(
          listViewConfig:
              ListViewConfigProvider.configs[ListViewConfigName.request.name]!,
        ),
      ) {
    on<WorkflowRequestLoadRequested>(_onLoadRequested);
    on<WorkflowRequestSelectedChanged>(_onSelectedMaterialReconcileChanged);
    on<WorkflowRequestSortRequested>(_onSortRequested);
    on<WorkflowRequestSearchRequested>(
      _onSearchRequested,
      transformer: (events, mapper) =>
          events.debounceTime(AppConfigs.debounceTime).switchMap(mapper),
    );
    on<WorkflowRequestExportRequested>(_onExportRequested);
    on<WorkflowRequestListViewConfigUpdated>(_onListViewConfigUpdated);
    on<WorkflowRequestConfirm>(_onConfirmConfirmed);
    on<UpdateWorkflowRequest>(_onUpdateMaterialReconcile);
    on<AddWorkflowRequest>(_onAddRequested);
  }

  Future<void> _onLoadRequested(
    WorkflowRequestLoadRequested event,
    Emitter<WorkflowRequestState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final listViewConfig = await sl<AppDatabaseRepository>()
          .getListViewConfig(ListViewConfigName.request.name);

      final allMaterials = List.generate(20, (index) {
        final id = (20 - index).toString().padLeft(3, '0');
        return WorkflowRequest(
          id: index.toString(),
          requestId: 'RQT20261203-$id',
          type: index % 3 == 0
              ? WorkflowRequestType.primary
              : (index % 2 == 0
                    ? WorkflowRequestType.primary
                    : WorkflowRequestType.secondary),
          itemCodeTesting: '2000000${(index % 2) + 1}',
          itemCodeSapUpdate: index == 0 ? '---' : '20000${500 + index}',
          itemName: 'Revi Dry Baboo F14033-Sodi Benz17174MSB ${index + 1}',
          category: index % 4 == 0
              ? 'Can'
              : (index % 4 == 1 ? 'End' : (index % 4 == 2 ? 'Tray' : 'Carton')),
          quantity: '${(index + 1) * 1000 + 222}',
          plantNameRunTrials: ['DOP', 'QNP', 'BNP', 'LAP', 'CTP'][index % 5],
          requestDatetime: '14:12:20 14/05/2026',
          globalApproveDatetime: index % 5 == 0 ? '---' : '15:30:45 15/05/2026',
          qcmApproveDatetime: index % 3 == 0 ? '---' : '10:00:20 16/05/2026',
          shortRunDatetime: index % 2 == 0 ? '---' : '09:45:10 17/05/2026',
        );
      });
      final List<WorkflowRequest> filtered = SearchUtils.filterListBySearch(
        items: allMaterials,
        search: state.searchQuery,
        getSearchableFields: (m) => [
          m.requestId,
          m.type.name,
          m.itemCodeTesting,
          m.itemCodeSapUpdate,
          m.itemName,
          m.category,
          m.quantity,
          m.plantNameRunTrials,
          m.requestDatetime,
          m.globalApproveDatetime,
          m.qcmApproveDatetime,
          m.shortRunDatetime,
        ],
      );
      emit(
        state.copyWith(
          originalMaterials: allMaterials,
          allMaterials: filtered,
          status: Status.loaded,
          listViewConfig: listViewConfig,
        ),
      );
    } on AppException catch (e) {
      emit(state.copyWith(status: Status.error, error: e));
    }
  }

  FutureOr<void> _onSelectedMaterialReconcileChanged(
    WorkflowRequestSelectedChanged event,
    Emitter<WorkflowRequestState> emit,
  ) {
    emit(
      state.copyWith(selectedMaterial: event.material, status: Status.selected),
    );
  }

  void _onSortRequested(
    WorkflowRequestSortRequested event,
    Emitter<WorkflowRequestState> emit,
  ) {
    state.allMaterials.sort((a, b) {
      final aValue = a.getValueByColumn(event.columnIndex);
      final bValue = b.getValueByColumn(event.columnIndex);
      final aNum = double.tryParse(aValue);
      final bNum = double.tryParse(bValue);
      int result;
      if (aNum != null && bNum != null) {
        result = aNum.compareTo(bNum);
      } else {
        result = aValue.compareTo(bValue);
      }
      return event.ascending ? result : -result;
    });

    final List<WorkflowRequest> filtered = SearchUtils.filterListBySearch(
      items: state.originalMaterials,
      search: state.searchQuery,
      getSearchableFields: (m) => [
        m.requestId,
        m.type.name,
        m.itemCodeTesting,
        m.itemCodeSapUpdate,
        m.itemName,
        m.category,
        m.quantity,
        m.plantNameRunTrials,
        m.requestDatetime,
        m.globalApproveDatetime,
        m.qcmApproveDatetime,
        m.shortRunDatetime,
      ],
    );
    emit(
      state.copyWith(
        allMaterials: filtered,
        status: Status.sorted,
        sortColumnIndex: event.columnIndex,
        sortAscending: event.ascending,
      ),
    );
  }

  void _onSearchRequested(
    WorkflowRequestSearchRequested event,
    Emitter<WorkflowRequestState> emit,
  ) {
    final List<WorkflowRequest> filtered = SearchUtils.filterListBySearch(
      items: state.originalMaterials,
      search: event.query,
      getSearchableFields: (m) => [
        m.requestId,
        m.type.name,
        m.itemCodeTesting,
        m.itemCodeSapUpdate,
        m.itemName,
        m.category,
        m.quantity,
        m.plantNameRunTrials,
        m.requestDatetime,
        m.globalApproveDatetime,
        m.qcmApproveDatetime,
        m.shortRunDatetime,
      ],
    );
    emit(
      state.copyWith(
        allMaterials: filtered,
        status: Status.search,
        searchQuery: event.query,
      ),
    );
  }

  Future<void> _onExportRequested(
    WorkflowRequestExportRequested event,
    Emitter<WorkflowRequestState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    final filePath = await ExportUtils.exportExcel(
      configs: state.listViewConfig,
      results: state.originalMaterials,
    );

    emit(
      state.copyWith(
        status: Status.exported,
        filePath: filePath,
        selectedMaterial: state.selectedMaterial,
      ),
    );
  }

  void _onListViewConfigUpdated(
    WorkflowRequestListViewConfigUpdated event,
    Emitter<WorkflowRequestState> emit,
  ) async {
    final listViewConfig = state.listViewConfig;
    int fixedLeftColumns = listViewConfig.fixedLeftColumns;

    final updatedColumns = listViewConfig.columns.map((col) {
      if (col.key == event.newConfig.key) {
        return event.newConfig;
      }
      if (col.range != null && col.range!.columns.isNotEmpty) {
        final subColumns = col.range!.columns;
        final subColumnIndex = subColumns.indexWhere(
          (subCol) => subCol.key == event.newConfig.key,
        );
        if (subColumnIndex != -1) {
          final updatedSubColumns = List<TableColumnConfig>.from(subColumns);
          updatedSubColumns[subColumnIndex] = event.newConfig;
          final updatedRange = RangeData(
            start: col.range!.start,
            end: col.range!.end,
            groupTitle: col.range!.groupTitle,
            columns: updatedSubColumns,
          );
          return col.copyWith(range: updatedRange);
        }
      }

      return col;
    }).toList();

    if (event.isFixed) {
      fixedLeftColumns = listViewConfig.calculateFixedLeftColumnsForColumn(
        event.newConfig.key,
      );
    }

    final updatedConfig = listViewConfig.copyWith(
      columns: updatedColumns,
      fixedLeftColumns: fixedLeftColumns,
    );

    // 3. Save and emit
    await sl<AppDatabaseRepository>().saveListViewConfig(updatedConfig);

    emit(
      state.copyWith(
        listViewConfig: updatedConfig,
        status: Status.loaded,
        selectedMaterial: state.selectedMaterial,
      ),
    );
  }

  Future<void> _onConfirmConfirmed(
    WorkflowRequestConfirm event,
    Emitter<WorkflowRequestState> emit,
  ) async {
    emit(
      state.copyWith(allMaterials: event.allMaterials, status: Status.loaded),
    );
  }

  Future<void> _onUpdateMaterialReconcile(
    UpdateWorkflowRequest event,
    Emitter<WorkflowRequestState> emit,
  ) async {
    emit(
      state.copyWith(allMaterials: event.allMaterials, status: Status.loaded),
    );
  }

  FutureOr<void> _onAddRequested(
    AddWorkflowRequest event,
    Emitter<WorkflowRequestState> emit,
  ) {
    final updatedOriginal = List<WorkflowRequest>.from(state.originalMaterials)
      ..insert(0, event.request);
    // Re-apply search filter if any
    final List<WorkflowRequest> filtered = SearchUtils.filterListBySearch(
      items: updatedOriginal,
      search: state.searchQuery,
      getSearchableFields: (m) => [
        m.requestId,
        m.type.name,
        m.itemCodeTesting,
        m.itemCodeSapUpdate,
        m.itemName,
        m.category,
        m.quantity,
        m.plantNameRunTrials,
        m.requestDatetime,
        m.globalApproveDatetime,
        m.qcmApproveDatetime,
        m.shortRunDatetime,
      ],
    );

    emit(
      state.copyWith(
        originalMaterials: updatedOriginal,
        allMaterials: filtered,
        status: Status.loaded,
      ),
    );
  }
}
