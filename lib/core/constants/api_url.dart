import 'package:intl/intl.dart';

import '../../common/helpers/preferences.dart';
import 'datetime_format.dart';

class ApiUrl {
  static Future<void> initializeBaseURL() async {
    final url = await UserPreferences.getBaseURL();
    bool isURLValid = Uri.parse(url).host.isNotEmpty;
    baseURL = isURLValid ? '$url$apiV' : '';
  }

  static late String baseURL;

  static const apiV = '/mixing-syrup/api';

  static const login = '/account/login';
  static const updatePass = '/account/update';
  static const recipeHistory = '/recipes/recipe-history';
  static const bomSaps = '/boms/bom-recipe';
  static const bomSapUpdate = '/boms/bom';
  static const bomDetails = '/boms/information';
  //recipe
  static const recipeInfo = '/recipes';
  static const recipeProposeMixingTanks = '/recipes/recipe-mixing-tank';
  static const recipeProposeStations = '/recipes/recipe-station';
  static const materials = '/materials';
  static const materialHistoryVariant =
      '/materials/material-syrup-variant-history';
  static const materialVariant = '/materials/material-variant';
  static const materialReconcileHistory =
      '/materials/material-reconcile-history';
  static const products = '/products';
  static const mixerTanks = '/tanks';
  static const mixingTanks = '/tanks/mixing-tank';
  static const productionLines = '/lines';
  static const packs = '/packs';
  static const stations = '/stations';
  static const dosingLines = '/dosings';
  static const carts = '/carts';
  //param
  static const paramFilter = 'filterType';
  static const paramBomId = 'bomId';
  static const paramBomAlternative = 'bomAlternative';
  static const paramRecipeId = 'recipeId';
  static const paramDateFrom = 'dateFrom';
  static const paramDateTo = 'dateTo';
  static const paramProcessOrder = 'processOrder';
  static const paramWeightOrderId = 'weightOrderId';
  static const paramIsByPassWarningBom = 'isByPassWarningBom';
  static const paramIsByPassWarningProcessOrder = 'isByPassWarningProcessOrder';
  static const paramIsByPassWarningRecipe = 'isByPassWarningRecipe';
  static const paramIsByPassWarningVariant = 'isByPassWarningVariant';
  static const paramReturnRequestId = 'returnRequestId';
  static const paramQrIdGroup = 'qrIdGroup';
  //on hand
  static const processOrdersOnHand = '/qrcodes/po-onhand';
  static const qrCodesOnHand = '/qrcodes/qrcode-onhand';
  static const qrCodesOnHandDetails = '/qrcodes/qrcode-onhand-detail';
  static const itemQrCodes = '/qrcodes/po-onhand-item-qrcode';
  static const generateItemQrCode = '/qrcodes/item-qrcode-detail-generation';
  static const getAdjustQRs = '/qrcodes/item-qrcode-detail-generation';
  static const adjustIn = '/qrcodes/adjustment-inbound';
  static const processOrdersReturn = '/qrcodes/po-qrcode-return';
  static const processOrdersMixing = '/mixingbatchings/prd-batch';
  static const mixingGoodReceiptOrder = '/mixingbatchings/goods-receipt-order';
  static const mixingLines = '/homes';

