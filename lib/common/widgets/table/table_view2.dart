import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../core/configs/themes/app_theme.dart';
import '../../../core/typedefs/type_defs.dart';
import '../../helpers/utils.dart';
import '../../models/models.dart';
import '../widgets.dart';

class TableView2 extends StatelessWidget {
  const TableView2({
    super.key,
    this.empty,
    this.emptyMessage,
    required this.rows,
    this.onSelectAll,
    required this.dataRowHeight,
    required this.headingRowHeight,
    required this.listViewConfig,
    required this.onConfigUpdated,
    this.onSort,
    this.sortColumnIndex,
    this.sortAscending,
    this.fixedRowCount = 1,
    this.tableHeaderColor = AppColors.tableHeaderColor,

    this.hoveredIndexNotifier,
  });
  final Widget? empty;
  final String? emptyMessage;
  final List<DataRowTableView> rows;
  final ValueSetter<bool?>? onSelectAll;
  final double dataRowHeight;
  final double headingRowHeight;
  final ListViewConfigModel listViewConfig;
  final ListViewConfigUpdatedCallback onConfigUpdated;
  final void Function(int, bool)? onSort;
  final int? sortColumnIndex;
  final bool? sortAscending;
  final int fixedRowCount;
  final Color tableHeaderColor;
  final ValueNotifier<int>? hoveredIndexNotifier;

  @override
  Widget build(BuildContext context) {
    if (rows.isEmpty) {
      return _buildDefaultEmptyState();
    }
    return _buildTableView();
  }

