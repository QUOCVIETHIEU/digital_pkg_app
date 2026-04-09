import 'package:tableview2/tableview2.dart';

import '../../constants/enums.dart';

class ListViewConfigProvider {
  static final Map<String, ListViewConfigModel> configs = {
    ListViewConfigName.request.name: ListViewConfigModel(
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
    ),
  };
}
