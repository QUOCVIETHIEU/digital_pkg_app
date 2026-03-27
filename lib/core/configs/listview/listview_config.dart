import 'package:flutter/material.dart';

import '../../../common/helpers/screen_utils.dart';
import '../../../common/models/listview_config_model.dart';
import '../../../common/models/table_column_config.dart';
import '../../../core/constants/enums.dart';

class ListViewConfigProvider {
  static bool _isInitialized = false;

  // Static variables for all ListViewConfigModel definitions
  static const ListViewConfigModel bom = ListViewConfigModel(
    name: ListViewConfigName.bom,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Tên B.O.M',
        width: 300,
        key: 'name',
        isCenter: false,
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Unit',
        width: 100,
        key: 'unit',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Formula',
        width: 250,
        key: 'formula',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 300,
        key: 'createdBy',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ngày Tạo',
        width: 250,
        key: 'createdAt',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 350,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel bomHistory = ListViewConfigModel(
    name: ListViewConfigName.bomHistory,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Tên B.O.M',
        width: 300,
        key: 'name',
        isCenter: false,
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Unit',
        width: 100,
        key: 'unit',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Formula',
        width: 250,
        key: 'formula',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 300,
        key: 'createdBy',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ngày Tạo',
        width: 250,
        key: 'createdAt',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Trạng Thái',
        width: 150,
        key: 'status',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 350,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel warehouseReceipt = ListViewConfigModel(
    name: ListViewConfigName.warehouseReceipt,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Thời Gian Nhận Phiếu',
        width: 200,
        key: 'receiptTime',
        isSortable: true,
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Mã Phiếu',
        width: 200,
        key: 'receiptCode',
        isSortable: true,
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Lập Phiếu',
        width: 200,
        key: 'createdBy',
        isSortable: true,
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Nhận Phiếu',
        width: 200,
        key: 'receivedBy',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Số Lượng', width: 200, key: 'itemCount'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 500,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel phaseDeviation = ListViewConfigModel(
    name: ListViewConfigName.phaseDeviation,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Dây Chuyền',
        width: 120,
        key: 'line',
        isCenter: false,
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Process Order',
        width: 140,
        key: 'processOrder',
        isCenter: false,
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Mẻ SX',
        width: 80,
        key: 'batch',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Sản Phẩm',
        width: 350,
        key: 'product',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Unit', width: 60, key: 'unit', isCenter: false),
      TableColumnConfig(
        title: 'Ngày Tạo',
        width: 140,
        key: 'createdDate',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 140,
        key: 'creator',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Tình Trạng', width: 120, key: 'status'),
      TableColumnConfig(
        title: 'Bao Bì',
        width: 100,
        key: 'packaging',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Mixer Tank', width: 100, key: 'mixerTank'),
      TableColumnConfig(title: 'Mã Xe', width: 100, key: 'truckCode'),
    ],
  );

  static const ListViewConfigModel pickingGroup = ListViewConfigModel(
    name: ListViewConfigName.pickingGroup,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Item Code', width: 120, key: 'itemCode'),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'name',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Khối Lượng Đã Soạn',
        width: 160,
        key: 'preparedQuantity',
      ),
      TableColumnConfig(
        title: 'Số Bao Gói Đã Soạn',
        width: 140,
        key: 'preparedPackages',
      ),
      TableColumnConfig(title: 'Đơn Vị Thực Tế', width: 80, key: 'unitReal'),
      TableColumnConfig(title: 'Trạng Thái', width: 200, key: 'status'),
      TableColumnConfig(
        title: 'Thời Gian Bắt Đầu Soạn',
        width: 180,
        key: 'startTime',
      ),
      TableColumnConfig(
        title: 'Thời Gian Kết Thúc Soạn',
        width: 180,
        key: 'endScanTime',
      ),
      TableColumnConfig(
        title: 'Số Lần Cảnh Báo',
        width: 160,
        key: 'warningCount',
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel pickingLabel = ListViewConfigModel(
    isHaveCheckBox: true,
    name: ListViewConfigName.pickingLabel,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: 'Thời Gian Soạn', width: 120, key: 'scanTime'),
      TableColumnConfig(
        title: 'QR ID',
        width: 300,
        key: 'qrId',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Mã Nguyên Liệu',
        width: 150,
        key: 'materialCode',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Loại Hàng', width: 100, key: 'materialType'),
      TableColumnConfig(title: 'Batch Lot', width: 120, key: 'batch'),
      TableColumnConfig(title: 'HSD SAP', width: 120, key: 'expirySAP'),
      TableColumnConfig(title: 'HSD Thực Tế', width: 120, key: 'expiry'),
      TableColumnConfig(title: 'Quantity', width: 100, key: 'quantity'),
      TableColumnConfig(title: 'Đơn Vị Thực Tế', width: 80, key: 'unitReal'),
      TableColumnConfig(
        title: 'Người Soạn',
        width: 200,
        key: 'preparer',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel mixingLabel = ListViewConfigModel(
    isHaveCheckBox: true,
    name: ListViewConfigName.mixingLabel,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(
        title: 'Thời Gian Pha Chế',
        width: 120,
        key: 'mixingTime',
      ),
      TableColumnConfig(
        title: 'QR ID',
        width: 300,
        key: 'qrId',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Mã Nguyên Liệu',
        width: 150,
        key: 'materialCode',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Loại Hàng', width: 100, key: 'materialType'),
      TableColumnConfig(title: 'Batch Lot', width: 120, key: 'batch'),
      TableColumnConfig(title: 'HSD SAP', width: 120, key: 'expirySAP'),
      TableColumnConfig(title: 'HSD Thực Tế', width: 120, key: 'expiry'),
      TableColumnConfig(title: 'Quantity', width: 100, key: 'quantity'),
      TableColumnConfig(title: 'Đơn Vị Thực Tế', width: 80, key: 'unitReal'),
      TableColumnConfig(
        title: 'Người Soạn',
        width: 200,
        key: 'preparer',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel mixingGroup = ListViewConfigModel(
    name: ListViewConfigName.mixingGroup,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Nhóm', width: 100, key: 'loop', minWidth: 100),
      TableColumnConfig(title: 'Thứ Tự Pha Chế', width: 80, key: 'sequence'),
      TableColumnConfig(title: 'Item code', width: 100, key: 'itemCode'),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNameSyrup',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Khối Lượng Đã Pha Chế',
        width: 100,
        key: 'weight',
      ),
      TableColumnConfig(
        title: 'Số Bao Gói Đã Pha Chế',
        width: 120,
        key: 'totalPackage',
      ),
      TableColumnConfig(title: 'Đơn Vị Thực Tế', width: 80, key: 'unitReal'),
      TableColumnConfig(title: 'Trạng Thái', width: 200, key: 'status'),
      TableColumnConfig(
        title: 'Thời Gian Bắt Đầu Pha Chế',
        width: 140,
        key: 'startTime',
      ),
      TableColumnConfig(
        title: 'Thời Gian Kết Thúc Pha Chế',
        width: 140,
        key: 'endMixingTime',
      ),
      TableColumnConfig(
        title: 'Số Lần Cảnh Báo',
        width: 160,
        key: 'warningCount',
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel returnGoods = ListViewConfigModel(
    name: ListViewConfigName.returnGoods,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Thời Gian Lập Phiếu',
        width: 200,
        key: 'createdTime',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Mã Phiếu',
        width: 200,
        key: 'slipCode',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Lập Phiếu',
        width: 200,
        key: 'createdBy',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Gửi Đề Xuất',
        width: 200,
        key: 'proposer',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Hủy Phiếu',
        width: 200,
        key: 'canceller',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Trạng Thái Phiếu', width: 150, key: 'status'),
      TableColumnConfig(title: 'Số Lượng Nhãn', width: 120, key: 'labelCount'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel returnGoodsLabel = ListViewConfigModel(
    name: ListViewConfigName.returnGoodsLabel,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Thời Gian Nhận',
        width: 150,
        key: 'receivedTime',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Qr ID',
        width: 300,
        key: 'qrId',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Batch Lot',
        width: 120,
        key: 'batch',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'HSD',
        width: 120,
        key: 'expiry',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Mã Nguyên Liệu',
        width: 150,
        key: 'materialCode',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Item Code',
        width: 120,
        key: 'itemCode',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Process Order',
        width: 140,
        key: 'processOrder',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Reservation',
        width: 120,
        key: 'reservation',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNameSyrup',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Quantity', width: 100, key: 'quantity'),
      TableColumnConfig(title: 'Đơn Vị', width: 80, key: 'unit'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 200,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel returnMaterial = ListViewConfigModel(
    name: ListViewConfigName.returnMaterial,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(
        title: 'Qr ID',
        width: 300,
        key: 'qrId',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Batch Lot',
        width: 120,
        key: 'batch',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'HSD',
        width: 120,
        key: 'expiryDate',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Mã Nguyên Liệu',
        width: 150,
        key: 'materialCode',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Item Code',
        width: 120,
        key: 'itemCode',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNameSyrup',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Quantity', width: 100, key: 'quantity'),
      TableColumnConfig(
        title: 'Unit Tổng',
        width: 100,
        key: 'totalUnit',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Unit Hoàn Kho',
        width: 120,
        key: 'returnedUnit',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Đơn Vị',
        width: 80,
        key: 'unit',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel syrupMixing = ListViewConfigModel(
    name: ListViewConfigName.syrupMixing,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(
        title: 'Giờ Pha Chế',
        width: 200,
        key: 'mixingTime',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Trạm Pha Chế',
        width: 200,
        key: 'station',
        isCenter: false,
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'B.O.M',
        width: 300,
        key: 'bom',
        isCenter: false,
        isSortable: true,
      ),
      TableColumnConfig(title: 'Mẻ', width: 100, key: 'batch', isCenter: true),
      TableColumnConfig(title: 'Loop', width: 100, key: 'loop', isCenter: true),
      TableColumnConfig(
        title: 'Tiến Độ',
        width: 100,
        key: 'progress',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Dây Chuyền',
        width: 150,
        key: 'line',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Bao Bì',
        width: 150,
        key: 'packaging',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 450,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel weightQrCode = ListViewConfigModel(
    name: ListViewConfigName.weightQrCode,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Mã Qr ID', width: 300, key: 'qrId'),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 360, key: 'createdAt'),
      TableColumnConfig(
        title: 'Tên Nguyên Liệu',
        width: 360,
        key: 'materialName',
      ),
      TableColumnConfig(title: 'Số Lô', width: 360, key: 'lotNumber'),
      TableColumnConfig(title: 'Ngày SX', width: 240, key: 'productionDate'),
      TableColumnConfig(title: 'Hạn SD', width: 240, key: 'expiryDate'),
      TableColumnConfig(title: 'Số Lần In', width: 160, key: 'printCount'),
      TableColumnConfig(title: 'Khối Lượng', width: 200, key: 'weight'),
      TableColumnConfig(title: 'Qr ID', width: 300, key: 'qrID'),
    ],
  );

  static const ListViewConfigModel weightReport = ListViewConfigModel(
    name: ListViewConfigName.weightReport,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Thời Gian In',
        width: 240,
        key: 'printTime',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Loại Cân',
        width: 240,
        key: 'weighingType',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Mã Nhân Viên',
        width: 180,
        key: 'employeeId',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Tên Nhân Viên',
        width: 220,
        key: 'employeeName',
        isSortable: true,
      ),
      TableColumnConfig(title: 'Mã Nguyên Liệu', width: 220, key: 'materialId'),
      TableColumnConfig(
        title: 'Tên Nguyên Liệu',
        width: 320,
        key: 'materialName',
      ),
      TableColumnConfig(title: 'Item Code', width: 180, key: 'itemCode'),
      TableColumnConfig(title: 'Net', width: 120, key: 'net'),
      TableColumnConfig(title: 'Tare', width: 120, key: 'tare'),
      TableColumnConfig(title: 'Gross', width: 120, key: 'gross'),
    ],
  );

  static const ListViewConfigModel weighingAlarm = ListViewConfigModel(
    name: ListViewConfigName.weighingAlarm,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: 'Thời Gian', width: 240, key: 'time'),
      TableColumnConfig(title: 'Mã Alarm', width: 240, key: 'alarmCode'),
      TableColumnConfig(title: 'Thông Tin Lỗi', width: 400, key: 'alarmInfo'),
      TableColumnConfig(title: 'Ghi Chú', width: 500, key: 'note'),
    ],
  );

  static const ListViewConfigModel
  storageProcessOrderDetail = ListViewConfigModel(
    name: ListViewConfigName.storageProcessOrderDetail,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Mã Nguyên Liệu', width: 320, key: 'materialId'),
      TableColumnConfig(
        title: 'Tên Nguyên Liệu',
        width: 440,
        key: 'materialName',
      ),
      TableColumnConfig(title: 'Item Code', width: 240, key: 'itemCode'),
      TableColumnConfig(title: 'Batch Lot', width: 240, key: 'batch'),
      TableColumnConfig(title: 'HSD', width: 240, key: 'expiryDate'),
      TableColumnConfig(title: 'Qty Received', width: 240, key: 'qtyReceived'),
      TableColumnConfig(title: 'Qty Remain', width: 240, key: 'qtyRemain'),
      TableColumnConfig(title: 'PO Transfer', width: 240, key: 'poTransfer'),
      TableColumnConfig(title: 'Qty Transfer', width: 240, key: 'qtyTransfer'),
      TableColumnConfig(title: 'Qty Return', width: 240, key: 'qtyReturn'),
      TableColumnConfig(title: 'Qty Loss', width: 240, key: 'qtyLoss'),
      TableColumnConfig(title: 'Đơn Vị', width: 160, key: 'unit'),
      TableColumnConfig(title: 'Ghi Chú Hao Hụt', width: 360, key: 'lossNote'),
    ],
  );

  static const ListViewConfigModel kronesEdiMessages = ListViewConfigModel(
    name: ListViewConfigName.kronesEdiMessages,
    isHaveCheckBox: true,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Thời Gian Tạo',
        width: 180,
        key: 'createdDatetime',
      ),
      TableColumnConfig(title: 'Message ID', width: 280, key: 'messageId'),
      TableColumnConfig(title: 'Trạng Thái', width: 200, key: 'status'),
      TableColumnConfig(
        title: 'Mô Tả Chi Tiết',
        width: 500,
        key: 'detailedDescription',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 400,
        key: 'notes',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel kronesEdiMessagesHistory =
      ListViewConfigModel(
        name: ListViewConfigName.kronesEdiMessagesHistory,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(title: '#', width: 50, key: 'index', minWidth: 32),
          TableColumnConfig(
            title: 'Thời Gian Tạo',
            width: 180,
            key: 'createdDatetime',
          ),
          TableColumnConfig(title: 'Message ID', width: 280, key: 'messageId'),
          TableColumnConfig(title: 'Trạng Thái', width: 200, key: 'status'),
          TableColumnConfig(
            title: 'Mô Tả Chi Tiết',
            width: 500,
            key: 'detailedDescription',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Ghi Chú',
            width: 400,
            key: 'notes',
            isCenter: false,
          ),
        ],
      );

  static const ListViewConfigModel kronesMasterData = ListViewConfigModel(
    name: ListViewConfigName.kronesMasterData,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Item Code',
        width: 150,
        key: 'itemCode',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Item Name SAP',
        width: 400,
        key: 'itemNameSap',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Supplier SAP ID',
        width: 150,
        key: 'supplierSapId',
      ),
      TableColumnConfig(
        title: 'Category Code',
        width: 120,
        key: 'categoryCode',
      ),
      TableColumnConfig(
        title: 'Category Name',
        width: 200,
        key: 'categoryName',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Shelf-Life', width: 100, key: 'shelfLife'),
      TableColumnConfig(title: 'License Date', width: 120, key: 'licenseDate'),
      TableColumnConfig(title: 'Quantity', width: 100, key: 'quantity'),
      TableColumnConfig(title: 'Unit', width: 80, key: 'unit'),
      TableColumnConfig(title: 'Format', width: 100, key: 'format'),
      TableColumnConfig(title: 'Dimension', width: 120, key: 'dimension'),
      TableColumnConfig(title: 'Color', width: 100, key: 'color'),
      TableColumnConfig(
        title: 'Action Indicator',
        width: 150,
        key: 'actionIndicator',
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 200,
        key: 'notes',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel kronesStationTank = ListViewConfigModel(
    name: ListViewConfigName.kronesStationTank,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Station ID',
        width: 300,
        key: 'stationId',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Station Name',
        width: 150,
        key: 'stationName',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Station Code', width: 120, key: 'stationCode'),
      TableColumnConfig(
        title: 'Thời Gian Tạo',
        width: 150,
        key: 'createdDatetime',
      ),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 200,
        key: 'userCreatedFullName',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Trạng Thái', width: 120, key: 'status'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'notes',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel kronesMixingTankDetail = ListViewConfigModel(
    name: ListViewConfigName.kronesMixingTankDetail,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Station ID',
        width: 300,
        key: 'stationId',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Station Name',
        width: 150,
        key: 'stationName',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Station Code', width: 120, key: 'stationCode'),
      TableColumnConfig(
        title: 'Thời Gian Tạo',
        width: 150,
        key: 'createdDatetime',
      ),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 200,
        key: 'userCreatedFullName',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Trạng Thái', width: 120, key: 'status'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'notes',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel kronesRecipe = ListViewConfigModel(
    name: ListViewConfigName.kronesRecipe,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Recipe ID', width: 150, key: 'recipeId'),
      TableColumnConfig(
        title: 'Recipe Name',
        width: 150,
        key: 'recipeName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Recipe Version',
        width: 120,
        key: 'recipeVersion',
      ),
      TableColumnConfig(title: 'B.O.M ID', width: 100, key: 'bomId'),
      TableColumnConfig(
        title: 'B.O.M Alternative',
        width: 120,
        key: 'bomAlternative',
      ),
      TableColumnConfig(title: 'Unit Size', width: 80, key: 'unitSize'),
      TableColumnConfig(title: 'Trạng Thái', width: 100, key: 'status'),
      TableColumnConfig(
        title: 'Thời Gian Tạo',
        width: 130,
        key: 'createdDatetime',
      ),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 120,
        key: 'userCreatedFullName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 120,
        key: 'notes',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel kronesBatch = ListViewConfigModel(
    name: ListViewConfigName.kronesBatch,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Batch ID', width: 300, key: 'batchId'),
      TableColumnConfig(title: 'Batch Number', width: 100, key: 'batchNumber'),
      TableColumnConfig(
        title: 'Process Order',
        width: 130,
        key: 'processOrderNumber',
      ),
      TableColumnConfig(title: 'Recipe ID', width: 120, key: 'recipeId'),
      TableColumnConfig(
        title: 'Recipe Version',
        width: 130,
        key: 'recipeVersion',
      ),
      TableColumnConfig(title: 'B.O.M ID', width: 120, key: 'bomId'),
      TableColumnConfig(
        title: 'B.O.M Alternative',
        width: 150,
        key: 'bomAlternative',
      ),
      TableColumnConfig(title: 'Unit Size', width: 100, key: 'unitSize'),
      TableColumnConfig(title: 'Trạng Thái', width: 120, key: 'status'),
      TableColumnConfig(title: 'Mã Sản Phẩm', width: 150, key: 'productCode'),
      TableColumnConfig(
        title: 'Tên Sản Phẩm',
        width: 200,
        key: 'productName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Thời Gian Tạo',
        width: 150,
        key: 'createdDatetime',
      ),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 150,
        key: 'userCreatedFullName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 200,
        key: 'notes',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel kronesPickingProcess = ListViewConfigModel(
    name: ListViewConfigName.kronesPickingProcess,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Batch ID', width: 300, key: 'batchId'),
      TableColumnConfig(title: 'Batch Number', width: 100, key: 'batchNumber'),
      TableColumnConfig(
        title: 'Process Order',
        width: 130,
        key: 'processOrderNumber',
      ),
      TableColumnConfig(title: 'Recipe ID', width: 120, key: 'recipeId'),
      TableColumnConfig(
        title: 'Recipe Version',
        width: 130,
        key: 'recipeVersion',
      ),
      TableColumnConfig(title: 'B.O.M ID', width: 120, key: 'bomId'),
      TableColumnConfig(
        title: 'B.O.M Alternative',
        width: 150,
        key: 'bomAlternative',
      ),
      TableColumnConfig(title: 'Unit Size', width: 100, key: 'unitSize'),
      TableColumnConfig(title: 'Trạng Thái', width: 120, key: 'status'),
      TableColumnConfig(title: 'Mã Sản Phẩm', width: 150, key: 'productCode'),
      TableColumnConfig(
        title: 'Tên Sản Phẩm',
        width: 200,
        key: 'productName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Thời Gian Tạo',
        width: 150,
        key: 'createdDatetime',
      ),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 150,
        key: 'userCreatedFullName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 200,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel kronesProcessOrders = ListViewConfigModel(
    name: ListViewConfigName.kronesProcessOrder,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Planned Date', width: 120, key: 'plannedDate'),
      TableColumnConfig(
        title: 'Số Process Order',
        width: 130,
        key: 'processOrderNumber',
      ),
      TableColumnConfig(title: 'Line Name', width: 120, key: 'lineName'),
      TableColumnConfig(title: 'Mã Sản Phẩm', width: 120, key: 'productCode'),
      TableColumnConfig(
        title: 'Tên Sản Phẩm',
        width: 200,
        key: 'productName',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Quantity (L)', width: 100, key: 'quantity'),
      TableColumnConfig(title: 'Trạng Thái', width: 80, key: 'status'),
      TableColumnConfig(title: 'B.O.M ID', width: 100, key: 'bomId'),
      TableColumnConfig(
        title: 'B.O.M Name',
        width: 200,
        key: 'bomName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'B.O.M Alternative',
        width: 120,
        key: 'bomAlternative',
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 120,
        key: 'notes',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel kronesQualityManagement =
      ListViewConfigModel(
        name: ListViewConfigName.kronesQualityManagement,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(title: '#', width: 50, key: 'index', minWidth: 32),
          TableColumnConfig(
            title: 'Plant ID',
            width: 100,
            key: 'plantId',
            isSortable: true,
          ),
          TableColumnConfig(
            title: 'Item Code',
            width: 150,
            key: 'itemCode',
            isSortable: true,
          ),
          TableColumnConfig(
            title: 'QM Status',
            width: 100,
            key: 'qmStatus',
            isSortable: true,
          ),
          TableColumnConfig(
            title: 'Ghi Chú',
            width: 200,
            key: 'notes',
            isCenter: false,
          ),
        ],
      );

  static const ListViewConfigModel kronesVariant = ListViewConfigModel(
    name: ListViewConfigName.kronesVariant,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Item Code',
        width: 150,
        key: 'itemCode',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Material ID',
        width: 150,
        key: 'materialId',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Material Note',
        width: 150,
        key: 'materialNote',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 200,
        key: 'notes',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel kronesTanks = ListViewConfigModel(
    name: ListViewConfigName.kronesTanks,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Tank ID',
        width: 300,
        key: 'tankId',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Tank Name',
        width: 150,
        key: 'tankName',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Thời Gian Tạo',
        width: 200,
        key: 'createdDatetime',
        isCenter: false,
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 200,
        key: 'userCreatedFullName',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Trạng Thái',
        width: 150,
        key: 'status',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 200,
        key: 'notes',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel kronesLineItems = ListViewConfigModel(
    name: ListViewConfigName.kronesLineItems,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Process Order',
        width: 150,
        key: 'processOrder',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Item No',
        width: 100,
        key: 'itemNo',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Item Code',
        width: 150,
        key: 'itemCode',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Item Name',
        width: 400,
        key: 'itemName',
        isCenter: false,
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Storage Loc',
        width: 120,
        key: 'storageLoc',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Require Quantity',
        width: 150,
        key: 'requireQuantity',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Withdraw Quantity',
        width: 150,
        key: 'withdrawQuantity',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Confirm Quantity',
        width: 150,
        key: 'confirmQuantity',
        isSortable: true,
      ),
      TableColumnConfig(title: 'UOM', width: 100, key: 'uom', isSortable: true),
      TableColumnConfig(
        title: 'Item Text',
        width: 200,
        key: 'itemText',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 100,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel kronesBatchItems = ListViewConfigModel(
    name: ListViewConfigName.kronesBatchItems,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Process Order',
        width: 150,
        key: 'processOrder',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Item No',
        width: 100,
        key: 'itemNo',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Item Code',
        width: 150,
        key: 'itemCode',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Item Name',
        width: 400,
        key: 'itemName',
        isCenter: false,
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Batch',
        width: 150,
        key: 'batch',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Withdraw Quantity',
        width: 150,
        key: 'withdrawQuantity',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Confirm Quantity',
        width: 150,
        key: 'confirmQuantity',
        isSortable: true,
      ),
      TableColumnConfig(title: 'UOM', width: 100, key: 'uom', isSortable: true),
      TableColumnConfig(
        title: 'Item Text',
        width: 200,
        key: 'itemText',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel kronesBatchDetails = ListViewConfigModel(
    name: ListViewConfigName.kronesBatchDetails,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Nhóm',
        width: 80,
        key: 'groupNo',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Thứ Tự Pha Chế',
        width: 120,
        key: 'sequence',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Thời Gian Pha Chế (phút)',
        width: 150,
        key: 'mixingTime',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Item Code',
        width: 120,
        key: 'itemCode',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemName',
        isCenter: false,
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Total Quantity',
        width: 120,
        key: 'quantity',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Đơn Vị Thực Tế',
        width: 120,
        key: 'unitReal',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Số Lượng Gói',
        width: 120,
        key: 'packCount',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 200,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel kronesPickingProcessDetails =
      ListViewConfigModel(
        name: ListViewConfigName.kronesPickingProcessDetails,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(title: '#', width: 50, key: 'index', minWidth: 32),
          TableColumnConfig(
            title: 'Thời Gian Soạn',
            width: 150,
            key: 'createdDatetime',
            isSortable: true,
          ),
          TableColumnConfig(
            title: 'QR ID',
            width: 250,
            key: 'qrId',
            isSortable: true,
          ),
          TableColumnConfig(
            title: 'Mã Nguyên Liệu',
            width: 200,
            key: 'materialCode',
            isSortable: true,
          ),
          TableColumnConfig(
            title: 'Loại Hàng',
            width: 120,
            key: 'materialType',
            isSortable: true,
          ),
          TableColumnConfig(
            title: 'Batch Lot',
            width: 150,
            key: 'batch',
            isCenter: true,
            isSortable: true,
          ),
          TableColumnConfig(
            title: 'HSD SAP',
            width: 120,
            key: 'expirySAP',
            isSortable: true,
          ),
          TableColumnConfig(
            title: 'HSD Thực Tế',
            width: 120,
            key: 'expiry',
            isSortable: true,
          ),
          TableColumnConfig(
            title: 'Quantity',
            width: 120,
            key: 'quantity',
            isSortable: true,
          ),
          TableColumnConfig(
            title: 'Đơn Vị Thực Tế',
            width: 150,
            key: 'unitReal',
            isSortable: true,
          ),
          TableColumnConfig(
            title: 'Người Soạn',
            width: 200,
            key: 'preparer',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Ghi Chú',
            width: 200,
            key: 'note',
            isCenter: false,
          ),
        ],
      );
  static const ListViewConfigModel kronesRecipeInfoGroupDetail =
      ListViewConfigModel(
        name: ListViewConfigName.kronesRecipeInfoGroupDetail,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
          TableColumnConfig(title: 'Nhóm', width: 80, key: 'groupNo'),
          TableColumnConfig(
            title: 'Thời Gian Pha Chế (phút)',
            width: 140,
            key: 'mixingTime',
          ),
          TableColumnConfig(
            title: 'Danh sách Mixer Tank',
            width: 500,
            key: 'mixerTank',
            isCenter: false,
          ),
          TableColumnConfig(title: 'Trích Ly', width: 500, key: 'isExtracted'),
          TableColumnConfig(
            title: 'Ghi Chú',
            width: 700,
            key: 'note',
            isCenter: false,
          ),
        ],
      );
  static const ListViewConfigModel
  kronesRecipeInfoMaterialDetail = ListViewConfigModel(
    name: ListViewConfigName.kronesRecipeInfoMaterialDetail,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Item Code', width: 120, key: 'itemCode'),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNameSyrup',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Total Quantity',
        width: 120,
        key: 'totalQuantity',
      ),
      TableColumnConfig(title: 'Đơn Vị Thực Tế', width: 80, key: 'unitReal'),
      TableColumnConfig(title: 'Số Lượng Gói', width: 100, key: 'packCount'),
      TableColumnConfig(
        title: 'Chấp Nhận Sai Số',
        width: 100,
        key: 'isAcceptableTolerance',
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 700,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  // Main configs map
  static Map<ListViewConfigName, ListViewConfigModel> configs = {
    ListViewConfigName.materialRaw: materialRaw,
    ListViewConfigName.materialVariant: materialVariant,
    ListViewConfigName.materialVariantHistory: materialVariantHistory,
    ListViewConfigName.bomSap: bomSap,
    ListViewConfigName.recipe: recipe,
    ListViewConfigName.bom: bom,
    ListViewConfigName.bomHistory: bomHistory,
    ListViewConfigName.bomDetail: bomDetail,
    ListViewConfigName.recipeInfo: recipeInfo,
    ListViewConfigName.recipeInfoHistory: recipeInfoHistory,
    ListViewConfigName.product: product,
    ListViewConfigName.warehouseReceipt: warehouseReceipt,
    ListViewConfigName.storageReturnWarehouse: storageReturnWarehouse,
    ListViewConfigName.storageReturnWarehouseItem: storageReturnWarehouseItem,
    ListViewConfigName.storageReturnWarehouseItemQrCode:
        storageReturnWarehouseItemQrCode,
    ListViewConfigName.warehouseDetail: warehouseDetail,
    ListViewConfigName.phaseDeviation: phaseDeviation,
    ListViewConfigName.pickingGroup: pickingGroup,
    ListViewConfigName.pickingLabel: pickingLabel,
    ListViewConfigName.mixingGroup: mixingGroup,
    ListViewConfigName.mixingLabel: mixingLabel,
    ListViewConfigName.returnGoods: returnGoods,
    ListViewConfigName.returnGoodsLabel: returnGoodsLabel,
    ListViewConfigName.returnMaterial: returnMaterial,
    ListViewConfigName.syrupMixing: syrupMixing,
    ListViewConfigName.syrupMixingProcessOrder: syrupMixingProcessOrder,
    ListViewConfigName.syrupMixingProcessOrderSugarConsumption:
        syrupMixingProcessOrderSugarConsumption,
    ListViewConfigName.syrupMixingSugarConsumptionBatch:
        syrupMixingSugarConsumptionBatch,
    ListViewConfigName.syrupMixingBatch: syrupMixingBatch,
    ListViewConfigName.syrupMixingHistoryGoodsReceiptOrder:
        syrupMixingHistoryGoodsReceiptOrder,
    ListViewConfigName.syrupMixingBatchDetail: syrupMixingBatchDetail,
    ListViewConfigName.syrupMixingMaterialReconcile:
        syrupMixingMaterialReconcile,
    ListViewConfigName.syrupMixingHistoryMaterialReconcile:
        syrupMixingHistoryMaterialReconcile,
    ListViewConfigName.syrupMixingSettingProductionLine:
        mixingSettingProductionLine,
    ListViewConfigName.syrupMixingSettingMixerTank: mixingSettingMixerTank,
    ListViewConfigName.syrupMixingSettingMixingTank: mixingSettingMixingTank,
    ListViewConfigName.syrupMixingSettingStation: mixingSettingStation,
    ListViewConfigName.syrupMixingSettingDosingLine: mixingSettingDosingLine,
    ListViewConfigName.syrupMixingSettingBagSize: mixingSettingBagSize,
    ListViewConfigName.syrupMixingSettingCart: mixingSettingCart,
    ListViewConfigName.syrupMixingHistorySettingProductionLine:
        mixingHistorySettingProductionLine,
    ListViewConfigName.syrupMixingHistorySettingMixerTank:
        mixingHistorySettingMixerTank,
    ListViewConfigName.syrupMixingHistorySettingMixingTank:
        mixingHistorySettingMixingTank,
    ListViewConfigName.syrupMixingHistorySettingStation:
        mixingHistorySettingStation,
    ListViewConfigName.syrupMixingHistorySettingDosingLine:
        mixingHistorySettingDosingLine,
    ListViewConfigName.syrupMixingHistorySettingBagSize:
        mixingHistorySettingBagSize,
    ListViewConfigName.syrupMixingHistorySettingCart: mixingHistorySettingCart,
    ListViewConfigName.syrupMixingHistoryReconCile: syrupMixingHistoryReconCile,
    ListViewConfigName.syrupMixingHistoryConsumption:
        syrupMixingHistoryConsumption,
    ListViewConfigName.syrupMixingMaterialWasted: materialWasted,
    ListViewConfigName.syrupMixingAlarm: syrupMixingAlarm,
    ListViewConfigName.weighProcessOrder: weighProcessOrder,
    ListViewConfigName.weightCommand: weightCommand,
    ListViewConfigName.weighBatch: weighBatch,
    ListViewConfigName.weighItem: weighItem,
    ListViewConfigName.weighReturnProcessOrder: weighReturnProcessOrder,
    ListViewConfigName.weighReturnRequest: weighReturnRequest,
    ListViewConfigName.syrupMixingConsumption: syrupMixingConsumption,
    ListViewConfigName.syrupMixingConfirmConsumption:
        syrupMixingConfirmConsumption,
    ListViewConfigName.syrupMixingTransfer: syrupMixingTransfer,
    ListViewConfigName.syrupMixingGoodsReceiptOrder:
        syrupMixingGoodsReceiptOrder,
    ListViewConfigName.syrupMixingConfirmReconcile: syrupMixingConfirmReconcile,
    ListViewConfigName.syrupMixingConfirmGoodReceipt:
        syrupMixingConfirmGoodReceipt,
    ListViewConfigName.weightQrCode: weightQrCode,
    ListViewConfigName.weightReport: weightReport,
    ListViewConfigName.weighingAlarm: weighingAlarm,
    ListViewConfigName.storageProcessOrder: storageProcessOrder,
    ListViewConfigName.storageProcessOrderDetail: storageProcessOrderDetail,
    ListViewConfigName.storageReturnGoodsProcessOrder:
        storageReturnGoodsProcessOrder,
    ListViewConfigName.storageReturnGoodsWarehouseDetail:
        storageReturnGoodsWarehouseDetail,
    ListViewConfigName.onHandQrCode: onHandQrCode,
    ListViewConfigName.recipeGroupDetail: recipeGroupDetail,
    ListViewConfigName.recipeMaterialDetail: recipeMaterialDetail,
    ListViewConfigName.recipeInfoGroupDetail: recipeInfoGroupDetail,
    ListViewConfigName.recipeInfoMaterialDetail: recipeInfoMaterialDetail,
    ListViewConfigName.weighCommandQr: weighCommandQr,
    ListViewConfigName.packageQrCode: packageQrCode,
    ListViewConfigName.itemWeighReturnMaterial: itemWeighReturnMaterial,
    ListViewConfigName.weighReturnMaterialQrItem: weighReturnMaterialQrItem,
    ListViewConfigName.kronesEdiMessages: kronesEdiMessages,
    ListViewConfigName.kronesEdiMessagesHistory: kronesEdiMessagesHistory,
    ListViewConfigName.kronesMasterData: kronesMasterData,
    ListViewConfigName.kronesStationTank: kronesStationTank,
    ListViewConfigName.kronesMixingTankDetail: kronesMixingTankDetail,
    ListViewConfigName.kronesStationMixingTank: kronesStationMixingTankDetail,
    ListViewConfigName.kronesProcessOrder: kronesProcessOrders,
    ListViewConfigName.kronesRecipe: kronesRecipe,
    ListViewConfigName.kronesBatch: kronesBatch,
    ListViewConfigName.kronesPickingProcess: kronesPickingProcess,
    ListViewConfigName.kronesQualityManagement: kronesQualityManagement,
    ListViewConfigName.kronesVariant: kronesVariant,
    ListViewConfigName.kronesTanks: kronesTanks,
    ListViewConfigName.kronesLineItems: kronesLineItems,
    ListViewConfigName.kronesBatchItems: kronesBatchItems,
    ListViewConfigName.kronesBatchDetails: kronesBatchDetails,
    ListViewConfigName.kronesPickingProcessDetails: kronesPickingProcessDetails,
    ListViewConfigName.kronesRecipeInfoGroupDetail: kronesRecipeInfoGroupDetail,
    ListViewConfigName.kronesRecipeInfoMaterialDetail:
        kronesRecipeInfoMaterialDetail,
    //krones Inbound
    ListViewConfigName.kronesInbound: kronesInbound,
    ListViewConfigName.kronesMixing: kronesDetail,
    ListViewConfigName.kronesMixingHistoryDetail: kronesMixingHistoryDetail,
    //material process order
    ListViewConfigName.materialProcessOrder: materialProcessOrder,
    ListViewConfigName.materialProcessOrderItem: materialProcessOrderItem,
    ListViewConfigName.materialBatchItem: materialBatchItem,
    // mixing batch detail
    ListViewConfigName.mixingBatchDetail: mixingBatchDetail,
    ListViewConfigName.mixingBatchItem: mixingBatchItem,
    ListViewConfigName.mixingWeightProgress: mixingWeightProgress,
    ListViewConfigName.mixingWeightProgressDetail: mixingWeightProgressDetail,

    ListViewConfigName.warningHistoryPreparation: warningHistoryPreparation,
    ListViewConfigName.warningHistoryMixing: warningHistoryMixing,
    ListViewConfigName.warningHistoryWeight: warningHistoryWeight,
    ListViewConfigName.deviceManagerPrinter: deviceManagerPrinter,
    ListViewConfigName.deviceManagerScale: deviceManagerScale,

    ListViewConfigName.mappingBatchFormCurrent: mappingBatchFormCurrent,
    ListViewConfigName.mappingBatchFormMapping: mappingBatchFormMapping,
    ListViewConfigName.poItemList: poItemList,
    ListViewConfigName.syrupMixingHistoryGoodsReceiptOrderEdi:
        syrupMixingHistoryGoodsReceiptOrderEdi,
    ListViewConfigName.consumptionManyTime: consumptionManyTime,
    ListViewConfigName.ediHistoryConsumption: ediHistoryConsumption,
    ListViewConfigName.mappingBatchFormQrCode: mappingBatchFormQrCode,
    ListViewConfigName.mappingBatchFormQrCodeMapping:
        mappingBatchFormQrCodeMapping,
  };

  // Method to initialize configs with a specific screen size
  static Future<void> initializeConfigsWithScreenSizeFromSize() async {
    final logicalSize = await ScreenUtils.getDeviceScreenSize();
    for (final entry in configs.entries) {
      final adjustedConfig = entry.value.adjustLastColumnWidth(logicalSize);
      configs[entry.key] = adjustedConfig;
    }
    _isInitialized = true;
    _lastUsedSize = logicalSize;
  }

  // Check if configs have been initialized with screen size
  static bool get isInitialized {
    return _isInitialized;
  }

  // Get the current screen size used for initialization (for debugging)
  static Size? _lastUsedSize;
  static Size? get lastUsedSize => _lastUsedSize;

  static const ListViewConfigModel recipeGroupDetail = ListViewConfigModel(
    name: ListViewConfigName.recipeGroupDetail,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Nhóm', width: 80, key: 'groupNo'),
      TableColumnConfig(
        title: 'Thời Gian Pha Chế (phút)',
        width: 140,
        key: 'mixingTime',
      ),
      TableColumnConfig(
        title: 'Danh Sách Trạm Pha Chế',
        width: 500,
        key: 'mixingStations',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Danh Sách Mixing Tank',
        width: 500,
        key: 'mixingTanks',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Danh sách Mixer Tank',
        width: 500,
        key: 'mixerTank',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Trích Ly', width: 100, key: 'isExtracted'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 700,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel recipeMaterialDetail = ListViewConfigModel(
    name: ListViewConfigName.recipeMaterialDetail,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Item Code', width: 120, key: 'itemCode'),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNameSyrup',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Total Quantity',
        width: 120,
        key: 'totalQuantity',
      ),
      TableColumnConfig(title: 'Đơn Vị Thực Tế', width: 80, key: 'unitReal'),
      TableColumnConfig(title: 'Số Lượng Gói', width: 100, key: 'packCount'),
      TableColumnConfig(
        title: 'Chấp Nhận Sai Số',
        width: 100,
        key: 'isAccepTableTolerance',
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 700,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel recipeInfoGroupDetail = ListViewConfigModel(
    name: ListViewConfigName.recipeInfoGroupDetail,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Nhóm', width: 80, key: 'groupNo'),
      TableColumnConfig(
        title: 'Thời Gian Pha Chế (phút)',
        width: 140,
        key: 'mixingTime',
      ),
      TableColumnConfig(
        title: 'Danh Sách Trạm Pha Chế',
        width: 500,
        key: 'mixingStations',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Danh Sách Mixing Tank',
        width: 500,
        key: 'mixingTanks',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Danh sách Mixer Tank',
        width: 500,
        key: 'mixerTank',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Trích Ly', width: 100, key: 'isExtracted'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 700,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel
  recipeInfoMaterialDetail = ListViewConfigModel(
    name: ListViewConfigName.recipeInfoMaterialDetail,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Item Code', width: 120, key: 'itemCode'),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNameSyrup',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Total Quantity',
        width: 120,
        key: 'totalQuantity',
      ),
      TableColumnConfig(title: 'Đơn Vị Thực Tế', width: 80, key: 'unitReal'),
      TableColumnConfig(title: 'Số Lượng Gói', width: 100, key: 'packCount'),
      TableColumnConfig(
        title: 'Chấp Nhận Sai Số',
        width: 100,
        key: 'isAccepTableTolerance',
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 700,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel materialVariant = ListViewConfigModel(
    name: ListViewConfigName.materialVariant,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Mã Nguyên Liệu',
        width: 180,
        key: 'materialId',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 200,
        key: 'userCreatedFullName',
      ),
      TableColumnConfig(
        title: 'Thời Gian Tạo',
        width: 150,
        key: 'createdDatetime',
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        isCenter: false,
        width: 700,
        key: 'note',
        maxWidth: 1000,
      ),
    ],
  );
  static const ListViewConfigModel weighCommandQr = ListViewConfigModel(
    name: ListViewConfigName.weighCommandQr,
    fixedLeftColumns: 3,
    isHaveCheckBox: true,
    columns: [
      TableColumnConfig(
        title: 'Qr ID',
        width: 180,
        key: 'materialId',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Batch', width: 150, key: 'batch'),
      TableColumnConfig(title: 'HSD', width: 130, key: 'hsd'),
      TableColumnConfig(title: 'Mã Nguyên Liệu', width: 180, key: 'materialId'),
      TableColumnConfig(title: 'Item Code', width: 150, key: 'itemCode'),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNameSyrup',
      ),
      TableColumnConfig(
        title: 'SL Ghi Nhận',
        width: 120,
        key: 'quantityRecords',
      ),
      TableColumnConfig(
        title: 'SL Tiêu Hao',
        width: 120,
        key: 'quantityConsumption',
      ),
      TableColumnConfig(title: 'Unit Tổng', width: 120, key: 'totalUnitSize'),
      TableColumnConfig(
        title: 'Unit Hoàn Kho',
        width: 120,
        key: 'totalQuantityReturn',
      ),
      TableColumnConfig(title: 'Đơn vị', width: 120, key: 'unit'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 350,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel packageQrCode = ListViewConfigModel(
    name: ListViewConfigName.packageQrCode,
    fixedLeftColumns: 3,
    isHaveCheckBox: true,
    columns: [
      TableColumnConfig(
        title: 'Qr ID',
        width: 180,
        key: 'materialId',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Batch', width: 150, key: 'batch'),
      TableColumnConfig(title: 'HSD', width: 130, key: 'hsd'),
      TableColumnConfig(title: 'Mã Nguyên Liệu', width: 180, key: 'materialId'),
      TableColumnConfig(title: 'Item Code', width: 150, key: 'itemCode'),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNameSyrup',
      ),
      TableColumnConfig(
        title: 'SL Ghi Nhận',
        width: 120,
        key: 'quantityRecords',
      ),
      TableColumnConfig(
        title: 'SL Tiêu Hao',
        width: 120,
        key: 'quantityConsumption',
      ),
      TableColumnConfig(title: 'Unit Tổng', width: 120, key: 'totalUnitSize'),
      TableColumnConfig(
        title: 'Unit Hoàn Kho',
        width: 120,
        key: 'totalQuantityReturn',
      ),
      TableColumnConfig(title: 'Đơn vị', width: 120, key: 'unit'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 350,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel itemWeighReturnMaterial =
      ListViewConfigModel(
        name: ListViewConfigName.itemWeighReturnMaterial,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
          TableColumnConfig(title: 'Item Code', width: 140, key: 'itemCode'),
          TableColumnConfig(
            title: 'Item Name SAP',
            width: 400,
            key: 'itemNameSap',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Item Name Syrup',
            width: 400,
            key: 'itemNameSyrup',
            isCenter: false,
          ),
          TableColumnConfig(title: 'Batch', width: 140, key: 'batch'),
          TableColumnConfig(
            title: 'Hạn sử dụng',
            width: 140,
            key: 'hsd',
            isCenter: true,
          ),
          TableColumnConfig(
            title: 'Số lượng nhãn',
            width: 140,
            key: 'labelQuantity',
          ),
          TableColumnConfig(
            title: 'Ghi Chú',
            isCenter: false,
            width: 700,
            key: 'note',
            maxWidth: 1000,
          ),
        ],
      );
  static const ListViewConfigModel
  weighReturnMaterialQrItem = ListViewConfigModel(
    name: ListViewConfigName.weighReturnMaterialQrItem,
    fixedLeftColumns: 3,
    isHaveCheckBox: true,
    columns: [
      TableColumnConfig(
        title: 'Thời Gian Hoàn Kho',
        width: 140,
        key: 'returnDatetime',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'QR ID',
        width: 300,
        key: 'qrID',
        isSortable: true,
        isCenter: false,
      ),
      TableColumnConfig(title: 'Loại Hàng', width: 100, key: 'materialType'),

      TableColumnConfig(
        title: 'Group Name',
        width: 220,
        key: 'groupName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Item Code',
        width: 400,
        key: 'itemCode',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNameSyrup',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Quantity Thực Tế', width: 100, key: 'quantity'),
      TableColumnConfig(title: 'Đơn Vị Thực Tế', width: 80, key: 'unit'),
      TableColumnConfig(title: 'Unit Size', width: 100, key: 'unitSize'),
      TableColumnConfig(title: 'Group ID', width: 160, key: 'groupId'),
      TableColumnConfig(
        title: 'Số Gói Trong Thùng',
        width: 120,
        key: 'packCount',
      ),
      TableColumnConfig(
        title: 'Mã Nguyên Liệu',
        width: 120,
        key: 'materialCode',
      ),
      TableColumnConfig(title: 'Batch Lot', width: 120, key: 'batch'),
      TableColumnConfig(title: 'HSD SAP', width: 120, key: 'expiryDate'),
      TableColumnConfig(
        title: 'HSD Thực Tế',
        width: 120,
        key: 'actualExpiryDate',
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 180,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel materialVariantHistory = ListViewConfigModel(
    name: ListViewConfigName.materialVariantHistory,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Mã Nguyên Liệu',
        width: 180,
        key: 'materialId',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Trạng Thái', width: 150, key: 'status'),
      TableColumnConfig(
        title: 'Người  Tạo',
        width: 150,
        key: 'userCreatedFullName',
      ),
      TableColumnConfig(
        title: 'Thời Gian Tạo',
        width: 150,
        key: 'createdDatetime',
      ),
      TableColumnConfig(
        title: 'Người Huỷ',
        width: 150,
        key: 'userDeActiveFullName',
      ),
      TableColumnConfig(
        title: 'Thời Gian Huỷ',
        width: 150,
        key: 'deActiveDatetime',
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        isCenter: false,
        width: 700,
        key: 'note',
        maxWidth: 1000,
      ),
    ],
  );
  static const ListViewConfigModel materialRaw = ListViewConfigModel(
    name: ListViewConfigName.materialRaw,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Item Code',
        width: 120,
        key: 'itemCode',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Item Name SAP',
        width: 400,
        key: 'itemNameSap',
        isSortable: true,
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNameSyrup',
        isSortable: true,
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Base Qty / 1 Gói Chẵn',
        width: 100,
        key: 'baseQty',
      ),
      TableColumnConfig(title: 'Đơn Vị Thực Tế', width: 80, key: 'unitReal'),
      TableColumnConfig(
        title: 'Unit Size / 1 Gói Chẵn',
        width: 80,
        key: 'unitSize',
      ),
      TableColumnConfig(title: 'Đơn Vị SAP', width: 80, key: 'unit'),
      TableColumnConfig(title: 'Min (%)', width: 80, key: 'min'),
      TableColumnConfig(title: 'Max (%)', width: 80, key: 'max'),
      TableColumnConfig(title: 'Có Số Lô', width: 100, key: 'isLot'),
      TableColumnConfig(title: 'NVL Cân', width: 100, key: 'isNeedToWeight'),
      TableColumnConfig(title: 'Group ID', width: 140, key: 'groupId'),
      TableColumnConfig(title: 'Group Name', width: 220, key: 'groupName'),
      TableColumnConfig(title: 'Shelf-Life', width: 140, key: 'shelfLife'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 180,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel mixingSettingCart = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingSettingCart,
    isHaveCheckBox: true,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: 'Thời Gian Tạo', width: 140, key: 'createdAt'),
      TableColumnConfig(title: 'Tên Xe / Kệ Hàng', width: 150, key: 'cartName'),

      TableColumnConfig(
        title: 'Người Tạo',
        width: 250,
        key: 'creator',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 750,
        key: 'note',
        maxWidth: 1000,
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel syrupMixingHistoryReconCile =
      ListViewConfigModel(
        name: ListViewConfigName.syrupMixingHistoryReconCile,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
          TableColumnConfig(title: 'Thời Gian', width: 140, key: 'dateTime'),
          TableColumnConfig(title: 'Message ID', width: 300, key: 'messageId'),
          TableColumnConfig(
            title: 'Người Submit',
            width: 250,
            key: 'submitter',
            isCenter: false,
          ),
          TableColumnConfig(title: 'Counter', width: 130, key: 'counter'),
          TableColumnConfig(
            title: 'Trạng Thái EDI',
            width: 130,
            key: 'edistatus',
          ),
          TableColumnConfig(
            title: 'EDI Description',
            width: 200,
            key: 'ediDescription',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Ghi Chú',
            width: 250,
            key: 'note',
            isCenter: false,
          ),
        ],
      );
  static const ListViewConfigModel syrupMixingHistoryConsumption =
      ListViewConfigModel(
        name: ListViewConfigName.syrupMixingHistoryConsumption,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
          TableColumnConfig(title: 'QC Status', width: 120, key: 'qcStatus'),
          TableColumnConfig(
            title: 'Posing Date',
            width: 150,
            key: 'postingDate',
          ),
          TableColumnConfig(
            title: 'Quantity Total (L)',
            width: 150,
            key: 'quantityTotal',
          ),
          TableColumnConfig(
            title: 'Quantity Remain (L)',
            width: 150,
            key: 'quantityRemain',
          ),
          TableColumnConfig(
            title: 'Document Header Text',
            width: 280,
            key: 'documentText',
            isCenter: false,
          ),
          TableColumnConfig(title: 'Batch', width: 130, key: 'batch'),
          TableColumnConfig(
            title: 'Material Document',
            width: 250,
            key: 'materialDocument',
          ),
        ],
      );

  static const ListViewConfigModel mixingSettingBagSize = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingSettingBagSize,
    isHaveCheckBox: true,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: 'Thời Gian Tạo', width: 140, key: 'createdAt'),
      TableColumnConfig(title: 'Tên', width: 120, key: 'name'),
      TableColumnConfig(title: 'Quy Cách', width: 100, key: 'spec'),
      TableColumnConfig(title: 'Đơn Vị Tính', width: 100, key: 'unit'),

      TableColumnConfig(
        title: 'Người Tạo',
        width: 250,
        key: 'creator',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 750,
        key: 'note',
        maxWidth: 1000,
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel bomSap = ListViewConfigModel(
    name: ListViewConfigName.bomSap,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'B.O.M ID',
        width: 125,
        key: 'id',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'B.O.M Alternative',
        width: 100,
        key: 'alternative',
      ),
      TableColumnConfig(
        title: 'B.O.M Unit Size',
        width: 100,
        key: 'bomUnitSize',
      ),
      TableColumnConfig(
        title: 'B.O.M Name',
        width: 450,
        key: 'name',
        isSortable: true,
        isCenter: false,
      ),
      TableColumnConfig(title: 'B.O.M Category', width: 120, key: 'category'),
      TableColumnConfig(title: 'Mã Sản Phẩm', width: 120, key: 'productId'),
      TableColumnConfig(
        title: 'Tên Sản Phẩm',
        width: 350,
        key: 'productName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Thể Tích Bán Thành Phẩm',
        width: 100,
        key: 'quantity',
      ),
      TableColumnConfig(title: 'Đơn Vị Thực Tế', width: 80, key: 'unit'),
      TableColumnConfig(title: 'Trạng Thái', width: 120, key: 'status'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel recipe = ListViewConfigModel(
    name: ListViewConfigName.recipe,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 140, key: 'createdTime'),
      TableColumnConfig(title: 'Recipe ID', width: 120, key: 'id'),
      TableColumnConfig(
        title: 'Recipe Name',
        width: 400,
        key: 'name',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Unit Size', width: 80, key: 'unitSize'),
      TableColumnConfig(title: 'Trạng Thái', width: 120, key: 'status'),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 180,
        key: 'creator',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 500,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel bomDetail = ListViewConfigModel(
    name: ListViewConfigName.bomDetail,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Item Code',
        width: 100,
        key: 'itemCode',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Item Name SAP',
        width: 400,
        key: 'itemNameSap',
        isSortable: true,
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNameSyrup',
        isSortable: true,
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Base Quantity',
        width: 150,
        key: 'baseQuantity',
        isSortable: true,
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Scrap Quantity',
        width: 150,
        key: 'scrapQuantity',
        isSortable: true,
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Total Quantity',
        width: 150,
        key: 'totalQuantity',
        isSortable: true,
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Đơn Vị SAP',
        width: 80,
        key: 'unitName',
        isSortable: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 350,
        key: 'note',
        isSortable: false,
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel mixingSettingProductionLine =
      ListViewConfigModel(
        name: ListViewConfigName.syrupMixingSettingProductionLine,
        fixedLeftColumns: 3,
        isHaveCheckBox: true,
        columns: [
          TableColumnConfig(
            title: 'Thời Gian Tạo',
            width: 140,
            key: 'createdAt',
          ),
          TableColumnConfig(title: 'Mã Dây Chuyền', width: 120, key: 'code'),
          TableColumnConfig(
            title: 'Tên Dây Chuyền',
            width: 250,
            key: 'name',
            isCenter: false,
          ),
          TableColumnConfig(title: 'Ký Hiệu', width: 100, key: 'symbol'),
          TableColumnConfig(
            title: 'Vị Trí',
            width: 250,
            key: 'location',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Hệ Thống Krones',
            width: 100,
            key: 'isKronesUsage',
          ),
          TableColumnConfig(
            title: 'Người Tạo',
            width: 250,
            key: 'creator',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Ghi Chú',
            width: 400,
            key: 'note',
            isCenter: false,
          ),
        ],
      );
  static const ListViewConfigModel mixingSettingMixerTank = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingSettingMixerTank,
    isHaveCheckBox: true,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: 'Thời Gian Tạo', width: 140, key: 'createdAt'),
      TableColumnConfig(
        title: 'Tên Trạm Pha Chế',
        width: 250,
        key: 'stationName',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Tên Mixer Tank', width: 200, key: 'name'),
      TableColumnConfig(
        title: 'Vị Trí',
        width: 250,
        key: 'location',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Tank trích ly', width: 150, key: 'isExtracted'),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 250,
        key: 'creator',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 400,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel mixingSettingMixingTank =
      ListViewConfigModel(
        name: ListViewConfigName.syrupMixingSettingMixingTank,
        isHaveCheckBox: true,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(
            title: 'Thời Gian Tạo',
            width: 140,
            key: 'createdAt',
          ),
          TableColumnConfig(
            title: 'Tên Trạm Pha Chế',
            width: 250,
            key: 'stationName',
            isCenter: false,
          ),
          TableColumnConfig(title: 'Tên Mixing Tank', width: 200, key: 'name'),
          TableColumnConfig(
            title: 'Vị Trí',
            width: 250,
            key: 'location',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Người Tạo',
            width: 250,
            key: 'creator',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Ghi Chú',
            width: 400,
            key: 'note',
            isCenter: false,
          ),
        ],
      );

  static const ListViewConfigModel mixingSettingStation = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingSettingStation,
    isHaveCheckBox: true,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: 'Thời Gian Tạo', width: 140, key: 'createdAt'),
      TableColumnConfig(title: 'Dây Chuyền', width: 120, key: 'lineName'),
      TableColumnConfig(title: 'Tên Trạm Pha Chế', width: 250, key: 'name'),
      TableColumnConfig(title: 'Mã Trạm Pha Chế', width: 150, key: 'code'),
      TableColumnConfig(
        title: 'Vị Trí',
        width: 250,
        key: 'location',
        isCenter: false,
      ),

      TableColumnConfig(
        title: 'Người Tạo',
        width: 250,
        key: 'creator',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 400,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel
  mixingSettingDosingLine = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingSettingDosingLine,
    isHaveCheckBox: true,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: 'Thời Gian Tạo', width: 140, key: 'createdAt'),
      TableColumnConfig(title: 'Tên SS Dosing Line', width: 150, key: 'name'),
      TableColumnConfig(
        title: 'Mã SS Dosing Line',
        width: 200,
        key: 'location',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 250,
        key: 'creator',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 400,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  // History Setting Configurations
  static const ListViewConfigModel
  mixingHistorySettingProductionLine = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingHistorySettingProductionLine,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 140, key: 'createdAt'),
      TableColumnConfig(title: 'Mã Dây Chuyền', width: 120, key: 'code'),
      TableColumnConfig(
        title: 'Tên Dây Chuyền',
        width: 250,
        key: 'name',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Ký Hiệu', width: 100, key: 'symbol'),
      TableColumnConfig(
        title: 'Vị Trí',
        width: 250,
        key: 'location',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Hệ Thống Krones',
        width: 100,
        key: 'isKronesUsage',
      ),
      TableColumnConfig(title: 'Trạng Thái', width: 150, key: 'status'),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 250,
        key: 'creator',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Huỷ',
        width: 200,
        key: 'canceledBy',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Thời Gian Huỷ', width: 140, key: 'canceledAt'),

      TableColumnConfig(
        title: 'Ghi Chú',
        width: 400,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel
  mixingHistorySettingMixerTank = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingHistorySettingMixerTank,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 140, key: 'createdAt'),
      TableColumnConfig(
        title: 'Tên Trạm Pha Chế',
        width: 250,
        key: 'stationName',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Tên Mixer Tank', width: 200, key: 'name'),
      TableColumnConfig(
        title: 'Vị Trí',
        width: 250,
        key: 'location',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Tank trích ly', width: 150, key: 'isExtracted'),
      TableColumnConfig(title: 'Trạng Thái', width: 150, key: 'status'),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 250,
        key: 'creator',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Huỷ',
        width: 200,
        key: 'canceledBy',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Thời Gian Huỷ', width: 140, key: 'canceledAt'),

      TableColumnConfig(
        title: 'Ghi Chú',
        width: 400,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel
  mixingHistorySettingMixingTank = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingHistorySettingMixingTank,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 140, key: 'createdAt'),
      TableColumnConfig(
        title: 'Tên Trạm Pha Chế',
        width: 250,
        key: 'stationName',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Tên Mixing Tank', width: 200, key: 'name'),
      TableColumnConfig(
        title: 'Vị Trí',
        width: 250,
        key: 'location',
        isCenter: false,
      ),

      TableColumnConfig(title: 'Trạng Thái', width: 150, key: 'status'),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 250,
        key: 'creator',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Huỷ',
        width: 200,
        key: 'canceledBy',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Thời Gian Huỷ', width: 140, key: 'canceledAt'),

      TableColumnConfig(
        title: 'Ghi Chú',
        width: 400,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel
  mixingHistorySettingStation = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingHistorySettingStation,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 140, key: 'createdAt'),
      TableColumnConfig(title: 'Dây Chuyền', width: 120, key: 'lineName'),
      TableColumnConfig(title: 'Tên Trạm Pha Chế', width: 250, key: 'name'),
      TableColumnConfig(title: 'Mã Trạm Pha Chế', width: 150, key: 'code'),
      TableColumnConfig(
        title: 'Vị Trí',
        width: 250,
        key: 'location',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Trạng Thái', width: 150, key: 'status'),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 250,
        key: 'creator',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Huỷ',
        width: 200,
        key: 'canceledBy',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Thời Gian Huỷ', width: 140, key: 'canceledAt'),

      TableColumnConfig(
        title: 'Ghi Chú',
        width: 400,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel
  mixingHistorySettingDosingLine = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingHistorySettingDosingLine,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 140, key: 'createdAt'),
      TableColumnConfig(title: 'Tên SS Dosing Line', width: 150, key: 'name'),
      TableColumnConfig(
        title: 'Mã SS Dosing Line',
        width: 200,
        key: 'location',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Trạng Thái', width: 150, key: 'status'),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 250,
        key: 'creator',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Huỷ',
        width: 200,
        key: 'canceledBy',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Thời Gian Huỷ', width: 140, key: 'canceledAt'),

      TableColumnConfig(
        title: 'Ghi Chú',
        width: 400,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel
  mixingHistorySettingBagSize = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingHistorySettingBagSize,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 140, key: 'createdAt'),
      TableColumnConfig(title: 'Tên', width: 120, key: 'name'),
      TableColumnConfig(title: 'Quy Cách', width: 100, key: 'spec'),
      TableColumnConfig(title: 'Đơn Vị Tính', width: 100, key: 'unit'),
      TableColumnConfig(title: 'Trạng Thái', width: 150, key: 'status'),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 250,
        key: 'creator',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Huỷ',
        width: 200,
        key: 'canceledBy',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Thời Gian Huỷ', width: 140, key: 'canceledAt'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 750,
        key: 'note',
        maxWidth: 1000,
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel
  mixingHistorySettingCart = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingHistorySettingCart,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 140, key: 'createdAt'),
      TableColumnConfig(title: 'Tên Xe / Kệ Hàng', width: 150, key: 'cartName'),
      TableColumnConfig(title: 'Trạng Thái', width: 150, key: 'status'),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 250,
        key: 'creator',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Huỷ',
        width: 200,
        key: 'canceledBy',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Thời Gian Huỷ', width: 140, key: 'canceledAt'),

      TableColumnConfig(
        title: 'Ghi Chú',
        width: 750,
        key: 'note',
        maxWidth: 1000,
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel storageProcessOrder = ListViewConfigModel(
    name: ListViewConfigName.storageProcessOrder,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Planned Date',
        width: 150,
        key: 'plannedDate',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Số Process Order',
        width: 150,
        key: 'processOrderNumber',
        isSortable: true,
      ),
      TableColumnConfig(title: 'Dây Chuyền', width: 100, key: 'lineName'),
      TableColumnConfig(title: 'Mã Sản Phẩm', width: 100, key: 'productCode'),
      TableColumnConfig(
        title: 'Tên Sản Phẩm',
        width: 350,
        key: 'productName',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Quantity (L)', width: 100, key: 'quantity'),
      TableColumnConfig(title: 'Unit Size', width: 100, key: 'unitSize'),
      TableColumnConfig(
        title: 'Unit Size Real',
        width: 100,
        key: 'unitSizeReal',
      ),
      TableColumnConfig(title: 'Trạng Thái', width: 150, key: 'status'),
      TableColumnConfig(title: 'B.O.M ID', width: 100, key: 'bomId'),
      TableColumnConfig(
        title: 'B.O.M Alternative',
        width: 150,
        key: 'bomAlternative',
      ),
      TableColumnConfig(
        title: 'B.O.M Name',
        width: 350,
        key: 'bomName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static ListViewConfigModel storageReturnWarehouse = const ListViewConfigModel(
    name: ListViewConfigName.storageReturnWarehouse,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 30, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Ngày Phiếu', width: 150, key: 'plannedDate'),
      TableColumnConfig(title: 'Mã Số Phiếu', width: 150, key: 'ticketId'),
      TableColumnConfig(
        title: 'Số  Process Order',
        width: 130,
        key: 'processOrder',
      ),
      TableColumnConfig(
        title: 'Số Reservation',
        width: 130,
        key: 'reservationNumber',
      ),
      TableColumnConfig(
        title: 'Người Giao',
        width: 200,
        key: 'sender',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Nhận',
        width: 200,
        key: 'receiver',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Trạng Thái', width: 130, key: 'status'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 180,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static ListViewConfigModel storageReturnWarehouseItem =
      const ListViewConfigModel(
        name: ListViewConfigName.storageReturnWarehouseItem,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(title: '#', width: 30, key: 'index', minWidth: 32),
          TableColumnConfig(title: 'Item Code', width: 130, key: 'itemCode'),
          TableColumnConfig(
            title: 'Item Name Sap',
            width: 400,
            key: 'itemNameSap',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Item Name Syrup',
            width: 400,
            key: 'itemNameSyrup',
            isCenter: false,
          ),
          TableColumnConfig(title: 'Batch Lot', width: 110, key: 'batch'),
          TableColumnConfig(
            title: 'Hạn Sử Dụng ',
            width: 130,
            key: 'expiryDate',
          ),
          TableColumnConfig(
            title: 'Số Lượng Nhãn',
            width: 140,
            key: 'labelQuantity',
          ),
          TableColumnConfig(
            title: 'Ghi Chú',
            width: 180,
            key: 'note',
            isCenter: false,
          ),
        ],
      );
  static ListViewConfigModel storageReturnWarehouseItemQrCode =
      const ListViewConfigModel(
        name: ListViewConfigName.storageReturnWarehouseItemQrCode,
        fixedLeftColumns: 3,
        isHaveCheckBox: true,
        columns: [
          TableColumnConfig(
            title: 'QR ID',
            width: 300,
            key: 'qrId',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Mã Nguyên Liệu',
            width: 150,
            key: 'materialCode',
          ),
          TableColumnConfig(title: 'Item Code', width: 100, key: 'itemCode'),
          TableColumnConfig(
            title: 'Item Name Syrup',
            width: 400,
            key: 'itemNameSyrup',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Loại Hàng',
            width: 100,
            key: 'materialType',
          ),
          TableColumnConfig(title: 'Batch Lot', width: 120, key: 'batch'),
          TableColumnConfig(title: 'HSD', width: 100, key: 'expiryDate'),
          TableColumnConfig(title: 'Quantity', width: 100, key: 'quantity'),
          TableColumnConfig(title: 'Unit Size', width: 80, key: 'unitSize'),
          TableColumnConfig(title: 'Đơn vị', width: 80, key: 'unit'),
          TableColumnConfig(
            title: 'Ghi Chú',
            width: 180,
            key: 'note',
            isCenter: false,
          ),
        ],
      );
  static const ListViewConfigModel warehouseDetail = ListViewConfigModel(
    name: ListViewConfigName.warehouseDetail,
    fixedLeftColumns: 3,
    isHaveCheckBox: true,
    columns: [
      TableColumnConfig(
        title: 'Thời Gian Nhận',
        width: 140,
        key: 'receiptTime',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'QR ID',
        width: 300,
        key: 'qrID',
        isSortable: true,
        isCenter: false,
      ),
      TableColumnConfig(title: 'Loại Hàng', width: 100, key: 'materialType'),
      TableColumnConfig(
        title: 'Group Name',
        width: 220,
        key: 'groupName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Item Code',
        width: 400,
        key: 'itemCode',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNameSyrup',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Quantity Thực Tế', width: 100, key: 'quantity'),
      TableColumnConfig(title: 'Đơn Vị Thực Tế', width: 80, key: 'unit'),
      TableColumnConfig(title: 'Unit Size', width: 100, key: 'unitSize'),
      TableColumnConfig(title: 'Group ID', width: 160, key: 'groupId'),
      TableColumnConfig(
        title: 'Số Gói Trong Thùng',
        width: 120,
        key: 'packCount',
      ),
      TableColumnConfig(
        title: 'Mã Nguyên Liệu',
        width: 120,
        key: 'materialCode',
      ),
      TableColumnConfig(title: 'Batch Lot', width: 120, key: 'batch'),
      TableColumnConfig(title: 'HSD SAP', width: 120, key: 'expiryDate'),
      TableColumnConfig(
        title: 'HSD Thực Tế',
        width: 120,
        key: 'actualExpiryDate',
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 180,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel storageReturnGoodsProcessOrder =
      ListViewConfigModel(
        name: ListViewConfigName.storageProcessOrder,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
          TableColumnConfig(
            title: 'Planned Date',
            width: 150,
            key: 'plannedDate',
            isSortable: true,
          ),
          TableColumnConfig(
            title: 'Số Process Order',
            width: 150,
            key: 'processOrderNumber',
            isSortable: true,
          ),
          TableColumnConfig(title: 'Dây Chuyền', width: 100, key: 'lineName'),
          TableColumnConfig(
            title: 'Mã Sản Phẩm',
            width: 100,
            key: 'productCode',
          ),
          TableColumnConfig(
            title: 'Tên Sản Phẩm',
            width: 350,
            key: 'productName',
            isCenter: false,
          ),
          TableColumnConfig(title: 'Quantity (L)', width: 100, key: 'quantity'),
          TableColumnConfig(title: 'Unit Size', width: 100, key: 'unitSize'),
          TableColumnConfig(
            title: 'Unit Size Real',
            width: 100,
            key: 'unitSizeReal',
          ),
          TableColumnConfig(title: 'Trạng Thái', width: 150, key: 'status'),
          TableColumnConfig(title: 'B.O.M ID', width: 100, key: 'bomId'),
          TableColumnConfig(
            title: 'B.O.M Alternative',
            width: 150,
            key: 'bomAlternative',
          ),
          TableColumnConfig(
            title: 'B.O.M Name',
            width: 350,
            key: 'bomName',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Ghi Chú',
            width: 300,
            key: 'note',
            isCenter: false,
          ),
        ],
      );
  static const ListViewConfigModel storageReturnGoodsWarehouseDetail =
      ListViewConfigModel(
        name: ListViewConfigName.storageReturnGoodsWarehouseDetail,
        fixedLeftColumns: 3,
        isHaveCheckBox: true,
        columns: [
          TableColumnConfig(
            title: 'Thời Gian Nhận',
            width: 140,
            key: 'receiptTime',
            isSortable: true,
          ),
          TableColumnConfig(
            title: 'QR ID',
            width: 300,
            key: 'qrCode',
            isSortable: true,
            isCenter: false,
          ),
          TableColumnConfig(title: 'Group ID', width: 160, key: 'groupId'),
          TableColumnConfig(
            title: 'Group Name',
            width: 220,
            key: 'groupName',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Mã Nguyên Liệu',
            width: 120,
            key: 'materialCode',
          ),
          TableColumnConfig(
            title: 'Item Code',
            width: 400,
            key: 'itemCode',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Item Name Syrup',
            width: 400,
            key: 'itemNameSyrup',
            isCenter: false,
          ),
          TableColumnConfig(title: 'Batch Lot', width: 120, key: 'batch'),
          TableColumnConfig(title: 'HSD SAP', width: 120, key: 'expiryDate'),
          TableColumnConfig(
            title: 'HSD Thực Tế',
            width: 120,
            key: 'actualExpiryDate',
          ),
          TableColumnConfig(
            title: 'Process Order',
            width: 140,
            key: 'processOrder',
          ),
          TableColumnConfig(title: 'Quantity', width: 100, key: 'quantity'),
          TableColumnConfig(title: 'Đơn Vị Thực Tế', width: 80, key: 'unit'),
          TableColumnConfig(
            title: 'Ghi Chú',
            width: 180,
            key: 'note',
            isCenter: false,
          ),
        ],
      );
  static const ListViewConfigModel syrupMixingProcessOrder =
      ListViewConfigModel(
        name: ListViewConfigName.syrupMixingProcessOrder,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
          TableColumnConfig(
            title: 'Planned Date',
            width: 150,
            key: 'plannedDate',
            isSortable: true,
          ),
          TableColumnConfig(
            title: 'Số Process Order',
            width: 150,
            key: 'processOrderNumber',
            isSortable: true,
          ),
          TableColumnConfig(title: 'Dây Chuyền', width: 100, key: 'lineName'),
          TableColumnConfig(
            title: 'Mã Sản Phẩm',
            width: 100,
            key: 'productCode',
          ),
          TableColumnConfig(
            title: 'Tên Sản Phẩm',
            width: 350,
            key: 'productName',
            isCenter: false,
          ),
          TableColumnConfig(title: 'Quantity (L)', width: 100, key: 'quantity'),
          TableColumnConfig(title: 'Unit Size', width: 100, key: 'unitSize'),
          TableColumnConfig(
            title: 'Unit Size Real',
            width: 100,
            key: 'unitSizeReal',
          ),
          TableColumnConfig(title: 'Trạng Thái', width: 150, key: 'status'),
          TableColumnConfig(title: 'B.O.M ID', width: 100, key: 'bomId'),
          TableColumnConfig(
            title: 'B.O.M Alternative',
            width: 150,
            key: 'bomAlternative',
          ),
          TableColumnConfig(
            title: 'B.O.M Name',
            width: 350,
            key: 'bomName',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Ghi Chú',
            width: 300,
            key: 'note',
            isCenter: false,
          ),
        ],
      );

  static const ListViewConfigModel syrupMixingProcessOrderSugarConsumption =
      ListViewConfigModel(
        name: ListViewConfigName.syrupMixingProcessOrderSugarConsumption,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
          TableColumnConfig(
            title: 'Process Order',
            width: 150,
            key: 'processOrderNumber',
          ),
          TableColumnConfig(title: 'Dây Chuyền', width: 100, key: 'lineName'),
          TableColumnConfig(title: 'Unit Size', width: 100, key: 'unitSize'),
          TableColumnConfig(
            title: 'Sản Phẩm',
            width: 350,
            key: 'productName',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Lượng Đường RE',
            width: 330,
            key: 'actualInventory',
            range: RangeData(
              start: 5,
              end: 7,
              groupTitle: 'Lượng Đường RE',
              columns: [
                TableColumnConfig(
                  title: 'Tồn PO Trước',
                  width: 150,
                  key: 'quantityPreviousPo',
                  isCanFreezed: false,
                ),
                TableColumnConfig(
                  title: 'Nhận Thực Tế',
                  width: 150,
                  key: 'quantityRealReceiveRe',
                  isCanFreezed: false,
                ),
                TableColumnConfig(
                  title: 'Sử Dụng',
                  width: 150,
                  key: 'rawSugarUsed',
                ),
              ],
            ),
          ),
          TableColumnConfig(
            title: 'Tồn Cuối RE',
            width: 330,
            key: 'rawSugarDiff',
            range: RangeData(
              start: 8,
              end: 10,
              groupTitle: 'Tồn Cuối RE',
              columns: [
                TableColumnConfig(
                  title: 'Tồn Cuối',
                  width: 150,
                  key: 'rawSugarEnd',
                  isCanFreezed: false,
                ),
                TableColumnConfig(
                  title: 'Tồn Cuối Thực Tế',
                  width: 150,
                  key: 'rawSugarActualEnd',
                  isCanFreezed: false,
                ),
                TableColumnConfig(
                  title: 'Chênh Lệch',
                  width: 150,
                  key: 'reDiff',
                  isCanFreezed: false,
                ),
              ],
            ),
          ),
          TableColumnConfig(
            title: 'Lượng Đường HFCS',
            width: 330,
            key: 'hfcsDiff',
            range: RangeData(
              start: 11,
              end: 13,
              groupTitle: 'Lượng Đường HFCS',
              columns: [
                TableColumnConfig(
                  title: 'Thực Nhận',
                  width: 110,
                  key: 'hfcsActual',
                  isCanFreezed: false,
                ),
                TableColumnConfig(
                  title: 'Sử Dụng',
                  width: 110,
                  key: 'hfcsUsed',
                  isCanFreezed: false,
                ),
                TableColumnConfig(
                  title: 'Tồn Cuối',
                  width: 110,
                  key: 'hfcsEnd',
                  isCanFreezed: false,
                ),
              ],
            ),
          ),
          TableColumnConfig(
            title: 'Thể Tích Syrup (L)',
            width: 120,
            key: 'volumeActual',
          ),
          TableColumnConfig(title: 'B.O.M ID', width: 100, key: 'bomId'),
          TableColumnConfig(
            title: 'B.O.M Alternative',
            width: 150,
            key: 'bomAlternative',
          ),
          TableColumnConfig(
            title: 'B.O.M Name',
            width: 350,
            key: 'bomName',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Ghi Chú',
            width: 300,
            key: 'note',
            isCenter: false,
          ),
        ],
      );
  static const ListViewConfigModel
  syrupMixingSugarConsumptionBatch = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingSugarConsumptionBatch,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 140, key: 'createdTime'),
      TableColumnConfig(title: 'Mẻ SX', width: 70, key: 'batchNumber'),
      TableColumnConfig(title: 'Unit Size', width: 80, key: 'unitSize'),
      TableColumnConfig(title: 'Trạng Thái Mẻ', width: 150, key: 'status'),
      TableColumnConfig(title: 'Ngày Pha', width: 120, key: 'mixingDate'),
      TableColumnConfig(
        title: 'Thời Gian\nBắt Đầu Pha',
        width: 130,
        key: 'startTime',
      ),
      TableColumnConfig(
        title: 'Thời Gian\nKết Thúc Pha',
        width: 130,
        key: 'endTime',
      ),
      TableColumnConfig(
        title: 'Tồn thực tế',
        width: 340,
        key: 'actualInventory',
        range: RangeData(
          start: 8,
          end: 10,
          groupTitle: 'Lượng Đường Sử Dụng',
          columns: [
            TableColumnConfig(
              title: 'RE\n(Kg)',
              width: 100,
              key: 'reActual',
              isCanFreezed: false,
            ),
            TableColumnConfig(
              title: 'HFCS\n(Kg)',
              width: 100,
              key: 'hfcsActual',
              isCanFreezed: false,
            ),
            TableColumnConfig(
              title: 'Thể Tích\nSyrup (L)',
              width: 140,
              key: 'volumeActual',
            ),
          ],
        ),
      ),
      TableColumnConfig(title: 'RE \nBatch Lot', width: 300, key: 'reBatchLot'),
      TableColumnConfig(
        title: 'HFCS \nBatch Lot',
        width: 300,
        key: 'hfcsBatchLot',
      ),
      TableColumnConfig(
        title: 'Chênh Lệch So Với Chuẩn',
        width: 680,
        key: 'standardDiff',
        range: RangeData(
          start: 13,
          end: 18,
          groupTitle: 'Chênh Lệch So Với Chuẩn',
          columns: [
            TableColumnConfig(
              title: 'RE\nChuẩn (Kg)',
              width: 110,
              key: 'reStandard',
              isCanFreezed: false,
            ),
            TableColumnConfig(
              title: 'RE\nChênh Lệch',
              width: 110,
              key: 'reDiff',
              isCanFreezed: false,
            ),
            TableColumnConfig(
              title: 'HFCS\nChuẩn (Kg)',
              width: 110,
              key: 'hfcsStandard',
              isCanFreezed: false,
            ),
            TableColumnConfig(
              title: 'HFCS\nChênh Lệch',
              width: 110,
              key: 'hfcsDiff',
              isCanFreezed: false,
            ),
            TableColumnConfig(
              title: 'Thể Tích\nChuẩn (L)',
              width: 120,
              key: 'volumeStandard',
              isCanFreezed: false,
            ),
            TableColumnConfig(
              title: 'Thể Tích\nChênh Lệch',
              width: 120,
              key: 'volumeDiff',
            ),
          ],
        ),
      ),
      TableColumnConfig(
        title: 'Recipe Name',
        width: 350,
        key: 'recipeName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel syrupMixingAlarm = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingAlarm,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Thời Gian Cảnh Báo',
        width: 150,
        key: 'alarmTime',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Process Order',
        width: 150,
        key: 'processOrder',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Line',
        width: 80,
        key: 'line',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Mã Sản Phẩm',
        width: 120,
        key: 'materialId',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Tên Sản Phẩm',
        width: 300,
        key: 'materialName',
        isCenter: false,
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Mẻ SX',
        width: 80,
        key: 'batch',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Trạng Thái',
        width: 150,
        key: 'status',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Loại Cảnh Báo',
        width: 150,
        key: 'alarmType',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Nội Dung Cảnh Báo',
        width: 700,
        key: 'alarmContent',
        isCenter: false,
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Người Duyệt',
        width: 150,
        key: 'approver',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Thời Gian Duyệt',
        width: 180,
        key: 'approvalTime',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel syrupMixingBatch = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingBatch,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 140, key: 'createdTime'),
      TableColumnConfig(title: 'Mẻ SX', width: 70, key: 'batchNumber'),
      TableColumnConfig(title: 'Unit Size', width: 80, key: 'unitSize'),
      TableColumnConfig(
        title: 'Recipe ID',
        width: 150,
        key: 'processOrderNumber',
      ),
      TableColumnConfig(
        title: 'Recipe Name',
        width: 350,
        key: 'recipeName',
        isCenter: false,
      ),

      TableColumnConfig(title: 'Người Tạo', width: 200, key: 'creator'),
      TableColumnConfig(title: 'Trạng Thái Mẻ', width: 200, key: 'status'),
      TableColumnConfig(
        title: 'Tiến Độ Cân NVL',
        width: 135,
        key: 'weighingProgress',
      ),
      TableColumnConfig(
        title: 'Tiến Độ Soạn Hàng',
        width: 135,
        key: 'preparingProgress',
      ),
      TableColumnConfig(
        title: 'Tiến Độ Pha Chế',
        width: 135,
        key: 'mixingProgress',
      ),
      TableColumnConfig(
        title: 'Mixing Tank',
        width: 120,
        key: 'mixingTankName',
      ),
      TableColumnConfig(title: 'Trạm', width: 100, key: 'station'),
      TableColumnConfig(title: 'Bao Bì', width: 80, key: 'packaging'),
      TableColumnConfig(
        title: 'Danh Sách Xe Đẩy',
        width: 200,
        key: 'cartCode',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel syrupMixingHistoryGoodsReceiptOrder =
      ListViewConfigModel(
        name: ListViewConfigName.syrupMixingHistoryGoodsReceiptOrder,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
          TableColumnConfig(title: 'Material', width: 140, key: 'materialId'),
          TableColumnConfig(
            title: 'Material Description',
            width: 250,
            key: 'materialDescription',
            isCenter: false,
          ),
          TableColumnConfig(title: 'Quantity', width: 150, key: 'quantity'),
          TableColumnConfig(
            title: 'Quantity Thực Tế',
            width: 150,
            key: 'quantityReal',
          ),
          TableColumnConfig(title: 'Batch Lot', width: 130, key: 'batch'),
          TableColumnConfig(title: 'Ghi chú', width: 530, key: 'note'),
        ],
      );
  static const ListViewConfigModel weightCommand = ListViewConfigModel(
    name: ListViewConfigName.weightCommand,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 150, key: 'createdTime'),
      TableColumnConfig(title: 'Mã Lệnh Cân', width: 180, key: 'code'),
      TableColumnConfig(title: 'Danh Sách Mẻ', width: 200, key: 'batchList'),
      TableColumnConfig(title: 'Trạng Thái', width: 140, key: 'status'),
      TableColumnConfig(title: 'Tiến Độ', width: 80, key: 'progress'),
      TableColumnConfig(title: 'Total Unit Size', width: 100, key: 'unitSize'),
      TableColumnConfig(title: 'Người Tạo', width: 250, key: 'creator'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 400,
        key: 'note',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel weighBatch = ListViewConfigModel(
    name: ListViewConfigName.weighBatch,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Thời Gian Tạo',
        width: 180,
        key: 'creationTime',
        isSortable: true,
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Mẻ SX',
        width: 80,
        key: 'batchNumber',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Recipe ID',
        width: 150,
        key: 'recipeId',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Recipe Name',
        width: 250,
        key: 'recipeName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Unit Size',
        width: 100,
        key: 'unitSize',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 200,
        key: 'creator',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Trạng Thái',
        width: 120,
        key: 'status',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Tiến Độ Cân',
        width: 120,
        key: 'weighingProgress',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 200,
        key: 'notes',
        isCenter: false,
      ),
    ],
  );

  static const ListViewConfigModel weighItem = ListViewConfigModel(
    name: ListViewConfigName.weighItem,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Item Code',
        width: 120,
        key: 'itemCode',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Item Name SAP',
        width: 400,
        key: 'itemNameSap',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNameSyrup',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Số Lượng Nhãn',
        width: 120,
        key: 'numberOfLabels',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Tổng Khối Lượng (Kg)',
        width: 150,
        key: 'totalWeight',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 200,
        key: 'notes',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel weighProcessOrder = ListViewConfigModel(
    name: ListViewConfigName.weighProcessOrder,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Planned Date',
        width: 150,
        key: 'plannedDate',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Số Process Order',
        width: 150,
        key: 'processOrderNumber',
        isSortable: true,
      ),
      TableColumnConfig(title: 'Dây Chuyền', width: 100, key: 'lineName'),
      TableColumnConfig(title: 'Mã Sản Phẩm', width: 100, key: 'productCode'),
      TableColumnConfig(
        title: 'Tên Sản Phẩm',
        width: 350,
        key: 'productName',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Quantity (L)', width: 100, key: 'quantity'),
      TableColumnConfig(title: 'Unit Size', width: 100, key: 'unitSize'),
      TableColumnConfig(
        title: 'Unit Size Real',
        width: 100,
        key: 'unitSizeReal',
      ),
      TableColumnConfig(title: 'Trạng Thái', width: 150, key: 'status'),
      TableColumnConfig(title: 'B.O.M ID', width: 100, key: 'bomId'),
      TableColumnConfig(
        title: 'B.O.M Alternative',
        width: 150,
        key: 'bomAlternative',
      ),
      TableColumnConfig(
        title: 'B.O.M Name',
        width: 350,
        key: 'bomName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel weighReturnProcessOrder =
      ListViewConfigModel(
        name: ListViewConfigName.weighReturnProcessOrder,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
          TableColumnConfig(
            title: 'Planned Date',
            width: 150,
            key: 'plannedDate',
            isSortable: true,
          ),
          TableColumnConfig(
            title: 'Số Process Order',
            width: 150,
            key: 'processOrderNumber',
            isSortable: true,
          ),
          TableColumnConfig(title: 'Dây Chuyền', width: 100, key: 'lineName'),
          TableColumnConfig(
            title: 'Mã Sản Phẩm',
            width: 100,
            key: 'productCode',
          ),
          TableColumnConfig(
            title: 'Tên Sản Phẩm',
            width: 350,
            key: 'productName',
            isCenter: false,
          ),
          TableColumnConfig(title: 'Quantity (L)', width: 100, key: 'quantity'),
          TableColumnConfig(title: 'Unit Size', width: 100, key: 'unitSize'),
          TableColumnConfig(
            title: 'Unit Size Real',
            width: 100,
            key: 'unitSizeReal',
          ),
          TableColumnConfig(title: 'Trạng Thái', width: 150, key: 'status'),
          TableColumnConfig(title: 'B.O.M ID', width: 100, key: 'bomId'),
          TableColumnConfig(
            title: 'B.O.M Alternative',
            width: 150,
            key: 'bomAlternative',
          ),
          TableColumnConfig(
            title: 'B.O.M Name',
            width: 350,
            key: 'bomName',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Ghi Chú',
            width: 300,
            key: 'note',
            isCenter: false,
          ),
        ],
      );
  static const ListViewConfigModel weighReturnRequest = ListViewConfigModel(
    name: ListViewConfigName.weighReturnRequest,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 150, key: 'createdAt'),
      TableColumnConfig(title: 'Mã Phiếu', width: 240, key: 'receiptCode'),
      TableColumnConfig(title: 'Người Tạo', width: 240, key: 'creator'),
      TableColumnConfig(
        title: 'Thời Gian Submit',
        width: 150,
        key: 'submittedAt',
      ),
      TableColumnConfig(title: 'Người Submit', width: 240, key: 'submitter'),
      TableColumnConfig(title: 'Trạng Thái', width: 140, key: 'status'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 240,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel syrupMixingConsumption = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingConsumption,
    isHaveCheckBox: true,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Posting Date', width: 110, key: 'postingDate'),
      TableColumnConfig(
        title: 'Quantity Total',
        width: 130,
        key: 'quantityTotal',
      ),
      TableColumnConfig(
        title: 'Quantity Remain',
        width: 130,
        key: 'quantityRemain',
      ),
      TableColumnConfig(title: 'Unit', width: 90, key: 'unit'),
      TableColumnConfig(
        title: 'Document Header Text',
        width: 250,
        key: 'documentText',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Batch', width: 130, key: 'batchNX'),
      TableColumnConfig(
        title: 'Material Document',
        width: 180,
        key: 'materialDocument',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel syrupMixingConfirmConsumption =
      ListViewConfigModel(
        name: ListViewConfigName.syrupMixingConfirmConsumption,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
          TableColumnConfig(title: 'Material', width: 130, key: 'materialId'),
          TableColumnConfig(
            title: 'Material Description',
            width: 230,
            key: 'materialDescription',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Posting Date',
            width: 110,
            key: 'postingDate',
          ),
          TableColumnConfig(
            title: 'Quantity (L)',
            width: 130,
            key: 'quantityConsumption',
          ),
          TableColumnConfig(
            title: 'Quantity Remain (L)',
            width: 130,
            key: 'quantityRemain',
          ),
          TableColumnConfig(
            title: 'Quantity Consumption (L)',
            width: 130,
            key: 'quantityConsumption',
          ),
          TableColumnConfig(title: 'Unit', width: 90, key: 'unit'),
          TableColumnConfig(
            title: 'Document Header Text',
            width: 250,
            key: 'documentText',
            isCenter: false,
          ),
          TableColumnConfig(title: 'Batch Lot', width: 130, key: 'batchNX'),
          TableColumnConfig(
            title: 'Material Document',
            width: 180,
            key: 'materialDocument',
            isCenter: false,
          ),
        ],
      );
  static const ListViewConfigModel syrupMixingGoodsReceiptOrder =
      ListViewConfigModel(
        name: ListViewConfigName.syrupMixingGoodsReceiptOrder,
        fixedLeftColumns: 3,
        isHaveCheckBox: true,
        columns: [
          TableColumnConfig(
            title: 'Thời Gian Tạo',
            width: 150,
            key: 'mixingDatetime',
          ),
          TableColumnConfig(title: 'Mẻ Pha', width: 80, key: 'mixingBatch'),
          TableColumnConfig(title: 'Trạng Thái', width: 200, key: 'status'),
          TableColumnConfig(
            title: 'Batch Bán Thành Phẩm',
            width: 200,
            key: 'batchProduct',
          ),
          TableColumnConfig(
            title: 'Lượng Bán Thành Phẩm\nĐã Goods Receipt (L)',
            width: 200,
            key: 'quantityGoodsReceipt',
          ),
          TableColumnConfig(
            title: 'Thể Tích (L)',
            width: 300,
            key: 'volume',
            range: RangeData(
              start: 5,
              end: 7,
              groupTitle: 'Thể Tích (L)',
              columns: [
                TableColumnConfig(
                  title: 'Pha Chế',
                  width: 100,
                  key: 'volumePrepared',
                  isCanFreezed: false,
                ),
                TableColumnConfig(
                  title: 'Chuẩn',
                  width: 100,
                  key: 'volumeStandard',
                  isCanFreezed: false,
                ),
                TableColumnConfig(
                  title: 'Chênh Lệch',
                  width: 100,
                  key: 'volumeDifference',
                  isCanFreezed: true,
                ),
              ],
            ),
          ),
          TableColumnConfig(
            title: 'Mixing Tank',
            width: 120,
            key: 'mixingTank',
          ),
          TableColumnConfig(title: 'Ngày Pha', width: 110, key: 'mixingDate'),
          TableColumnConfig(
            title: 'Thời Gian\nBắt Đầu',
            width: 150,
            key: 'startTime',
          ),
          TableColumnConfig(
            title: 'Thời Gian\nKết Thúc',
            width: 150,
            key: 'endTime',
          ),
          TableColumnConfig(
            title: 'RE (L)',
            width: 300,
            key: 're',
            isCenter: true,
            range: RangeData(
              start: 12,
              end: 14,
              groupTitle: 'RE (L)',
              columns: [
                TableColumnConfig(
                  title: 'Pha Chế',
                  width: 100,
                  key: 'rePrepared',
                  isCanFreezed: false,
                ),
                TableColumnConfig(
                  title: 'Chuẩn',
                  width: 100,
                  key: 'reStandard',
                  isCanFreezed: false,
                ),
                TableColumnConfig(
                  title: 'Chênh Lệch',
                  width: 100,
                  key: 'reDifference',
                  isCanFreezed: true,
                ),
              ],
            ),
          ),
          TableColumnConfig(
            title: 'HFCS (L)',
            width: 300,
            key: 'hfcs',
            isCenter: true,
            range: RangeData(
              start: 15,
              end: 17,
              groupTitle: 'HFCS (L)',
              columns: [
                TableColumnConfig(
                  title: 'Pha Chế',
                  width: 100,
                  key: 'hfcsPrepared',
                  isCanFreezed: false,
                ),
                TableColumnConfig(
                  title: 'Chuẩn',
                  width: 100,
                  key: 'hfcsStandard',
                  isCanFreezed: false,
                ),
                TableColumnConfig(
                  title: 'Chênh Lệch',
                  width: 100,
                  key: 'hfcsDifference',
                  isCanFreezed: true,
                ),
              ],
            ),
          ),

          TableColumnConfig(
            title: 'Ghi Chú',
            width: 300,
            key: 'note',
            isCenter: false,
          ),
        ],
      );
  static const ListViewConfigModel syrupMixingConfirmReconcile =
      ListViewConfigModel(
        name: ListViewConfigName.syrupMixingConfirmReconcile,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(title: '#', width: 60, key: 'index', minWidth: 60),
          TableColumnConfig(title: 'Item Code', width: 120, key: 'itemCode'),
          TableColumnConfig(
            title: 'Item Name Syrup',
            width: 400,
            key: 'itemNameSyrup',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Used Material',
            width: 180,
            key: 'unit',
            range: RangeData(
              start: 3,
              end: 5,
              groupTitle: 'Used Material',
              columns: [
                TableColumnConfig(
                  title: 'Tiêu Thụ\n(Pha chế + Hao hụt)',
                  width: 180,
                  key: 'mixingQuantityReconCile1',
                ),
                TableColumnConfig(
                  title: 'Tiêu Thụ\n(Còn Lại)',
                  width: 180,
                  key: 'mixingQuantityReconCile2',
                ),
                TableColumnConfig(
                  title: 'Tiêu Thụ\n(Thực Tế)',
                  width: 180,
                  key: 'mixingQuantityReconCile3',
                ),
              ],
            ),
          ),
          TableColumnConfig(title: 'Batch Lot', width: 130, key: 'batchLot'),
          TableColumnConfig(title: 'Unit', width: 110, key: 'unit'),
          TableColumnConfig(
            title: 'Ghi Chú',
            width: 300,
            key: 'notes',
            isCenter: false,
          ),
        ],
      );
  static const ListViewConfigModel syrupMixingConfirmGoodReceipt =
      ListViewConfigModel(
        name: ListViewConfigName.syrupMixingConfirmGoodReceipt,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(title: '#', width: 60, key: 'index', minWidth: 60),
          TableColumnConfig(title: 'Product ID', width: 120, key: 'productId'),
          TableColumnConfig(
            title: 'Product Name',
            width: 300,
            key: 'productName',
            isCenter: false,
          ),

          TableColumnConfig(
            title: 'Syrup Đã Pha Chế (L)',
            width: 130,
            key: 'mixingSyrupQuantity',
          ),
          TableColumnConfig(
            title: 'Syrup Đã Pha Chế Thực Tế (L)',
            width: 130,
            key: 'mixingSyrupQuantityReal',
          ),
          TableColumnConfig(title: 'Batch', width: 110, key: 'batch'),
          TableColumnConfig(title: 'Unit', width: 110, key: 'unit'),
          TableColumnConfig(
            title: 'Ghi Chú',
            width: 300,
            key: 'notes',
            isCenter: false,
          ),
        ],
      );
  static const ListViewConfigModel syrupMixingTransfer = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingTransfer,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Po Transfer', width: 110, key: 'poTransfer'),
      TableColumnConfig(title: 'Ngày SX', width: 110, key: 'productionDate'),
      TableColumnConfig(title: 'Batch No', width: 130, key: 'batchNo'),
      TableColumnConfig(title: 'Batch Lot', width: 130, key: 'batchLot'),
      TableColumnConfig(
        title: 'Tên Hương',
        width: 330,
        key: 'flavorName',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Số Unit', width: 130, key: 'unitCount'),
      TableColumnConfig(title: 'Thể Tích (L)', width: 130, key: 'volume'),
      TableColumnConfig(
        title: 'Nv Transfer',
        width: 130,
        key: 'transferEmployee',
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 240,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel onHandQrCode = ListViewConfigModel(
    name: ListViewConfigName.onHandQrCode,
    fixedLeftColumns: 3,
    isHaveCheckBox: true,
    columns: [
      TableColumnConfig(
        title: 'QR ID',
        width: 300,
        key: 'qrID',
        isSortable: true,
        isCenter: false,
      ),
      TableColumnConfig(title: 'Loại Hàng', width: 100, key: 'materialType'),
      TableColumnConfig(
        title: 'Mã Nguyên Liệu',
        width: 120,
        key: 'materialCode',
      ),
      TableColumnConfig(title: 'Item Code', width: 100, key: 'itemCode'),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNameSyrup',
        isCenter: false,
      ),

      TableColumnConfig(title: 'Batch Lot', width: 120, key: 'batch'),
      TableColumnConfig(title: 'HSD SAP', width: 120, key: 'expiryDate'),
      TableColumnConfig(
        title: 'HSD Thực Tế',
        width: 120,
        key: 'actualExpiryDate',
      ),
      TableColumnConfig(title: 'Quantity', width: 100, key: 'quantity'),
      TableColumnConfig(title: 'Unit Size', width: 100, key: 'unitSize'),
      TableColumnConfig(title: 'Đơn Vị Thực Tế', width: 80, key: 'unit'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 180,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel product = ListViewConfigModel(
    name: ListViewConfigName.product,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Tên Sản Phẩm',
        width: 400,
        key: 'name',
        isSortable: true,
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Số Formula',
        width: 250,
        key: 'formulaNumber',
        isSortable: true,
        isCenter: false,
      ),
      TableColumnConfig(title: 'Trạng Thái', width: 120, key: 'status'),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 250,
        key: 'createdBy',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Ngày Tạo', width: 140, key: 'createdAt'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 500,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel recipeInfo = ListViewConfigModel(
    name: ListViewConfigName.recipeInfo,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Nhóm', width: 80, key: 'group', isCenter: true),
      TableColumnConfig(
        title: 'Thứ Tự Pha Chế',
        width: 80,
        key: 'sequence',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Thời Gian Pha Chế',
        width: 140,
        key: 'mixingTime',
        isCenter: true,
      ),
      TableColumnConfig(title: 'Item Code', width: 120, key: 'itemCode'),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNameSyrup',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Đơn Vị Thực Tế',
        width: 80,
        key: 'unitReal',
        isSortable: false,
      ),
      TableColumnConfig(
        title: 'Total Quantity',
        width: 100,
        key: 'totalQuantity',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Số Lượng Gói',
        width: 80,
        key: 'packageCount',
        isSortable: false,
        isCenter: true,
      ),
      TableColumnConfig(title: 'Station', width: 120, key: 'station'),
      TableColumnConfig(
        title: 'Danh sách Mixer Tank',
        width: 320,
        key: 'mixerTank',
        isSortable: false,
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 360,
        key: 'note',
        isSortable: false,
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel recipeInfoHistory = ListViewConfigModel(
    name: ListViewConfigName.recipeInfoHistory,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 140, key: 'createdTime'),
      TableColumnConfig(title: 'Recipe ID', width: 120, key: 'id'),
      TableColumnConfig(
        title: 'Recipe Name',
        width: 400,
        key: 'name',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Unit Size', width: 80, key: 'unitSize'),
      TableColumnConfig(title: 'Status', width: 120, key: 'status'),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 180,
        key: 'creator',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Huỷ',
        width: 180,
        key: 'canceledBy',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Thời Gian Huỷ', width: 140, key: 'canceledAt'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 500,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel syrupMixingBatchDetail = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingBatchDetail,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Nhóm', width: 80, key: 'group', isCenter: true),
      TableColumnConfig(
        title: 'Thứ Tự Pha Chế',
        width: 80,
        key: 'sequence',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Thời Gian Pha Chế (phút)',
        width: 140,
        key: 'mixingTime',
        isCenter: true,
      ),
      TableColumnConfig(title: 'Item Code', width: 120, key: 'itemCode'),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNameSyrup',
        isSortable: true,
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Đơn Vị Thực Tế',
        width: 80,
        key: 'unitReal',
        isSortable: false,
      ),
      TableColumnConfig(
        title: 'Total Quantity',
        width: 100,
        key: 'totalQuantity',
        isSortable: true,
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Số Lượng Gói',
        width: 80,
        key: 'packageCount',
        isSortable: false,
        isCenter: true,
      ),
      TableColumnConfig(title: 'Station', width: 120, key: 'station'),
      TableColumnConfig(
        title: 'Danh sách Mixer Tank',
        width: 320,
        key: 'mixerTank',
        isSortable: false,
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 360,
        key: 'note',
        isSortable: false,
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel
  syrupMixingMaterialReconcile = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingMaterialReconcile,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', isCenter: true),
      TableColumnConfig(
        title: 'Item Code',
        width: 100,
        key: 'item_code',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'item_name',
        isCenter: false,
        isSortable: true,
      ),
      // General group (3-4) - merged columns
      TableColumnConfig(
        title: 'General',
        width: 300,
        key: 'general_group',
        isCenter: true,
        range: RangeData(
          start: 3,
          end: 4,
          groupTitle: 'General',
          columns: [
            TableColumnConfig(
              title: 'Đơn Vị',
              width: 100,
              key: 'unit',
              isCenter: true,
              isCanFreezed: false,
            ),

            TableColumnConfig(
              title: 'Yêu Cầu',
              width: 100,
              key: 'numberRequired',
              isCenter: true,
              isCanFreezed: true,
            ),
          ],
        ),
      ),
      // InBound group (5-6) - merged columns
      TableColumnConfig(
        title: 'InBound',
        width: 200,
        key: 'inbound_group',
        isCenter: true,
        range: RangeData(
          start: 5,
          end: 6,
          groupTitle: 'InBound',
          columns: [
            TableColumnConfig(
              title: 'Transfer đến',
              width: 100,
              key: 'transferInQuantity',
              isCenter: true,
              isCanFreezed: false,
            ),
            TableColumnConfig(
              title: 'Nhận vào',
              width: 100,
              key: 'receivedInQuantity',
              isCenter: true,
              isCanFreezed: true,
            ),
          ],
        ),
      ),
      // OutBound group (7-8) - merged columns
      TableColumnConfig(
        title: 'OutBound',
        width: 200,
        key: 'outbound_group',
        isCenter: true,
        range: RangeData(
          start: 7,
          end: 8,
          groupTitle: 'OutBound',
          columns: [
            TableColumnConfig(
              title: 'Transfer đi',
              width: 100,
              key: 'transferOutQuantity',
              isCenter: true,
              isCanFreezed: false,
            ),
            TableColumnConfig(
              title: 'Hoàn Kho',
              width: 100,
              key: 'returnToWarehouseQuantity',
              isCenter: true,
              isCanFreezed: true,
            ),
          ],
        ),
      ),
      // Used Material group (9-11) - merged columns
      TableColumnConfig(
        title: 'Used Material',
        width: 300,
        key: 'used_material_group',
        isCenter: true,
        range: RangeData(
          start: 9,
          end: 11,
          groupTitle: 'Used Material',
          columns: [
            TableColumnConfig(
              title: 'Pha Chế',
              width: 100,
              key: 'mixingQuantity',
              isCenter: true,
              isCanFreezed: false,
            ),
            TableColumnConfig(
              title: 'Hao Hụt',
              width: 100,
              key: 'lossQuantity',
              isCenter: true,
              isCanFreezed: false,
            ),
            TableColumnConfig(
              title: 'Tiêu Thụ',
              width: 100,
              key: 'consumeQuantity',
              isCenter: true,
              isCanFreezed: true,
            ),
          ],
        ),
      ),
      TableColumnConfig(
        title: 'Tồn Cuối',
        width: 110,
        key: 'remainingQuantity',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'notes',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel syrupMixingHistoryMaterialReconcile =
      ListViewConfigModel(
        name: ListViewConfigName.syrupMixingHistoryMaterialReconcile,
        fixedLeftColumns: 2,
        columns: [
          TableColumnConfig(title: '#', width: 60, key: 'index', minWidth: 60),
          TableColumnConfig(title: 'Item Code', width: 120, key: 'itemCode'),
          TableColumnConfig(
            title: 'Item Name Syrup',
            width: 400,
            key: 'itemNameSyrup',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Used Material',
            width: 180,
            key: 'unit',
            range: RangeData(
              start: 3,
              end: 5,
              groupTitle: 'Used Material',
              columns: [
                TableColumnConfig(
                  title: 'Tiêu Thụ\n(Pha chế + Hao hụt)',
                  width: 180,
                  key: 'mixingQuantity1',
                  isCanFreezed: false,
                ),
                TableColumnConfig(
                  title: 'Tiêu Thụ\n(Còn Lại)',
                  width: 180,
                  key: 'mixingQuantity2',
                  isCanFreezed: false,
                ),
                TableColumnConfig(
                  title: 'Tiêu Thụ\n(Thực Tế)',
                  width: 180,
                  key: 'mixingQuantity3',
                ),
              ],
            ),
          ),
          TableColumnConfig(title: 'Batch Lot', width: 130, key: 'batchLot'),
          TableColumnConfig(title: 'Unit', width: 110, key: 'unit'),
          TableColumnConfig(
            title: 'Ghi Chú',
            width: 300,
            key: 'notes',
            isCenter: false,
          ),
        ],
      );
  //krones Inbound
  static const ListViewConfigModel kronesInbound = ListViewConfigModel(
    name: ListViewConfigName.kronesInbound,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', isCenter: true),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 150, key: 'createdAt'),
      TableColumnConfig(title: 'Message ID', width: 300, key: 'messageId'),
      TableColumnConfig(title: 'Trạng Thái', width: 150, key: 'status'),
      TableColumnConfig(
        title: 'Mô Tả Chi Tiết',
        width: 250,
        key: 'detailDescription',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        maxWidth: 1000,
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel kronesDetail = ListViewConfigModel(
    name: ListViewConfigName.kronesMixing,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', isCenter: true),
      TableColumnConfig(title: 'Batch ID', width: 300, key: 'batchId'),
      TableColumnConfig(title: 'Batch Number', width: 140, key: 'batchNumber'),
      TableColumnConfig(
        title: 'Process Order',
        width: 140,
        key: 'processOrder',
      ),
      TableColumnConfig(title: 'Recipe ID', width: 140, key: 'recipeId'),
      TableColumnConfig(
        title: 'Recipe Version',
        width: 140,
        key: 'recipeVersion',
      ),
      TableColumnConfig(title: 'BOM ID', width: 140, key: 'bomId'),
      TableColumnConfig(
        title: 'BOM Alternative',
        width: 140,
        key: 'bomAlternative',
      ),
      TableColumnConfig(title: 'Unit Size', width: 100, key: 'unitSize'),
      TableColumnConfig(title: 'Trạng Thái', width: 150, key: 'status'),
      TableColumnConfig(title: 'Mã Sản Phẩm', width: 150, key: 'productId'),
      TableColumnConfig(title: 'Tên Sản Phẩm', width: 250, key: 'productName'),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 150, key: 'createdAt'),
      TableColumnConfig(title: 'Loop', width: 100, key: 'loop'),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 170,
        key: 'userCreatedFullName',
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        maxWidth: 1000,
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel
  kronesMixingHistoryDetail = ListViewConfigModel(
    name: ListViewConfigName.kronesMixingHistoryDetail,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', isCenter: true),
      TableColumnConfig(title: 'Batch ID', width: 250, key: 'batchId'),
      TableColumnConfig(title: 'Batch Number', width: 140, key: 'batchNumber'),
      TableColumnConfig(
        title: 'Process Order',
        width: 140,
        key: 'processOrder',
      ),
      TableColumnConfig(title: 'Recipe ID', width: 140, key: 'recipeId'),
      TableColumnConfig(
        title: 'Recipe Version',
        width: 140,
        key: 'recipeVersion',
      ),
      TableColumnConfig(title: 'BOM ID', width: 140, key: 'bomId'),
      TableColumnConfig(
        title: 'BOM Alternative',
        width: 140,
        key: 'bomAlternative',
      ),
      TableColumnConfig(title: 'Unit Size', width: 100, key: 'unitSize'),
      TableColumnConfig(title: 'Trạng Thái', width: 100, key: 'status'),
      TableColumnConfig(title: 'Mã Sản Phẩm', width: 150, key: 'productId'),
      TableColumnConfig(title: 'Tên Sản Phẩm', width: 250, key: 'productName'),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 150, key: 'createdAt'),
      TableColumnConfig(title: 'Loop', width: 100, key: 'loop'),
      TableColumnConfig(
        title: 'User Created Full Name',
        width: 170,
        key: 'userCreatedFullName',
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        maxWidth: 1000,
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel materialProcessOrder = ListViewConfigModel(
    name: ListViewConfigName.materialProcessOrder,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Planned Date',
        width: 150,
        key: 'plannedDate',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'Số Process Order',
        width: 150,
        key: 'processOrderNumber',
        isSortable: true,
      ),
      TableColumnConfig(title: 'Dây Chuyền', width: 100, key: 'lineName'),
      TableColumnConfig(title: 'Mã Sản Phẩm', width: 100, key: 'productCode'),
      TableColumnConfig(
        title: 'Tên Sản Phẩm',
        width: 350,
        key: 'productName',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Quantity (L)', width: 100, key: 'quantity'),
      TableColumnConfig(title: 'Unit Size', width: 100, key: 'unitSize'),
      TableColumnConfig(
        title: 'Unit Size Real',
        width: 100,
        key: 'unitSizeReal',
      ),
      TableColumnConfig(title: 'Trạng Thái', width: 150, key: 'status'),
      TableColumnConfig(title: 'B.O.M ID', width: 100, key: 'bomId'),
      TableColumnConfig(
        title: 'B.O.M Alternative',
        width: 150,
        key: 'bomAlternative',
      ),
      TableColumnConfig(
        title: 'B.O.M Name',
        width: 350,
        key: 'bomName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel
  materialProcessOrderItem = ListViewConfigModel(
    name: ListViewConfigName.materialProcessOrderItem,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', isCenter: true),
      TableColumnConfig(title: 'Item No', width: 100, key: 'itemNo'),
      TableColumnConfig(title: 'Item Code', width: 100, key: 'itemCode'),
      TableColumnConfig(
        title: 'Item Name SAP',
        width: 400,
        key: 'itemNamSap',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNamSyrup',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Base Qty/1 Gói Chẵn',
        width: 100,
        key: 'baseQty',
      ),
      TableColumnConfig(title: 'Đơn Vị Thực Tế', width: 100, key: 'unitReal'),
      TableColumnConfig(
        title: 'Unit Size/1 Gói Chẵn',
        width: 100,
        key: 'unitSize',
      ),
      TableColumnConfig(title: 'Đơn Vị Sap', width: 100, key: 'unitSap'),
      TableColumnConfig(title: 'Storage Sloc', width: 100, key: 'storageSloc'),
      TableColumnConfig(
        title: 'Requirement Quantity',
        width: 100,
        key: 'requirementQuantity',
      ),
      TableColumnConfig(
        title: 'Withdraw Quantity',
        width: 100,
        key: 'withdrawQuantity',
      ),
      TableColumnConfig(
        title: 'Confirm Quantity',
        width: 100,
        key: 'confirmQuantity',
      ),
      TableColumnConfig(title: 'Item Text', width: 100, key: 'itemText'),
      TableColumnConfig(
        title: 'Deletion Indicator',
        width: 100,
        key: 'deletionIndicator',
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        maxWidth: 1000,
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel materialBatchItem = ListViewConfigModel(
    name: ListViewConfigName.materialBatchItem,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', isCenter: true),
      TableColumnConfig(
        title: 'Process Order',
        width: 140,
        key: 'processOrder',
      ),
      TableColumnConfig(title: 'Item No', width: 100, key: 'itemNo'),
      TableColumnConfig(title: 'Item Code', width: 100, key: 'itemCode'),
      TableColumnConfig(title: 'Item Name Sap', width: 400, key: 'itemNameSap'),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNameSyrup',
      ),
      TableColumnConfig(title: 'Batch', width: 100, key: 'batch'),

      TableColumnConfig(
        title: 'Withdraw Quantity',
        width: 140,
        key: 'withdrawQuantity',
      ),
      TableColumnConfig(
        title: 'Confirm Quantity',
        width: 140,
        key: 'confirmQuantity',
      ),
      TableColumnConfig(title: 'UOM', width: 100, key: 'uom'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        maxWidth: 1000,
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel mixingBatchDetail = ListViewConfigModel(
    name: ListViewConfigName.mixingBatchDetail,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Nhóm', width: 80, key: 'groupNo'),
      TableColumnConfig(
        title: 'Thời Gian Pha Chế (phút)',
        width: 140,
        key: 'mixingTime',
      ),
      TableColumnConfig(
        title: 'Trạm Pha Chế',
        width: 120,
        key: 'mixingStation',
      ),
      TableColumnConfig(title: 'Mixing Tank', width: 120, key: 'mixingTank'),
      TableColumnConfig(
        title: 'Danh sách Mixer Tank',
        width: 500,
        key: 'mixerTank',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Trích Ly', width: 100, key: 'isExtracted'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 700,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel mixingBatchItem = ListViewConfigModel(
    name: ListViewConfigName.mixingBatchItem,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Item Code', width: 120, key: 'itemCode'),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNameSyrup',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Total Quantity',
        width: 120,
        key: 'totalQuantity',
      ),
      TableColumnConfig(title: 'Đơn Vị Thực Tế', width: 80, key: 'unitReal'),
      TableColumnConfig(title: 'Số Lượng Gói', width: 100, key: 'packCount'),
      TableColumnConfig(
        title: 'Chấp Nhận Sai Số',
        width: 100,
        key: 'isAcceptableTolerance',
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 700,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel mixingWeightProgress = ListViewConfigModel(
    name: ListViewConfigName.mixingWeightProgress,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Item Code', width: 120, key: 'itemCode'),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNameSyrup',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Khối Lượng Đã Cân',
        width: 120,
        key: 'totalQuantity',
      ),
      TableColumnConfig(
        title: 'Số Bao Gói Đã Cân',
        width: 120,
        key: 'weightPackage',
      ),
      TableColumnConfig(title: 'Đơn Vị Thực Tế', width: 80, key: 'unitReal'),
      TableColumnConfig(title: 'Trạng Thái', width: 160, key: 'status'),
      TableColumnConfig(
        title: 'Thời Gian Bắt Đầu Cân',
        width: 160,
        key: 'startTime',
      ),
      TableColumnConfig(
        title: 'Thời Gian Kết Thúc Cân',
        width: 160,
        key: 'endTime',
      ),
      TableColumnConfig(
        title: 'Số Lần Cảnh Báo',
        width: 160,
        key: 'warningCount',
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 700,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel
  mixingWeightProgressDetail = ListViewConfigModel(
    name: ListViewConfigName.mixingWeightProgressDetail,
    fixedLeftColumns: 3,
    isHaveCheckBox: true,
    columns: [
      TableColumnConfig(title: 'Thời Gian Soạn', width: 120, key: 'scanTime'),
      TableColumnConfig(
        title: 'QR ID',
        width: 250,
        key: 'qrId',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Mã Nguyên Liệu',
        width: 150,
        key: 'materialCode',
      ),
      TableColumnConfig(title: 'Loại Hàng', width: 100, key: 'materialType'),
      TableColumnConfig(title: 'Batch Lot', width: 120, key: 'batch'),
      TableColumnConfig(title: 'HSD SAP', width: 120, key: 'expirySAP'),
      TableColumnConfig(title: 'HSD Thực Tế', width: 120, key: 'expiry'),
      TableColumnConfig(title: 'Quantity', width: 100, key: 'quantity'),
      TableColumnConfig(title: 'Đơn Vị Thực Tế', width: 80, key: 'unitReal'),
      TableColumnConfig(title: 'Người Soạn', width: 140, key: 'preparer'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel kronesStationMixingTankDetail =
      ListViewConfigModel(
        name: ListViewConfigName.kronesStationMixingTank,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
          TableColumnConfig(
            title: 'Mixing Tank ID',
            width: 220,
            key: 'mixingTankId',
          ),
          TableColumnConfig(
            title: 'Mixing Tank Name',
            width: 140,
            key: 'mixingTankName',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Station Code',
            width: 150,
            key: 'stationCode',
          ),
          TableColumnConfig(
            title: 'Thời Gian Tạo',
            width: 150,
            key: 'createdDatetime',
          ),
          TableColumnConfig(
            title: 'Người Tạo',
            width: 150,
            key: 'userCreatedFullName',
            isCenter: false,
          ),
          TableColumnConfig(title: 'Trạng Thái', width: 150, key: 'status'),
          TableColumnConfig(
            title: 'Ghi Chú',
            width: 300,
            key: 'note',
            isCenter: false,
          ),
        ],
      );
  static const ListViewConfigModel warningHistoryPreparation =
      ListViewConfigModel(
        name: ListViewConfigName.warningHistoryPreparation,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
          TableColumnConfig(
            title: 'Thời Gian Cảnh Báo',
            width: 150,
            key: 'warningTime',
          ),
          TableColumnConfig(title: 'Mã Cảnh Báo', width: 120, key: 'qrId'),
          TableColumnConfig(title: 'Trạng Thái', width: 120, key: 'status'),
          TableColumnConfig(
            title: 'Người Thực Hiện',
            width: 200,
            key: 'userFullName',
          ),
          TableColumnConfig(
            title: 'Nội Dung Cảnh Báo',
            width: 700,
            key: 'warningContent',
          ),
          TableColumnConfig(
            title: 'Người Xét Duyệt',
            width: 200,
            key: 'approvedUserFullName',
          ),
          TableColumnConfig(
            title: 'Thời Gian Xét Duyệt',
            width: 150,
            key: 'approvedTime',
          ),
          TableColumnConfig(
            title: 'Ghi Chú Xét Duyệt',
            width: 400,
            key: 'approvedNote',
          ),
        ],
      );
  static const ListViewConfigModel warningHistoryMixing = ListViewConfigModel(
    name: ListViewConfigName.warningHistoryMixing,
    fixedLeftColumns: 3,

    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Thời Gian Cảnh Báo',
        width: 150,
        key: 'warningTime',
      ),
      TableColumnConfig(title: 'Mã Cảnh Báo', width: 120, key: 'qrId'),
      TableColumnConfig(title: 'Trạng Thái', width: 120, key: 'status'),
      TableColumnConfig(
        title: 'Người Thực Hiện',
        width: 200,
        key: 'userFullName',
      ),
      TableColumnConfig(
        title: 'Nội Dung Cảnh Báo',
        width: 700,
        key: 'warningContent',
      ),
      TableColumnConfig(
        title: 'Người Xét Duyệt',
        width: 200,
        key: 'approvedUserFullName',
      ),
      TableColumnConfig(
        title: 'Thời Gian Xét Duyệt',
        width: 150,
        key: 'approvedTime',
      ),
      TableColumnConfig(
        title: 'Ghi Chú Xét Duyệt',
        width: 400,
        key: 'approvedNote',
      ),
    ],
  );
  static const ListViewConfigModel warningHistoryWeight = ListViewConfigModel(
    name: ListViewConfigName.warningHistoryWeight,
    fixedLeftColumns: 3,

    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(
        title: 'Thời Gian Cảnh Báo',
        width: 150,
        key: 'warningTime',
      ),
      TableColumnConfig(title: 'Mã Cảnh Báo', width: 120, key: 'qrId'),
      TableColumnConfig(title: 'Trạng Thái', width: 120, key: 'status'),
      TableColumnConfig(
        title: 'Người Thực Hiện',
        width: 200,
        key: 'userFullName',
      ),
      TableColumnConfig(
        title: 'Nội Dung Cảnh Báo',
        width: 700,
        key: 'warningContent',
      ),
      TableColumnConfig(
        title: 'Người Xét Duyệt',
        width: 200,
        key: 'approvedUserFullName',
      ),
      TableColumnConfig(
        title: 'Thời Gian Xét Duyệt',
        width: 150,
        key: 'approvedTime',
      ),
      TableColumnConfig(
        title: 'Ghi Chú Xét Duyệt',
        width: 400,
        key: 'approvedNote',
      ),
    ],
  );
  static const ListViewConfigModel deviceManagerPrinter = ListViewConfigModel(
    name: ListViewConfigName.deviceManagerPrinter,
    fixedLeftColumns: 3,

    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 150, key: 'warningTime'),
      TableColumnConfig(
        title: 'Tên Máy In',
        width: 250,
        key: 'printerName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Vị Trí Máy In',
        width: 250,
        key: 'location',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Trạng Thái',
        width: 200,
        key: 'printerStatus',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'COM Mode',
        width: 100,
        key: 'comMode',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 150,
        key: 'userCreatedFullName',
        isCenter: false,
      ),
      TableColumnConfig(title: 'Ghi Chú', width: 200, key: 'notes'),
    ],
  );
  static const ListViewConfigModel deviceManagerScale = ListViewConfigModel(
    name: ListViewConfigName.deviceManagerScale,
    fixedLeftColumns: 3,

    columns: [
      TableColumnConfig(title: '#', width: 32, key: 'index', minWidth: 32),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 150, key: 'warningTime'),
      TableColumnConfig(
        title: 'Tên Trạm Cân',
        width: 250,
        key: 'scaleName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Vị Trí Trạm Cân',
        width: 250,
        key: 'location',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Loại Cân',
        width: 150,
        key: 'typeScale',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Trạng Thái',
        width: 150,
        key: 'status',
        isCenter: false,
      ),
      TableColumnConfig(title: 'IP', width: 150, key: 'ip', isCenter: false),
      TableColumnConfig(
        title: 'Port',
        width: 100,
        key: 'port',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'COM Mode',
        width: 100,
        key: 'comMode',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Model',
        width: 100,
        key: 'model',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Người Tạo',
        width: 250,
        key: 'userCreatedFullName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 200,
        key: 'notes',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel materialWasted = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingMaterialWasted,
    fixedLeftColumns: 3,
    isHaveCheckBox: true,
    columns: [
      TableColumnConfig(
        title: 'Thời Gian Nhận',
        width: 140,
        key: 'receiptTime',
        isSortable: true,
      ),
      TableColumnConfig(
        title: 'QR ID',
        width: 300,
        key: 'qrID',
        isSortable: true,
        isCenter: false,
      ),
      TableColumnConfig(title: 'Loại Hàng', width: 100, key: 'materialType'),
      TableColumnConfig(title: 'Hao Hụt', width: 100, key: 'isWasted'),
      TableColumnConfig(title: 'Group ID', width: 160, key: 'groupId'),
      TableColumnConfig(
        title: 'Group Name',
        width: 220,
        key: 'groupName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Mã Nguyên Liệu',
        width: 120,
        key: 'materialCode',
      ),
      TableColumnConfig(
        title: 'Item Code',
        width: 400,
        key: 'itemCode',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 400,
        key: 'itemNameSyrup',
        isCenter: false,
      ),

      TableColumnConfig(title: 'Batch Lot', width: 120, key: 'batch'),
      TableColumnConfig(title: 'HSD SAP', width: 120, key: 'expiryDate'),
      TableColumnConfig(
        title: 'HSD Thực Tế',
        width: 120,
        key: 'actualExpiryDate',
      ),
      TableColumnConfig(title: 'Quantity Thực Tế', width: 100, key: 'quantity'),
      TableColumnConfig(title: 'Đơn Vị Thực Tế', width: 80, key: 'unit'),
      TableColumnConfig(title: 'Unit Size', width: 100, key: 'unitSize'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 180,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel poItemList = ListViewConfigModel(
    name: ListViewConfigName.poItemList,
    fixedLeftColumns: 3,
    isHaveCheckBox: true,
    columns: [
      TableColumnConfig(title: 'Item Code', width: 150, key: 'itemCode'),
      TableColumnConfig(
        title: 'Batch',
        width: 140,
        key: 'batch',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Item Name',
        width: 450,
        key: 'itemName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Item Name Syrup',
        width: 450,
        key: 'itemNameSyrup',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Số Nhãn Đã Xác Định',
        width: 120,
        key: 'quantityDetermined',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Số Nhãn Cần In',
        width: 120,
        key: 'quantityToPrint',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Loại Hàng',
        width: 150,
        key: 'materialType',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'HSD',
        width: 150,
        key: 'expiryDate',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Quantity',
        width: 140,
        key: 'quantity',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Đơn Vị Sap',
        width: 140,
        key: 'unitSap',
        isCenter: true,
      ),
      TableColumnConfig(title: 'Đơn Vị Thực Tế', width: 140, key: 'unit'),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 180,
        key: 'note',
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel
  syrupMixingHistoryGoodsReceiptOrderEdi = ListViewConfigModel(
    name: ListViewConfigName.syrupMixingHistoryGoodsReceiptOrderEdi,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', isCenter: true),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 150, key: 'createdAt'),
      TableColumnConfig(title: 'Message ID', width: 300, key: 'messageId'),
      TableColumnConfig(
        title: 'Posting Date',
        width: 200,
        key: 'postingDate',
        isCenter: true,
      ),
      TableColumnConfig(title: 'Trạng Thái', width: 150, key: 'status'),
      TableColumnConfig(
        title: 'Document Header Text',
        width: 250,
        key: 'documentHeaderText',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Mô Tả Chi Tiết',
        width: 250,
        key: 'detailDescription',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        maxWidth: 1000,
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel consumptionManyTime = ListViewConfigModel(
    name: ListViewConfigName.consumptionManyTime,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', isCenter: true),
      TableColumnConfig(
        title: 'Thời Gian Consumption',
        width: 150,
        key: 'createdAt',
      ),
      TableColumnConfig(title: 'Posting Date', width: 150, key: 'postingDate'),
      TableColumnConfig(
        title: 'Process Order FGs',
        width: 150,
        key: 'processOrderFg',
      ),
      TableColumnConfig(
        title: 'Reservation FGs',
        width: 150,
        key: 'reservationFg',
      ),
      TableColumnConfig(
        title: 'Production Line',
        width: 150,
        key: 'productionLine',
      ),
      TableColumnConfig(
        title: 'Quantity Consumption (L)',
        width: 200,
        key: 'quantityConsumption',
        maxWidth: 1000,
      ),
      TableColumnConfig(
        title: 'Document Header Text',
        width: 200,
        key: 'note',
        maxWidth: 1000,
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Batch',
        width: 150,
        key: 'batch',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Material Document',
        width: 250,
        key: 'note',
        maxWidth: 1000,
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel ediHistoryConsumption = ListViewConfigModel(
    name: ListViewConfigName.ediHistoryConsumption,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: '#', width: 50, key: 'index', isCenter: true),
      TableColumnConfig(title: 'Thời Gian Tạo', width: 150, key: 'createdAt'),
      TableColumnConfig(title: 'Message ID', width: 200, key: 'messageId'),
      TableColumnConfig(title: 'Trạng Thái', width: 150, key: 'status'),
      TableColumnConfig(
        title: 'Mô Tả Chi Tiết',
        width: 250,
        key: 'detailDescription',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Ghi Chú',
        width: 300,
        key: 'note',
        maxWidth: 1000,
        isCenter: false,
      ),
    ],
  );
  static const ListViewConfigModel mappingBatchFormCurrent =
      ListViewConfigModel(
        name: ListViewConfigName.mappingBatchFormCurrent,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(
            title: 'Item Code',
            width: 150,
            key: 'itemCode',
            isCenter: true,
          ),
          TableColumnConfig(
            title: 'Item Name',
            width: 200,
            key: 'itemName',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Khối Lượng Đã Soạn',
            width: 120,
            key: 'quantityReceived',
            isCenter: true,
          ),
          TableColumnConfig(
            title: 'Số bao gói đã soạn',
            width: 120,
            key: 'preparedPackages',
            isCenter: true,
          ),
          TableColumnConfig(
            title: 'Đơn Vị Thực Tế',
            width: 120,
            key: 'unitReal',
            isCenter: true,
          ),
          TableColumnConfig(
            title: 'QR Label List',
            width: 100,
            maxWidth: 150,
            key: 'qrLabelList',
            isCenter: true,
          ),
        ],
      );
  static const ListViewConfigModel mappingBatchFormMapping =
      ListViewConfigModel(
        name: ListViewConfigName.mappingBatchFormMapping,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(
            title: 'Item Code',
            width: 150,
            key: 'itemCode',
            isCenter: true,
          ),
          TableColumnConfig(
            title: 'Item Name',
            width: 200,
            key: 'itemName',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Khối Lượng Đã Soạn',
            width: 120,
            key: 'quantityReceived',
            isCenter: true,
          ),
          TableColumnConfig(
            title: 'Số bao gói đã soạn',
            width: 120,
            key: 'preparedPackages',
            isCenter: true,
          ),
          TableColumnConfig(
            title: 'Đơn Vị Thực Tế',
            width: 120,
            key: 'unitReal',
            isCenter: true,
          ),
          TableColumnConfig(
            title: 'QR Label List',
            width: 100,
            maxWidth: 150,
            key: 'qrLabelList',
            isCenter: true,
          ),
        ],
      );
  static const ListViewConfigModel mappingBatchFormQrCode = ListViewConfigModel(
    name: ListViewConfigName.mappingBatchFormQrCode,
    fixedLeftColumns: 3,
    columns: [
      TableColumnConfig(title: 'Qr ID', width: 250, key: 'qrId'),
      TableColumnConfig(
        title: 'Item Code',
        width: 100,
        key: 'itemCode',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Item Name',
        width: 200,
        key: 'itemName',
        isCenter: false,
      ),
      TableColumnConfig(
        title: 'Line Name',
        width: 150,
        key: 'lineName',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Batch',
        width: 150,
        key: 'batch',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Location',
        width: 150,
        key: 'batch',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Loop No',
        width: 150,
        key: 'loopNo',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Khối Lượng Thực Tế',
        width: 120,
        key: 'quantityReal',
        isCenter: true,
      ),
      TableColumnConfig(
        title: 'Đơn Vị Thực Tế',
        width: 120,
        key: 'unitReal',
        maxWidth: 150,
        isCenter: true,
      ),
    ],
  );
  static const ListViewConfigModel mappingBatchFormQrCodeMapping =
      ListViewConfigModel(
        name: ListViewConfigName.mappingBatchFormQrCodeMapping,
        fixedLeftColumns: 3,
        columns: [
          TableColumnConfig(title: 'Qr ID', width: 250, key: 'qrId'),
          TableColumnConfig(
            title: 'Item Code',
            width: 100,
            key: 'itemCode',
            isCenter: true,
          ),
          TableColumnConfig(
            title: 'Item Name',
            width: 200,
            key: 'itemName',
            isCenter: false,
          ),
          TableColumnConfig(
            title: 'Line Name',
            width: 150,
            key: 'lineName',
            isCenter: true,
          ),
          TableColumnConfig(
            title: 'Batch',
            width: 150,
            key: 'batch',
            isCenter: true,
          ),
          TableColumnConfig(
            title: 'Location',
            width: 150,
            key: 'batch',
            isCenter: true,
          ),
          TableColumnConfig(
            title: 'Loop No',
            width: 150,
            key: 'loopNo',
            isCenter: true,
          ),
          TableColumnConfig(
            title: 'Khối Lượng Thực Tế',
            width: 120,
            key: 'quantityReal',
            isCenter: true,
          ),
          TableColumnConfig(
            title: 'Đơn Vị Thực Tế',
            width: 120,
            key: 'unitReal',
            maxWidth: 150,
            isCenter: true,
          ),
        ],
      );
}