  //mixing
  static const mixingSugarConsumption = '/mixingbatchings/report-uesd-re';
  static const mixingSugarBatchLot = '/mixingbatchings/batch-lot-sugar';
  static const mixingProcessOrderConfirm =
      '/mixingbatchings/process-order-confirm';
  static const mixingLineQrCode = '/lines/line-qrcode';
  static const mixingLineQrCodeUpdate = '/processorders/prd-process-order';
  static const mixingPicking = '/mixingbatchings/picking';
  static const mixingPrdWeighing = '/weights/prd-weighing';
  static const paramBatchId = 'batchId';
  static const paramStationId = 'stationId';
  static const processOrdersWeigh = '/weights/weight-order';
  static const processOrdersWeighReturn = '/returns/return-request';
  static const returnRequests = '/returns/return-request-by-process-order';
  static const returnQrCodes = '/returns/request-return-qrcode';
  static const processOrdersWeighReturnInfo =
      '/returns/return-request-information';
  static const transferPo = '/transfer-po';
  static const transferPoBatch = '/transfer-po-batch';
  static const transferPoDetail = '/transfer-po-label-qrcode-detail';
  static const processOrderBatchGoodProduct =
      '/mixingbatchings/goods-receipt-order-product';
  static const updateBatchGoodReceipt =
      '/mixingbatchings/prd-batch-product-batch-mixing';
  static const processOrdersBatches = '/po-batching-group';
  static const paramPlannedDate = 'plannedDate';
  static const paramBatch = 'batch';
  static const qrCodes = '/qrcodes/qrcode-label';
  static const batch = '/mixingbatchings/prd-batch';
  static const materialReconcile = '/materials/material-reconcile';
  static const materialConfirmReconcile = '/materials/material-used';
  static const confirmMaterialReconcile = '/materials/material-reconcile';
  static const materialConfirmWasted = '/materials/material-wasted';
  static const batchConfirmationForm = '/mixingbatchings/form-batch-comfirm';
  static const batchConfirm = '/mixingbatchings/prd-batch-comfirm';
  static const batchDetail = '/mixingbatchings/batch-information';
  static const batchStatus = '/mixingbatchings/prd-batch-status';
  static const kronesUsage = '/mixingbatchings/prd-batch-krones-usage';
  static const recipeGroup = '/recipes/recipe-group-information';
  static const formBatch = '/mixingbatchings/form-batch-create';
  static const batchMixing = '/mixingbatchings/mixing';
  static const mixingQrCode = '/mixingbatchings/mixing-qrcode';
  static const pickingQrCode = '/mixingbatchings/picking-qrcode';
  static const mixingConsumption = '/mixingbatchings/syrup-consumption';
  static const mixingHistoryGoodReceipt =
      '/mixingbatchings/goods-receipt-order-history';
  static const mixingHistoryConsumption =
      '/mixingbatchings/syrup-consumption-history';
  static const batchWeight = '/weights/prd-weighing';
  static const formBatchGroup = '/mixingbatchings/form-batch-group';
  static const updateBatchGroup = '/mixingbatchings/prd-batch-group';
  //good issue
  static const warehouseDispatchNotes = '/storagelocations/goods-issue-note';
  static const goodsIssueNoteQrCodes =
      '/storagelocations/goods-issue-note-item-qrcode';
  static const paramGoodsIssueNoteId = 'goodsIssueNoteId';
  static const paramItemCode = 'itemCode';
  static const formWeighCommand = '/weights/form-weight-order-create';
  static const returnBatchPicking = '/mixingbatchings/picking-cancel-qrcode';
  static const returnBatchMixing = '/mixingbatchings/mixing-cancel-qrcode';
  static const returnBatchWeighing = '/weights/prd-weighing-cancel-qrcode';
  //support
  static const supportInfo = '/supports/support-information';
  // Krones EDI (outbound)
  static const kronesOutboundMasterData =
      '/masterdatas/krones-message-outbound-master-data';
  static const kronesOutboundMasterDataHistory =
      '/masterdatas/krones-message-outbound-master-data-history';
  static const kronesOutboundRecipes =
      '/recipes/krones-message-outbound-recipe';
  static const kronesOutboundRecipeHistory =
      '/recipes/krones-message-outbound-recipe-history';
  static const kronesOutboundStationTanks =
      '/stations/krones-message-outbound-stations-tanks';
  static const kronesOutboundBatches =
      '/mixingbatchings/krones-message-outbound-batch';
  static const kronesOutboundBatchesHistory =
      '/mixingbatchings/krones-message-outbound-batch-history';
  static const confirmMixingConsumption =
      '/mixingbatchings/syrup-consumption-product';
  static const kronesProcessOrders =
      '/processorders/krones-message-outbound-process-order';
  static const kronesProcessOrdersHistory =
      '/processorders/krones-message-outbound-process-order-history';
  static const kronesStationTanksHistory =
      '/stations/krones-message-outbound-stations-tanks-history';
  static const kronesPickingProcesses =
      '/mixingbatchings/krones-message-outbound-picking';
  static const kronesPickingProcessesHistory =
      '/mixingbatchings/krones-message-outbound-picking-history';
  static const kronesStationMixingTanks =
      '/stations/krones-message-outbound-station-mixing-tanks';
  static const kronesStationMixingTanksHistory =
      '/stations/krones-message-outbound-station-mixing-tank-history';
  // process order
  static const processOrders = '/processorders';
  // update expired date
  static const updateExpiredDate = '/expired-date-real';
  static const updateMixerTanksBatchGroup = '/mixingbatchings/prd-batch-loop';
  static const generateQrCode = '/qrcodes/qrcode-detail-generation';
  // Krones EDI (outbound)
  static const kronesOutboundExportJsonMessage =
      '/krones/krones-json-message-outbound';
  //device manager
  static const printers = '/devices/device-print';
  static const weighingScales = '/devices/device-weighing-scale';
  static const paramEdiTransactionId = 'ediTransactionId';
  static const paramEdiTransactionObject = 'ediTransactionObject';
  static const alarmPending = '/mixingbatchings/alarm-message';
  static const alarmPendingPost = '/mixingbatchings/approve-alarm-message';
  //storage location
  static const formReturnRequests = '/returns/form-return-request';
  static const submitReturnRequests = '/returns/return-request-qrcode';
  static const weighCommands = '/weights/weight-order-by-po';
  //krones inbound
  static const kronesInboundMixing =
      '/mixingbatchings/krones-message-inbound-mixing';
  static const kronesInboundMixingHistory =
      '/mixingbatchings/krones-message-inbound-mixing-history';
  static const confirmSyrupConsumption = '/mixingbatchings/syrup-consumption';
  //account
  static const accountUsers = '/account/all-user';
  static const accountUpdateUser = '/account/change-role';
  //process order mapping batch
  static const processOrderMappingBatch = '/po-batch';
  static const pickingMappingBatch = '/mixingbatchings/prd-batch-item';
  static const confirmMappingLabelQrCode = '/transfer-po-batch-item';
}

extension ApiUrlExtension on DateTime {
  String get dateTimeForAPI =>
      DateFormat(DateTimeFormat.dateTimeForAPI).format(this);
}
