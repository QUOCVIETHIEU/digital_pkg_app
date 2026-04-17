import 'package:tableview2/tableview2.dart';

import '../../constants/enums.dart';

class ListViewConfigProvider {
  static Map<String, ListViewConfigModel> configs = {
    ListViewConfigName.request.name: requestConfig,
    ListViewConfigName.matrixEdi.name: matrixEdiConfig,
  };
  static ListViewConfigModel matrixEdiConfig = ListViewConfigModel(
    fixedLeftColumns: 3,
    name: ListViewConfigName.matrixEdi.name,
    columns: [
      TableColumnConfig(
        key: 'plantName',
        title: 'Plant Name',
        width: 100,
        isCenter: true,
      ),
      TableColumnConfig(
        key: 'lienName',
        title: 'Line Name',
        width: 200,
        isCenter: true,
      ),
      TableColumnConfig(key: 'size', title: 'Size', width: 150, isCenter: true),
      TableColumnConfig(
        key: 'preform',
        title: 'Preform',
        width: 600,
        isCenter: true,
        range: RangeData(
          start: 3,
          end: 8,
          groupTitle: 'Preform',
          columns: [
            TableColumnConfig(
              key: 'type',
              title: 'Type',
              width: 100,
              isCenter: true,
            ),
            TableColumnConfig(
              key: 'weight',
              title: 'Weight',
              width: 100,
              isCenter: true,
            ),
            TableColumnConfig(
              key: 'supplier',
              title: 'Supplier',
              width: 100,
              isCenter: true,
            ),
            TableColumnConfig(
              key: 'resin',
              title: 'Resin',
              width: 100,
              isCenter: true,
            ),
            TableColumnConfig(
              key: 'itemCode',
              title: 'Item Code',
              width: 100,
              isCenter: true,
            ),
            TableColumnConfig(
              key: 'mold',
              title: 'Mold',
              width: 100,
              isCenter: true,
            ),
          ],
        ),
      ),
      TableColumnConfig(
        key: 'hcsv1',
        title: 'HCSV 2.55grWhite - v6 30000077',
        width: 100,
        isCenter: true,
      ),
      TableColumnConfig(
        key: 'hcsv2',
        title: 'HCSV 2.55grWhite - v6 30000078',
        width: 100,
        isCenter: true,
      ),
      TableColumnConfig(
        key: 'hcsv3',
        title: 'HCSV 2.55grWhite - v6 30000078',
        width: 100,
        isCenter: true,
      ),
      TableColumnConfig(
        key: 'hcsv4',
        title: 'HCSV 2.55grWhite - v6 30000078',
        width: 100,
        isCenter: true,
      ),
      TableColumnConfig(
        key: 'hcsv5',
        title: 'HCSV 2.55grWhite - v6 30000078',
        width: 100,
        isCenter: true,
      ),
      TableColumnConfig(
        key: 'hcsv6',
        title: 'HCSV 2.55grWhite - v6 30000078',
        width: 100,
        isCenter: true,
      ),
      TableColumnConfig(
        key: 'hcsv7',
        title: 'HCSV 2.55grWhite - v6 30000078',
        width: 100,
        isCenter: true,
      ),
      TableColumnConfig(
        key: 'hcsv8',
        title: 'HCSV 2.55grWhite - v6 30000078',
        width: 100,
        isCenter: true,
      ),
      TableColumnConfig(
        key: 'status',
        title: 'Status',
        width: 200,
        isCenter: true,
      ),
    ],
  );
  static ListViewConfigModel requestConfig = ListViewConfigModel(
    fixedLeftColumns: 3,
    name: ListViewConfigName.request.name,
    columns: [
      TableColumnConfig(key: 'index', title: '#', width: 50, isCenter: true),
      TableColumnConfig(
        key: 'requestId',
        title: 'Request ID',
        width: 200,
        isSortable: true,
      ),
      TableColumnConfig(key: 'type', title: 'Type', width: 150),
      TableColumnConfig(
        key: 'itemCodeTesting',
        title: 'Item Code Testing',
        width: 150,
      ),
      TableColumnConfig(
        key: 'itemCodeSapUpdate',
        title: 'Item Code SAP Update',
        width: 150,
      ),
      TableColumnConfig(key: 'itemName', title: 'Item Name', width: 300),
      TableColumnConfig(key: 'category', title: 'Category', width: 150),
      TableColumnConfig(key: 'quantity', title: 'Quantity', width: 100),
      TableColumnConfig(
        key: 'plantNameRunTrials',
        title: 'Plant Name Run Trials',
        width: 150,
      ),
      TableColumnConfig(
        key: 'requestDatetime',
        title: 'Request Datetime',
        width: 150,
      ),
      TableColumnConfig(
        key: 'globalApproveDatetime',
        title: 'Global Approve Datetime',
        width: 150,
      ),
      TableColumnConfig(
        key: 'qcmApproveDatetime',
        title: 'QCM Approve Datetime',
        width: 150,
      ),
      TableColumnConfig(
        key: 'shortRunDatetime',
        title: 'Short-run Datetime',
        width: 150,
      ),
    ],
  );
}
