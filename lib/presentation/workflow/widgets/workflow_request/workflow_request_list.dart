import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tableview2/tableview2.dart';

import '../../../../../common/widgets/widgets.dart';
import '../../../../../core/configs/themes/app_colors.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../data/workflow/models/workflow_request.dart';
import '../../../../gen/assets.gen.dart';

class WorkflowRequestList extends StatelessWidget {
  const WorkflowRequestList({
    super.key,
    required this.materials,
    required this.listViewConfig,
    this.onSelect,
    this.selectedMaterial,
    this.showSort = false,
    this.onSort,
    this.sortColumnIndex,
    this.sortAscending,
    this.colorHeader = AppColors.tableHeaderColor,
    required this.emptyMessage,
    this.isShowPO = false,
    required this.onConfigUpdated,
  });

  final String emptyMessage;
  final List<WorkflowRequest> materials;
  final ListViewConfigModel listViewConfig;
  final void Function(WorkflowRequest)? onSelect;
  final WorkflowRequest? selectedMaterial;
  final bool showSort;
  final void Function(int, bool)? onSort;
  final int? sortColumnIndex;
  final bool? sortAscending;
  final bool? isShowPO;
  final Color colorHeader;
  final ListViewConfigUpdatedCallback onConfigUpdated;

  List<TableColumnConfig> get _columnList {
    final columnList = <TableColumnConfig>[];
    for (final column in listViewConfig.columns) {
      if (column.range != null && column.range!.columns.isNotEmpty) {
        for (var i = 0; i < column.range!.columns.length; i++) {
          columnList.add(column.range!.columns[i]);
        }
      } else {
        columnList.add(column);
      }
    }
    return columnList;
  }

  List<dynamic> _getCellValues(WorkflowRequest material, int index) {
    return [
      (index + 1),
      material.requestId,
      material.type,
      material.itemCodeTesting,
      material.itemCodeSapUpdate,
      material.itemName,
      material.category,
      material.quantity,
      material.plantNameRunTrials,
      material.requestDatetime,
      material.globalApproveDatetime,
      material.qcmApproveDatetime,
      material.shortRunDatetime,
    ];
  }

  List<Widget> _cellsBuilder(WorkflowRequest material, int index) {
    final cellValues = _getCellValues(material, index);
    final columns = _columnList;
    return List.generate(columns.length, (i) {
      final columnConfig = columns[i];
      final isCenter = columnConfig.isCenter;
      final cellValue = i < cellValues.length ? cellValues[i] : '';
      return TableCellWrapper(
        isCenter: isCenter,
        child: SelectableCell(
          text: cellValue.toString(),
          isCenter: isCenter,
          style: const TextStyle(color: AppColors.textColor),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      child: TableView2(
        empty: ListviewEmptyData(
          alignment: Alignment.topCenter,
          size: Size(double.infinity, 100),
          message: emptyMessage,
          icon: SvgPicture.asset(Assets.icons.common.icoDataEmpty),
        ),
        emptyMessage: emptyMessage,
        onConfigUpdated: onConfigUpdated,
        dataRowHeight: isShowPO == true
            ? AppConfigs.dataRowHeightReconcile
            : AppConfigs.dataRowHeight,
        headingRowHeight: AppConfigs.headingRowHeightGroup,
        hoveredIndexNotifier: ValueNotifier(-1),
        fixedRowCount: 1,
        tableHeaderColor: colorHeader,
        listViewConfig: listViewConfig,
        sortColumnIndex: sortColumnIndex,
        sortAscending: sortAscending,
        onSort: onSort,
        rows: materials.asMap().entries.map((entry) {
          final index = entry.key;
          final material = entry.value;
          return DataRowTableView(
            index: index,
            selected: selectedMaterial?.id == material.id,
            onTap: () => onSelect?.call(material),
            cells: _cellsBuilder(material, index),
          );
        }).toList(),
      ),
    );
  }
}
