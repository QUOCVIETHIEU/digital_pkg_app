import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../../core/constants/constants.dart';
import '../models/exportable_model.dart';
import '../models/listview_config_model.dart';
import '../models/table_column_config.dart';
import 'save_json_web.dart' if (dart.library.io) 'save_json_io.dart';

class ExportUtils {
  static Future<String?> _getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isAndroid) {
        directory = Directory('/storage/emulated/0/Download');
        // Put file in global download folder, if for an unknown reason it didn't exist, we fallback

        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      } else {
        directory = await getApplicationDocumentsDirectory();
      }
    } catch (err) {
      return null;
    }
    return directory?.path;
  }

  static Future<String> exportExcelDoubleSimplified({
    required ListViewConfigModel configsParent,
    required ListViewConfigModel configsChild,
    required List<Exportable> resultsParent,
    List<ExportableChildren> resultsChild = const [],
  }) async {
    late String? selectedDirectory;
    if (kIsWeb) {
      selectedDirectory = '';
    } else {
      selectedDirectory = await _getDownloadPath();
    }

    if (selectedDirectory == null) return 'Not exist';

    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Sheet1'];

    _writeDoubleComplexHeader(sheetObject, configsParent, configsChild);

    final parentHeaderRowCount = _getHeaderRowCount(configsParent);
    final childHeaderRowCount = _getHeaderRowCount(configsChild);
    final dataStartRow = parentHeaderRowCount > childHeaderRowCount
        ? parentHeaderRowCount
        : childHeaderRowCount;
    final parentColumns = _buildColumnList(configsParent);
    final childColumns = _buildColumnList(configsChild);

    int currentRow = dataStartRow;

    for (var i = 0; i < resultsParent.length; i++) {
      var parentItem = resultsParent[i];
      final parentData = parentItem.toExportData(i);

      assert(
        parentData.length == parentColumns.length,
        'Parent export data length (${parentData.length}) must equal parent columns length (${parentColumns.length}) for item $i',
      );

      List<Exportable> children = [];
      switch (parentItem) {
        case ExportableWithChildren():
          children = parentItem.getChildren();
          break;
        case ExportableParent():
          children = parentItem.filterChildren(resultsChild);
          break;
        default:
          children = [];
      }
      final childrenCount = children.isEmpty ? 1 : children.length;

      for (int colIndex = 0; colIndex < parentData.length; colIndex++) {
        final cell = sheetObject.cell(
          CellIndex.indexByColumnRow(
            columnIndex: colIndex,
            rowIndex: currentRow,
          ),
        );
        cell.value = _cellValue(parentData[colIndex]);

        final isCenter = colIndex < parentColumns.length
            ? parentColumns[colIndex].isCenter
            : true;
        cell.cellStyle = _getDataCellStyle(isCenter);

        if (childrenCount > 1) {
          sheetObject.merge(
            CellIndex.indexByColumnRow(
              columnIndex: colIndex,
              rowIndex: currentRow,
            ),
            CellIndex.indexByColumnRow(
              columnIndex: colIndex,
              rowIndex: currentRow + childrenCount - 1,
            ),
          );
        }
      }

      for (int childIndex = 0; childIndex < childrenCount; childIndex++) {
        final childRowIndex = currentRow + childIndex;

        if (children.isNotEmpty && childIndex < children.length) {
          final childItem = children[childIndex];
          final childData = childItem.toExportData(childIndex);

          assert(
            childData.length == childColumns.length,
            'Child export data length (${childData.length}) must equal child columns length (${childColumns.length}) for parent item $i, child $childIndex',
          );

          for (int colIndex = 0; colIndex < childData.length; colIndex++) {
            final actualColIndex = parentColumns.length + colIndex;
            final cell = sheetObject.cell(
              CellIndex.indexByColumnRow(
                columnIndex: actualColIndex,
                rowIndex: childRowIndex,
              ),
            );
            cell.value = _cellValue(childData[colIndex]);

            final isCenter = colIndex < childColumns.length
                ? childColumns[colIndex].isCenter
                : true;
            cell.cellStyle = _getDataCellStyle(isCenter);
          }
        }

        sheetObject.setRowHeight(childRowIndex, 40.0);
      }

      currentRow += childrenCount;
    }

    _applyDoubleHeaderStyle(sheetObject, configsParent, configsChild);
    _autoFitDoubleColumns(sheetObject, configsParent, configsChild);

    // Save file
    final List<int>? fileBytes = excel.encode();
    if (fileBytes == null || fileBytes.isEmpty) {
      return 'Mã hóa tệp Excel thất bại';
    }

    final fileName =
        '${configsParent.name.name}_${configsChild.name.name}.xlsx';
    String filePath = path.join(selectedDirectory, fileName);

    if (kIsWeb) {
      excel.save(fileName: fileName);
    } else {
      final targetFile = File(filePath);
      if (targetFile.existsSync()) {
        try {
          targetFile.deleteSync();
        } on FileSystemException {
          return 'Không thể ghi đè: tệp đang được mở bởi chương trình khác. Vui lòng đóng tệp rồi thử lại.';
        }
      }

      try {
        targetFile
          ..createSync(recursive: true)
          ..writeAsBytesSync(fileBytes, flush: true);
        return filePath;
      } on FileSystemException {
        return 'Ghi tệp Excel thất bại';
      }
    }
    return 'Không tồn tại';
  }

  static Future<String> exportExcel({
    required ListViewConfigModel configs,
    required List<Exportable> results,
  }) async {
    late String? selectedDirectory;
    if (kIsWeb) {
      selectedDirectory = '';
    } else {
      selectedDirectory = await _getDownloadPath();
    }

    if (selectedDirectory == null) return 'Not exist';

    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Sheet1'];

    _writeComplexHeader(sheetObject, configs);

    final dataStartRow = _getHeaderRowCount(configs);
    final flattenedColumns = _buildColumnList(configs);
    for (var i = 0; i < results.length; i++) {
      var item = results[i];
      final rowIndex = dataStartRow + i;
      final exportData = item.toExportData(i);

      // Assert that exportData length matches flattened columns length
      assert(
        exportData.length == flattenedColumns.length,
        'Export data length (${exportData.length}) must equal flattened columns length (${flattenedColumns.length})',
      );

      for (int colIndex = 0; colIndex < exportData.length; colIndex++) {
        final cell = sheetObject.cell(
          CellIndex.indexByColumnRow(columnIndex: colIndex, rowIndex: rowIndex),
        );
        cell.value = _cellValue(exportData[colIndex]);
        sheetObject.setRowHeight(rowIndex, 40.0);
        //style cua data Cell
        final isCenter = colIndex < flattenedColumns.length
            ? flattenedColumns[colIndex].isCenter
            : true;
        cell.cellStyle = CellStyle(
          horizontalAlign: isCenter
              ? HorizontalAlign.Center
              : HorizontalAlign.Left,
          verticalAlign: VerticalAlign.Center,
          fontSize: 12,
          leftBorder: Border(borderStyle: BorderStyle.Hair),
          rightBorder: Border(borderStyle: BorderStyle.Hair),
          topBorder: Border(borderStyle: BorderStyle.Hair),
          bottomBorder: Border(borderStyle: BorderStyle.Hair),
        );
      }
    }

    _applyHeaderStyle(sheetObject, configs);

    _autoFitColumns(sheetObject, configs);

    final List<int>? fileBytes = excel.encode();
    if (fileBytes == null || fileBytes.isEmpty) {
      return 'Mã hóa tệp Excel thất bại';
    }

    final fileName = '${configs.name.name}.xlsx';
    String filePath = path.join(selectedDirectory, fileName);
    if (kIsWeb) {
      excel.save(fileName: fileName);
    } else {
      final targetFile = File(filePath);
      if (targetFile.existsSync()) {
        try {
          targetFile.deleteSync();
        } on FileSystemException {
          return 'Không thể ghi đè: tệp đang được mở bởi chương trình khác. Vui lòng đóng tệp rồi thử lại.';
        }
      }

      try {
        targetFile
          ..createSync(recursive: true)
          ..writeAsBytesSync(fileBytes, flush: true);
        return filePath;
      } on FileSystemException {
        return 'Ghi tệp Excel thất bại';
      }
    }
    return 'Không tồn tại';
  }

  static void _writeComplexHeader(Sheet sheet, ListViewConfigModel configs) {
    final headerRowCount = _getHeaderRowCount(configs);

    int currentCol = 0;
    for (final column in configs.columns) {
      if (column.range != null && column.range!.columns.isNotEmpty) {
        final groupTitle = column.range!.groupTitle;
        final span = column.range!.length;
        sheet
            .cell(
              CellIndex.indexByColumnRow(columnIndex: currentCol, rowIndex: 0),
            )
            .value = TextCellValue(
          groupTitle,
        );

        if (span > 1) {
          sheet.merge(
            CellIndex.indexByColumnRow(columnIndex: currentCol, rowIndex: 0),
            CellIndex.indexByColumnRow(
              columnIndex: currentCol + span - 1,
              rowIndex: 0,
            ),
          );
        }

        for (int i = 0; i < column.range!.columns.length; i++) {
          sheet
              .cell(
                CellIndex.indexByColumnRow(
                  columnIndex: currentCol + i,
                  rowIndex: 1,
                ),
              )
              .value = TextCellValue(
            column.range!.columns[i].title,
          );
        }

        currentCol += span;
      } else {
        sheet
            .cell(
              CellIndex.indexByColumnRow(columnIndex: currentCol, rowIndex: 0),
            )
            .value = TextCellValue(
          column.title,
        );
        sheet.merge(
          CellIndex.indexByColumnRow(columnIndex: currentCol, rowIndex: 0),
          CellIndex.indexByColumnRow(
            columnIndex: currentCol,
            rowIndex: headerRowCount - 1,
          ),
        );

        currentCol += 1;
      }
    }
  }

  static List<TableColumnConfig> _buildColumnList(ListViewConfigModel configs) {
    final columnList = <TableColumnConfig>[];

    for (final column in configs.columns) {
      if (column.range != null && column.range!.columns.isNotEmpty) {
        columnList.addAll(column.range!.columns);
      } else {
        columnList.add(column);
      }
    }
    return columnList;
  }

  static int _getHeaderRowCount(ListViewConfigModel configs) {
    final hasGroupedColumns = configs.columns.any(
      (column) => column.range != null && column.range!.columns.isNotEmpty,
    );

    return hasGroupedColumns ? 2 : 1;
  }

  /// style  header
  static void _applyHeaderStyle(Sheet sheet, ListViewConfigModel configs) {
    final headerRowCount = _getHeaderRowCount(configs);
    final headerBaseStyle = CellStyle(
      bold: false,
      horizontalAlign: HorizontalAlign.Center,
      verticalAlign: VerticalAlign.Center,
      textWrapping: TextWrapping.WrapText,
      fontSize: 12,
      leftBorder: Border(borderStyle: BorderStyle.Hair),
      rightBorder: Border(borderStyle: BorderStyle.Hair),
      topBorder: Border(borderStyle: BorderStyle.Hair),
      bottomBorder: Border(borderStyle: BorderStyle.Hair),
      backgroundColorHex: ExcelColor.fromHexString('#3A5A7A'),
      fontColorHex: ExcelColor.fromHexString('#FFFFFF'),
    );

    for (int row = 0; row < headerRowCount; row++) {
      sheet.setRowHeight(row, 50.0);

      for (int col = 0; col < _getTotalColumnsCount(configs); col++) {
        final cell = sheet.cell(
          CellIndex.indexByColumnRow(columnIndex: col, rowIndex: row),
        );

        if (cell.value != null) {
          cell.cellStyle = headerBaseStyle;
        } else {
          cell.cellStyle = CellStyle(
            leftBorder: Border(borderStyle: BorderStyle.Hair),
            rightBorder: Border(borderStyle: BorderStyle.Hair),
            topBorder: Border(borderStyle: BorderStyle.Hair),
            bottomBorder: Border(borderStyle: BorderStyle.Hair),
          );
        }
      }
    }

    // Adjust header alignment per leaf column's isCenter
    final flattenedColumns = _buildColumnList(configs);
    final leafHeaderRowByColumn = _getLeafHeaderRowIndexPerColumn(configs);

    for (int col = 0; col < flattenedColumns.length; col++) {
      final isCenter = flattenedColumns[col].isCenter;
      final rowIndex = headerRowCount == 1
          ? 0
          : (col < leafHeaderRowByColumn.length
                ? leafHeaderRowByColumn[col]
                : headerRowCount - 1);

      final cell = sheet.cell(
        CellIndex.indexByColumnRow(columnIndex: col, rowIndex: rowIndex),
      );
      if (cell.value != null) {
        cell.cellStyle = CellStyle(
          bold: false,
          horizontalAlign: isCenter
              ? HorizontalAlign.Center
              : HorizontalAlign.Left,
          verticalAlign: VerticalAlign.Center,
          textWrapping: TextWrapping.WrapText,
          fontSize: 12,
          leftBorder: Border(borderStyle: BorderStyle.Hair),
          rightBorder: Border(borderStyle: BorderStyle.Hair),
          topBorder: Border(borderStyle: BorderStyle.Hair),
          bottomBorder: Border(borderStyle: BorderStyle.Hair),
          backgroundColorHex: ExcelColor.fromHexString('#3A5A7A'),
          fontColorHex: ExcelColor.fromHexString('#FFFFFF'),
        );
      }
    }
  }

  /// Auto-fit columns
  static void _autoFitColumns(Sheet sheet, ListViewConfigModel configs) {
    final columnList = _buildColumnList(configs);

    for (int col = 0; col < columnList.length; col++) {
      final column = columnList[col];
      final columnWidth = (column.width / 7) * 1.3;
      sheet.setColumnWidth(col, columnWidth);
    }
  }

  static int _getTotalColumnsCount(ListViewConfigModel configs) {
    int total = 0;
    for (final column in configs.columns) {
      if (column.range != null && column.range!.columns.isNotEmpty) {
        total += column.range!.columns.length;
      } else {
        total += 1;
      }
    }
    return total;
  }

  // Determine which header row holds each leaf column title (0 for ungrouped, 1 for grouped)
  static List<int> _getLeafHeaderRowIndexPerColumn(
    ListViewConfigModel configs,
  ) {
    final result = <int>[];
    for (final column in configs.columns) {
      if (column.range != null && column.range!.columns.isNotEmpty) {
        for (int i = 0; i < column.range!.columns.length; i++) {
          result.add(1);
        }
      } else {
        result.add(0);
      }
    }
    return result;
  }

  static CellValue _cellValue(dynamic value) {
    if (value is String) {
      return TextCellValue(value);
    }
    if (value is int) {
      return IntCellValue(value);
    }
    if (value is double) {
      return DoubleCellValue(value);
    }
    if (value is bool) {
      return TextCellValue(value ? AppStrings.checkMark : '');
    }
    if (value is DateTime) {
      return DateTimeCellValue.fromDateTime(value);
    }
    if (value == null) {
      return TextCellValue('');
    }
    return TextCellValue(value.toString());
  }

  static void _writeDoubleComplexHeader(
    Sheet sheet,
    ListViewConfigModel configsParent,
    ListViewConfigModel configsChild,
  ) {
    final parentHeaderRowCount = _getHeaderRowCount(configsParent);
    final childHeaderRowCount = _getHeaderRowCount(configsChild);
    final headerRowCount = parentHeaderRowCount > childHeaderRowCount
        ? parentHeaderRowCount
        : childHeaderRowCount;
    final parentColumns = _buildColumnList(configsParent);

    int currentCol = 0;
    for (final column in configsParent.columns) {
      if (column.range != null && column.range!.columns.isNotEmpty) {
        final groupTitle = column.range!.groupTitle;
        final span = column.range!.length;
        sheet
            .cell(
              CellIndex.indexByColumnRow(columnIndex: currentCol, rowIndex: 0),
            )
            .value = TextCellValue(
          groupTitle,
        );

        if (span > 1) {
          sheet.merge(
            CellIndex.indexByColumnRow(columnIndex: currentCol, rowIndex: 0),
            CellIndex.indexByColumnRow(
              columnIndex: currentCol + span - 1,
              rowIndex: 0,
            ),
          );
        }

        for (int i = 0; i < column.range!.columns.length; i++) {
          sheet
              .cell(
                CellIndex.indexByColumnRow(
                  columnIndex: currentCol + i,
                  rowIndex: 1,
                ),
              )
              .value = TextCellValue(
            column.range!.columns[i].title,
          );
        }

        currentCol += span;
      } else {
        sheet
            .cell(
              CellIndex.indexByColumnRow(columnIndex: currentCol, rowIndex: 0),
            )
            .value = TextCellValue(
          column.title,
        );
        sheet.merge(
          CellIndex.indexByColumnRow(columnIndex: currentCol, rowIndex: 0),
          CellIndex.indexByColumnRow(
            columnIndex: currentCol,
            rowIndex: headerRowCount - 1,
          ),
        );
        currentCol += 1;
      }
    }

    final childStartCol = parentColumns.length;
    currentCol = childStartCol;

    for (final column in configsChild.columns) {
      if (column.range != null && column.range!.columns.isNotEmpty) {
        final groupTitle = column.range!.groupTitle;
        final span = column.range!.length;
        sheet
            .cell(
              CellIndex.indexByColumnRow(columnIndex: currentCol, rowIndex: 0),
            )
            .value = TextCellValue(
          groupTitle,
        );

        if (span > 1) {
          sheet.merge(
            CellIndex.indexByColumnRow(columnIndex: currentCol, rowIndex: 0),
            CellIndex.indexByColumnRow(
              columnIndex: currentCol + span - 1,
              rowIndex: 0,
            ),
          );
        }

        for (int i = 0; i < column.range!.columns.length; i++) {
          sheet
              .cell(
                CellIndex.indexByColumnRow(
                  columnIndex: currentCol + i,
                  rowIndex: 1,
                ),
              )
              .value = TextCellValue(
            column.range!.columns[i].title,
          );
        }

        currentCol += span;
      } else {
        sheet
            .cell(
              CellIndex.indexByColumnRow(columnIndex: currentCol, rowIndex: 0),
            )
            .value = TextCellValue(
          column.title,
        );
        if (childHeaderRowCount == 1) {
          sheet.merge(
            CellIndex.indexByColumnRow(columnIndex: currentCol, rowIndex: 0),
            CellIndex.indexByColumnRow(
              columnIndex: currentCol,
              rowIndex: headerRowCount - 1,
            ),
          );
        } else {
          sheet.merge(
            CellIndex.indexByColumnRow(columnIndex: currentCol, rowIndex: 0),
            CellIndex.indexByColumnRow(
              columnIndex: currentCol,
              rowIndex: childHeaderRowCount - 1,
            ),
          );
        }
        currentCol += 1;
      }
    }
  }

  static void _applyDoubleHeaderStyle(
    Sheet sheet,
    ListViewConfigModel configsParent,
    ListViewConfigModel configsChild,
  ) {
    final parentHeaderRowCount = _getHeaderRowCount(configsParent);
    final childHeaderRowCount = _getHeaderRowCount(configsChild);
    final headerRowCount = parentHeaderRowCount > childHeaderRowCount
        ? parentHeaderRowCount
        : childHeaderRowCount;
    final parentColumns = _buildColumnList(configsParent);
    final childColumns = _buildColumnList(configsChild);
    final totalColumns = parentColumns.length + childColumns.length;

    for (int row = 0; row < headerRowCount; row++) {
      sheet.setRowHeight(row, 50.0);

      for (int col = 0; col < totalColumns; col++) {
        final cell = sheet.cell(
          CellIndex.indexByColumnRow(columnIndex: col, rowIndex: row),
        );

        if (cell.value != null) {
          bool isCenter = true;
          String backgroundColor = '#3A5A7A';

          if (col < parentColumns.length) {
            isCenter = parentColumns[col].isCenter;
            backgroundColor = '#3A5A7A';
          } else {
            final childColIndex = col - parentColumns.length;
            if (childColIndex < childColumns.length) {
              isCenter = childColumns[childColIndex].isCenter;
            }
            backgroundColor = '#537BA0';
          }

          cell.cellStyle = CellStyle(
            bold: false,
            horizontalAlign: isCenter
                ? HorizontalAlign.Center
                : HorizontalAlign.Left,
            verticalAlign: VerticalAlign.Center,
            textWrapping: TextWrapping.WrapText,
            fontSize: 12,
            leftBorder: Border(borderStyle: BorderStyle.Hair),
            rightBorder: Border(borderStyle: BorderStyle.Hair),
            topBorder: Border(borderStyle: BorderStyle.Hair),
            bottomBorder: Border(borderStyle: BorderStyle.Hair),
            backgroundColorHex: ExcelColor.fromHexString(backgroundColor),
            fontColorHex: ExcelColor.fromHexString('#FFFFFF'),
          );
        } else {
          cell.cellStyle = CellStyle(
            leftBorder: Border(borderStyle: BorderStyle.Hair),
            rightBorder: Border(borderStyle: BorderStyle.Hair),
            topBorder: Border(borderStyle: BorderStyle.Hair),
            bottomBorder: Border(borderStyle: BorderStyle.Hair),
          );
        }
      }
    }
  }

  static void _autoFitDoubleColumns(
    Sheet sheet,
    ListViewConfigModel configsParent,
    ListViewConfigModel configsChild,
  ) {
    final parentColumns = _buildColumnList(configsParent);
    final childColumns = _buildColumnList(configsChild);

    for (int col = 0; col < parentColumns.length; col++) {
      final column = parentColumns[col];
      final columnWidth = (column.width / 7) * 1.3;
      sheet.setColumnWidth(col, columnWidth);
    }

    for (int col = 0; col < childColumns.length; col++) {
      final column = childColumns[col];
      final columnWidth = (column.width / 7) * 1.3;
      final actualColIndex = parentColumns.length + col;
      sheet.setColumnWidth(actualColIndex, columnWidth);
    }
  }

  static CellStyle _getDataCellStyle(bool isCenter) {
    return CellStyle(
      horizontalAlign: isCenter ? HorizontalAlign.Center : HorizontalAlign.Left,
      verticalAlign: VerticalAlign.Center,
      fontSize: 12,
      leftBorder: Border(borderStyle: BorderStyle.Hair),
      rightBorder: Border(borderStyle: BorderStyle.Hair),
      topBorder: Border(borderStyle: BorderStyle.Hair),
      bottomBorder: Border(borderStyle: BorderStyle.Hair),
    );
  }

  static Future<String?> saveJsonToFile(
    String jsonData,
    String filename,
  ) async {
    return saveJsonToFileImpl(jsonData, filename);
  }
}
