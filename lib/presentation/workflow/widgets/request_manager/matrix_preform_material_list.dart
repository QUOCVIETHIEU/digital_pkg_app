import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tableview2/tableview2.dart';

import '../../../../common/widgets/widgets.dart';
import '../../../../core/configs/themes/app_colors.dart';
import '../../../../core/constants/constants.dart';
import '../../../../data/workflow/models/models.dart';
import '../../../../gen/assets.gen.dart';

class MatrixPreFormMaterialList extends StatefulWidget {
  const MatrixPreFormMaterialList({
    super.key,
    required this.matrixEdiList,
    required this.listViewConfig,
    required this.onConfigUpdated,
  });
  final List<MatrixEdi> matrixEdiList;
  final ListViewConfigModel listViewConfig;
  final ListViewConfigUpdatedCallback onConfigUpdated;

  @override
  State<MatrixPreFormMaterialList> createState() =>
      _MatrixPreFormMaterialListState();
}

class _MatrixPreFormMaterialListState extends State<MatrixPreFormMaterialList> {
  late final ValueNotifier<int> _hoveredIndexNotifier;

  @override
  void initState() {
    super.initState();
    _hoveredIndexNotifier = ValueNotifier<int>(-1);
  }

  @override
  void dispose() {
    _hoveredIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      small: _buildDataTable(context),
      normal: _buildDataTable(context),
      large: _buildDataTable(context),
      extraLarge: _buildDataTable(context),
    );
  }

  Widget _buildDataTable(BuildContext context) {
    List<Widget> cellsBuilder(MatrixEdi entry, int index) {
      final statusByColumns = List<String>.generate(
        8,
        (i) => i < entry.status.length ? entry.status[i].name : '',
      );
      final cellValues = <dynamic>[
        entry.plantStatus.name,
        entry.line,
        '${entry.size} ${entry.unit}',
        entry.type,
        '${entry.weight} ${entry.unitWeight}',
        entry.supplier,
        entry.resin,
        entry.itemCode,
        entry.mold,
        ...statusByColumns,
        entry.note ?? '',
      ];

      const statusColumnStart = 9;
      const statusColumnEnd = 16;
      return List.generate(cellValues.length, (i) {
        List<TableColumnConfig> allColumns = [];
        for (var element in widget.listViewConfig.columns) {
          if (element.range != null && element.range!.columns.isNotEmpty) {
            allColumns.addAll(element.range!.columns);
          } else {
            allColumns.add(element);
          }
        }
        final isCenter = allColumns[i].isCenter;
        final dynamic cellValue = cellValues[i];
        Widget child;
        final isStatusColumn = i >= statusColumnStart && i <= statusColumnEnd;
        final statusIndex = i - statusColumnStart;
        final statusColor =
            (statusIndex >= 0 && statusIndex < entry.status.length)
            ? entry.status[statusIndex].color
            : AppColors.textColor;
        final statusBackgroundColor =
            (statusIndex >= 0 && statusIndex < entry.status.length)
            ? entry.status[statusIndex].backgroundColor
            : AppColors.textColor;
        final textStyle = TextStyle(color: statusColor);
        if (isStatusColumn) {
          child = SelectableCell<String?>(
            text: cellValue.toString(),
            isCenter: isCenter,
            type: SelectableCellType.text,
            style: textStyle,
            backgroundColor: statusBackgroundColor,
          );
        } else {
          child = SelectableCell<String>(
            text: cellValue.toString(),
            isCenter: isCenter,
            style: TextStyle(color: AppColors.textColor),
          );
        }

        return TableCellWrapper(isCenter: isCenter, child: child);
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: TableView2(
        empty: ListviewEmptyData(
          alignment: Alignment.topCenter,
          size: Size(double.infinity, 100),
          message: 'Không tìm thấy thông tin matrix...',
          icon: SvgPicture.asset(Assets.icons.common.icoDataEmpty),
        ),
        listViewConfig: widget.listViewConfig,
        dataRowHeight: AppConfigs.dataRowHeight,
        headingRowHeight: AppConfigs.headingRowHeightGroup,
        hoveredIndexNotifier: _hoveredIndexNotifier,
        tableHeaderColor: AppColors.tableHeaderColor2,
        fixedRowCount: 2,
        onConfigUpdated: widget.onConfigUpdated,
        rows: widget.matrixEdiList.asMap().entries.map((entry) {
          final index = entry.key;
          final batch = entry.value;
          return DataRowTableView(
            index: index,
            cells: cellsBuilder(batch, index),
          );
        }).toList(),
      ),
    );
  }
}