  Widget _buildDefaultEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildTableView()),
        Expanded(
          child:
              empty ??
              ListviewEmptyData(
                alignment: Alignment.topCenter,
                size: const Size(double.infinity, double.infinity),
                message: emptyMessage ?? 'Không có dữ liệu',
              ),
        ),
      ],
    );
  }

  Widget _buildTableView() {
    final totalColumns =
        _getTotalColumnsCount() + (listViewConfig.isHaveCheckBox ? 1 : 0);
    final rowCount = fixedRowCount + rows.length;
    return TableView.builder(
      horizontalDetails: const ScrollableDetails.horizontal().copyWith(
        physics: const ClampingScrollPhysics(),
      ),
      verticalDetails: const ScrollableDetails.vertical().copyWith(
        physics: const ClampingScrollPhysics(),
      ),
      rowCount: rowCount,
      columnCount: totalColumns,
      pinnedRowCount: fixedRowCount,
      cellBuilder: (context, vicinity) => _buildCell(context, vicinity),
      pinnedColumnCount: listViewConfig.fixedLeftColumns,
      columnBuilder: (int index) => TableSpan(
        extent: FixedTableSpanExtent(_getColumnWidth(index)),
        foregroundDecoration: TableSpanDecoration(
          border: TableSpanBorder(
            leading: index == 0
                ? const BorderSide(color: AppColors.borderColor, width: 0.4)
                : BorderSide.none,
            trailing: const BorderSide(
              color: AppColors.borderColor,
              width: 0.4,
            ),
          ),
        ),
      ),
      rowBuilder: (int index) => TableSpan(
        extent: FixedTableSpanExtent(
          index < fixedRowCount ? headingRowHeight : dataRowHeight,
        ),
        foregroundDecoration: const TableSpanDecoration(
          border: TableSpanBorder(
            trailing: BorderSide(color: AppColors.borderColor, width: 0.4),
          ),
        ),
      ),
    );
  }

  TableViewCell _buildCell(BuildContext context, TableVicinity vicinity) {
    // Handle checkbox column
    if (listViewConfig.isHaveCheckBox && vicinity.column == 0) {
      return _buildCheckboxCell(context, vicinity);
    }

    final adjustedColumnIndex = listViewConfig.isHaveCheckBox
        ? vicinity.column - 1
        : vicinity.column;
    if (adjustedColumnIndex >= _columnList.length) {
      return const TableViewCell(child: ColoredBox(color: Colors.white));
    }

    final columnConfig = _columnList[adjustedColumnIndex];
    final bool isAlignCenter = columnConfig.isCenter;

    if (vicinity.row == 0) {
      final groupColumn = _getGroupColumn(adjustedColumnIndex);

      if (groupColumn != null) {
        final adjustedStart =
            groupColumn.range!.start + (listViewConfig.isHaveCheckBox ? 1 : 0);

        if (vicinity.column == adjustedStart) {
          return TableViewCell(
            columnMergeStart: adjustedStart,
            columnMergeSpan: groupColumn.range!.length,
            child: _headerCell(
              groupColumn.range!.groupTitle,
              context: context,
              columnConfig: groupColumn,
              index: vicinity.column,
            ),
          );
        } else {
          //empty cell
          return TableViewCell(child: ColoredBox(color: tableHeaderColor));
        }
      } else {
        // single Column
        return TableViewCell(
          rowMergeStart: 0,
          rowMergeSpan: fixedRowCount,
          child: _headerCell(
            columnConfig.title,
            context: context,
            columnConfig: columnConfig,
            index: vicinity.column,
          ),
        );
      }
    }
    TableViewCell cell = const TableViewCell(
      child: ColoredBox(color: Colors.white),
    );
    final int dataRow = vicinity.row - fixedRowCount;
    if (dataRow >= 0 && dataRow < rows.length) {
      final row = rows[dataRow];
      cell = TableViewCell(
        child: InkWell(
          onTap: () => row.onTap?.call(),
          onSecondaryTapDown: (details) =>
              row.onSecondaryTapDown?.call(details),
          onDoubleTap: () {
            if (row.onDoubleTap != null) {
              row.onDoubleTap!.call();
            } else {
              row.onSelectChanged?.call(!row.isChecked);
            }
          },
          onLongPress: () => row.onLongPress?.call(),
          child: ValueListenableBuilder<int>(
            valueListenable: hoveredIndexNotifier ?? ValueNotifier<int>(-1),
            builder: (context, hoveredIndex, child) {
              return MouseRegion(
                onEnter: (_) => hoveredIndexNotifier?.value = row.index ?? 1,
                onExit: (_) => hoveredIndexNotifier?.value = -1,
                child: Container(
                  color: hoveredIndex == row.index
                      ? Colors.grey.shade100
                      : (row.selected
                            ? AppColors.selectedColor
                            : Colors.transparent),
                  alignment: isAlignCenter
                      ? Alignment.center
                      : Alignment.centerLeft,
                  child: TableCellWrapper(
                    isCenter: isAlignCenter,
                    child: row.cells[adjustedColumnIndex],
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
    // HEADER ROW 2 (sub-headers)
    if (vicinity.row == 1) {
      final isGrouped = _isGroupedColumn(adjustedColumnIndex);

      if (isGrouped) {
        // Đây là sub-header của grouped column
        return TableViewCell(
          child: _headerCell(
            columnConfig.title,
            context: context,
            columnConfig: columnConfig,
            index: vicinity.column,
          ),
        );
      } else {
        return cell;
      }
    }
    // Fallback
    return cell;
  }

  TableViewCell _buildCheckboxCell(
    BuildContext context,
    TableVicinity vicinity,
  ) {
    if (vicinity.row == 0) {
      return _buildHeaderCheckboxCell(context);
    }

    final int dataRow = vicinity.row - fixedRowCount;
    if (dataRow >= 0 && dataRow < rows.length) {
      return _buildDataCheckboxCell(context, rows[dataRow]);
    }

    return const TableViewCell(child: ColoredBox(color: Colors.white));
  }

  TableViewCell _buildHeaderCheckboxCell(BuildContext context) {
    final allSelected = _areAllSelected();

    return TableViewCell(
      rowMergeStart: 0,
      rowMergeSpan: fixedRowCount,
      child: Container(
        color: tableHeaderColor,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: CheckboxTheme(
          data: AppTheme.headingCheckboxThemeTwoDimensional(
            context,
            allSelected ?? false,
          ),
          child: Checkbox(
            value: allSelected,
            tristate: true,
            onChanged: (value) {
              onSelectAll?.call(value ?? false);
            },
          ),
        ),
      ),
    );
  }

  TableViewCell _buildDataCheckboxCell(
    BuildContext context,
    DataRowTableView row,
  ) {
    return TableViewCell(
      child: Container(
        color: row.selected ? AppColors.selectedColor : Colors.white,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: CheckboxTheme(
          data: row.enableCheckbox
              ? AppTheme.checkboxTheme(context)
              : AppTheme.checkboxTheme(context).copyWith(
                  fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                    if (states.contains(WidgetState.selected)) {
                      return Colors.grey;
                    }
                    return Colors.transparent;
                  }),
                  checkColor: const WidgetStatePropertyAll(Colors.white),
                  side: WidgetStateBorderSide.resolveWith((states) {
                    return const BorderSide(color: Colors.grey, width: 1);
                  }),
                ),
          child: Checkbox(
            value: row.enableCheckbox ? row.isChecked : true,
            onChanged: row.enableCheckbox
                ? (value) {
                    row.onSelectChanged?.call(value ?? false);
                  }
                : null,
          ),
        ),
      ),
    );
  }

  bool? _areAllSelected() {
    if (rows.isEmpty) return false;

    final selectedCount = rows.where((item) => item.isChecked).length;
    if (selectedCount == 0) return false;
    if (selectedCount == rows.length) return true;
    return null; // Indeterminate state
  }

  Widget _headerCell(
    String text, {
    required int index,
    required BuildContext context,
    required TableColumnConfig columnConfig,
    bool enableSettings = true,
  }) {
    final shouldCenter = columnConfig.isCenter;
    final isSortable = columnConfig.isSortable;
    return InkWell(
      onLongPress: enableSettings
          ? () {
              IDialog.showCommonAnimationDialog(
                context: context,
                content: ListViewSettings(
                  listViewConfig: listViewConfig,
                  columnConfig: columnConfig,
                  onUpdate: (newConfig, isFixed) {
                    onConfigUpdated(newConfig, isFixed);
                  },
                ),
              );
            }
          : null,
      child: Container(
        color: tableHeaderColor,
        padding: const EdgeInsets.all(4),
        alignment: shouldCenter ? Alignment.center : Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: isSortable == true
              ? MainAxisAlignment.spaceBetween
              : shouldCenter
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white),
                overflow: TextOverflow.visible,
                textAlign: shouldCenter ? TextAlign.center : TextAlign.left,
              ),
            ),
            if (isSortable)
              InkWell(
                onTap: () => onSort?.call(index, sortAscending ?? true),
                child: SvgPicture.asset(
                  IconUtils.getSortIcon(
                    sortColumnIndex ?? 0,
                    index,
                    sortAscending ?? true,
                  ),
                  colorFilter: ColorFilter.mode(
                    IconUtils.getSortIconColor(
                      sortColumnIndex ?? 0,
                      index,
                      sortAscending ?? true,
                    ),
                    BlendMode.srcIn,
                  ),
                  width: 12,
                  height: 12,
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Tính tổng số cột thực tế (bao gồm các sub-columns trong grouped columns)
  int _getTotalColumnsCount() {
    int total = 0;
    for (final column in listViewConfig.columns) {
      if (column.range != null && column.range!.columns.isNotEmpty) {
        total += column.range!.columns.length;
      } else {
        total += 1; // singleColumn
      }
    }
    return total;
  }

  TableColumnConfig? _getGroupColumn(int actualColumnIndex) {
    for (final column in listViewConfig.columns) {
      if (column.range != null && column.range!.columns.isNotEmpty) {
        if (actualColumnIndex >= column.range!.start &&
            actualColumnIndex <= column.range!.end) {
          return column;
        }
      }
    }
    return null;
  }

  List<TableColumnConfig> get _columnList {
    final columnList = <TableColumnConfig>[];

    for (final column in listViewConfig.columns) {
      if (column.range != null && column.range!.columns.isNotEmpty) {
        // Grouped column
        for (int i = 0; i < column.range!.columns.length; i++) {
          columnList.add(column.range!.columns[i]);
        }
      } else {
        columnList.add(column);
      }
    }

    return columnList;
  }

  bool _isGroupedColumn(int actualColumnIndex) {
    for (final column in listViewConfig.columns) {
      if (column.range != null && column.range!.columns.isNotEmpty) {
        if (actualColumnIndex >= column.range!.start &&
            actualColumnIndex <= column.range!.end) {
          return true;
        }
      }
    }
    return false;
  }

  double _getColumnWidth(int actualColumnIndex) {
    // Handle checkbox column
    if (listViewConfig.isHaveCheckBox && actualColumnIndex == 0) {
      return 60.0; // Fixed width for checkbox column
    }

    // Adjust column index if checkbox column exists
    final adjustedColumnIndex = listViewConfig.isHaveCheckBox
        ? actualColumnIndex - 1
        : actualColumnIndex;
    if (adjustedColumnIndex >= _columnList.length) {
      return 100.0; // Default width
    }

    final columnConfig = _columnList[adjustedColumnIndex];
    return columnConfig.width;
  }
}
