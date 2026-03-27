// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listview_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListViewConfigModel _$ListViewConfigModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ListViewConfigModel', json, ($checkedConvert) {
      final val = ListViewConfigModel(
        columns: $checkedConvert(
          'columns',
          (v) => (v as List<dynamic>)
              .map((e) => TableColumnConfig.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        name: $checkedConvert(
          'name',
          (v) => $enumDecode(_$ListViewConfigNameEnumMap, v),
        ),
        fixedLeftColumns: $checkedConvert(
          'fixedLeftColumns',
          (v) => (v as num).toInt(),
        ),
        isHaveCheckBox: $checkedConvert(
          'isHaveCheckBox',
          (v) => v as bool? ?? false,
        ),
      );
      return val;
    });

Map<String, dynamic> _$ListViewConfigModelToJson(
  ListViewConfigModel instance,
) => <String, dynamic>{
  'columns': instance.columns,
  'name': _$ListViewConfigNameEnumMap[instance.name]!,
  'fixedLeftColumns': instance.fixedLeftColumns,
  'isHaveCheckBox': instance.isHaveCheckBox,
};

const _$ListViewConfigNameEnumMap = {
  ListViewConfigName.materialRaw: 'materialRaw',
  ListViewConfigName.materialVariant: 'materialVariant',
  ListViewConfigName.bomSap: 'bomSap',
  ListViewConfigName.recipe: 'recipe',
  ListViewConfigName.bom: 'bom',
  ListViewConfigName.product: 'product',
  ListViewConfigName.bomHistory: 'bomHistory',
  ListViewConfigName.bomDetail: 'bomDetail',
  ListViewConfigName.recipeInfo: 'recipeInfo',
  ListViewConfigName.recipeInfoHistory: 'recipeInfoHistory',
  ListViewConfigName.recipeGroupDetail: 'recipeGroupDetail',
  ListViewConfigName.recipeMaterialDetail: 'recipeMaterialDetail',
  ListViewConfigName.recipeInfoGroupDetail: 'recipeInfoGroupDetail',
  ListViewConfigName.recipeInfoMaterialDetail: 'recipeInfoMaterialDetail',
  ListViewConfigName.bomEdit: 'bomEdit',
  ListViewConfigName.storageProcessOrder: 'storageProcessOrder',
  ListViewConfigName.storageReturnWarehouse: 'storageReturnWarehouse',
  ListViewConfigName.storageReturnWarehouseItem: 'storageReturnWarehouseItem',
  ListViewConfigName.storageReturnWarehouseItemQrCode:
      'storageReturnWarehouseItemQrCode',
  ListViewConfigName.storageProcessOrderDetail: 'storageProcessOrderDetail',
  ListViewConfigName.storageReturnGoodsProcessOrder:
      'storageReturnGoodsProcessOrder',
  ListViewConfigName.storageReturnGoodsWarehouseDetail:
      'storageReturnGoodsWarehouseDetail',
  ListViewConfigName.onHandQrCode: 'onHandQrCode',
  ListViewConfigName.warehouseReceipt: 'warehouseReceipt',
  ListViewConfigName.warehouseDetail: 'warehouseDetail',
  ListViewConfigName.phaseDeviation: 'phaseDeviation',
  ListViewConfigName.pickingGroup: 'pickingGroup',
  ListViewConfigName.pickingLabel: 'pickingLabel',
  ListViewConfigName.mixingGroup: 'mixingGroup',
  ListViewConfigName.mixingLabel: 'mixingLabel',
  ListViewConfigName.materialVariantHistory: 'materialVariantHistory',
  ListViewConfigName.returnGoods: 'returnGoods',
  ListViewConfigName.returnGoodsLabel: 'returnGoodsLabel',
  ListViewConfigName.returnMaterial: 'returnMaterial',
  ListViewConfigName.syrupMixing: 'syrupMixing',
  ListViewConfigName.syrupMixingProcessOrder: 'syrupMixingProcessOrder',
  ListViewConfigName.syrupMixingBatch: 'syrupMixingBatch',
  ListViewConfigName.syrupMixingBatchDetail: 'syrupMixingBatchDetail',
  ListViewConfigName.syrupMixingMaterialReconcile:
      'syrupMixingMaterialReconcile',
  ListViewConfigName.syrupMixingHistoryMaterialReconcile:
      'syrupMixingHistoryMaterialReconcile',
  ListViewConfigName.syrupMixingConsumption: 'syrupMixingConsumption',
  ListViewConfigName.syrupMixingConfirmConsumption:
      'syrupMixingConfirmConsumption',
  ListViewConfigName.syrupMixingTransfer: 'syrupMixingTransfer',
  ListViewConfigName.syrupMixingGoodsReceiptOrder:
      'syrupMixingGoodsReceiptOrder',
  ListViewConfigName.syrupMixingHistoryGoodsReceiptOrder:
      'syrupMixingHistoryGoodsReceiptOrder',
  ListViewConfigName.syrupMixingSettingProductionLine:
      'syrupMixingSettingProductionLine',
  ListViewConfigName.syrupMixingSettingMixerTank: 'syrupMixingSettingMixerTank',
  ListViewConfigName.syrupMixingSettingMixingTank:
      'syrupMixingSettingMixingTank',
  ListViewConfigName.syrupMixingSettingStation: 'syrupMixingSettingStation',
  ListViewConfigName.syrupMixingSettingDosingLine:
      'syrupMixingSettingDosingLine',
  ListViewConfigName.syrupMixingSettingBagSize: 'syrupMixingSettingBagSize',
  ListViewConfigName.syrupMixingSettingCart: 'syrupMixingSettingCart',
  ListViewConfigName.syrupMixingHistorySettingProductionLine:
      'syrupMixingHistorySettingProductionLine',
  ListViewConfigName.syrupMixingHistorySettingMixerTank:
      'syrupMixingHistorySettingMixerTank',
  ListViewConfigName.syrupMixingHistorySettingMixingTank:
      'syrupMixingHistorySettingMixingTank',
  ListViewConfigName.syrupMixingHistorySettingStation:
      'syrupMixingHistorySettingStation',
  ListViewConfigName.syrupMixingHistorySettingDosingLine:
      'syrupMixingHistorySettingDosingLine',
  ListViewConfigName.syrupMixingHistorySettingBagSize:
      'syrupMixingHistorySettingBagSize',
  ListViewConfigName.syrupMixingHistorySettingCart:
      'syrupMixingHistorySettingCart',
  ListViewConfigName.syrupMixingHistoryReconCile: 'syrupMixingHistoryReconCile',
  ListViewConfigName.syrupMixingHistoryConsumption:
      'syrupMixingHistoryConsumption',
  ListViewConfigName.syrupMixingConfirmReconcile: 'syrupMixingConfirmReconcile',
  ListViewConfigName.syrupMixingConfirmGoodReceipt:
      'syrupMixingConfirmGoodReceipt',
  ListViewConfigName.syrupMixingAlarm: 'syrupMixingAlarm',
  ListViewConfigName.syrupMixingMaterialWasted: 'syrupMixingMaterialWasted',
  ListViewConfigName.syrupMixingProcessOrderSugarConsumption:
      'syrupMixingProcessOrderSugarConsumption',
  ListViewConfigName.syrupMixingSugarConsumptionBatch:
      'syrupMixingSugarConsumptionBatch',
  ListViewConfigName.weighProcessOrder: 'weighProcessOrder',
  ListViewConfigName.weightCommand: 'weightCommand',
  ListViewConfigName.weighBatch: 'weighBatch',
  ListViewConfigName.weighItem: 'weighItem',
  ListViewConfigName.weighReturnProcessOrder: 'weighReturnProcessOrder',
  ListViewConfigName.weighReturnRequest: 'weighReturnRequest',
  ListViewConfigName.weightQrCode: 'weightQrCode',
  ListViewConfigName.weightReport: 'weightReport',
  ListViewConfigName.weighingAlarm: 'weighingAlarm',
  ListViewConfigName.weighCommandQr: 'weighCommandQr',
  ListViewConfigName.packageQrCode: 'packageQrCode',
  ListViewConfigName.itemWeighReturnMaterial: 'itemWeighReturnMaterial',
  ListViewConfigName.weighReturnMaterialQrItem: 'weighReturnMaterialQrItem',
  ListViewConfigName.syrupMixingHistoryGoodsReceiptOrderEdi:
      'syrupMixingHistoryGoodsReceiptOrderEdi',
  ListViewConfigName.kronesEdiMessages: 'kronesEdiMessages',
  ListViewConfigName.kronesEdiMessagesHistory: 'kronesEdiMessagesHistory',
  ListViewConfigName.kronesMasterData: 'kronesMasterData',
  ListViewConfigName.kronesStationTank: 'kronesStationTank',
  ListViewConfigName.kronesMixingTankDetail: 'kronesMixingTankDetail',
  ListViewConfigName.kronesStationMixingTank: 'kronesStationMixingTank',
  ListViewConfigName.kronesProcessOrder: 'kronesProcessOrder',
  ListViewConfigName.kronesRecipe: 'kronesRecipe',
  ListViewConfigName.kronesBatch: 'kronesBatch',
  ListViewConfigName.kronesPickingProcess: 'kronesPickingProcess',
  ListViewConfigName.kronesQualityManagement: 'kronesQualityManagement',
  ListViewConfigName.kronesVariant: 'kronesVariant',
  ListViewConfigName.kronesTanks: 'kronesTanks',
  ListViewConfigName.kronesLineItems: 'kronesLineItems',
  ListViewConfigName.kronesBatchItems: 'kronesBatchItems',
  ListViewConfigName.kronesBatchDetails: 'kronesBatchDetails',
  ListViewConfigName.kronesPickingProcessDetails: 'kronesPickingProcessDetails',
  ListViewConfigName.kronesRecipeInfoGroupDetail: 'kronesRecipeInfoGroupDetail',
  ListViewConfigName.kronesRecipeInfoMaterialDetail:
      'kronesRecipeInfoMaterialDetail',
  ListViewConfigName.kronesInbound: 'kronesInbound',
  ListViewConfigName.kronesMixing: 'kronesMixing',
  ListViewConfigName.kronesMixingHistoryDetail: 'kronesMixingHistoryDetail',
  ListViewConfigName.materialProcessOrder: 'materialProcessOrder',
  ListViewConfigName.materialProcessOrderItem: 'materialProcessOrderItem',
  ListViewConfigName.materialBatchItem: 'materialBatchItem',
  ListViewConfigName.mixingBatchDetail: 'mixingBatchDetail',
  ListViewConfigName.mixingBatchItem: 'mixingBatchItem',
  ListViewConfigName.mixingWeightProgress: 'mixingWeightProgress',
  ListViewConfigName.mixingWeightProgressDetail: 'mixingWeightProgressDetail',
  ListViewConfigName.poItemList: 'poItemList',
  ListViewConfigName.warningHistoryPreparation: 'warningHistoryPreparation',
  ListViewConfigName.warningHistoryMixing: 'warningHistoryMixing',
  ListViewConfigName.warningHistoryWeight: 'warningHistoryWeight',
  ListViewConfigName.deviceManagerPrinter: 'deviceManagerPrinter',
  ListViewConfigName.deviceManagerScale: 'deviceManagerScale',
  ListViewConfigName.consumptionManyTime: 'consumptionManyTime',
  ListViewConfigName.ediHistoryConsumption: 'ediHistoryConsumption',
  ListViewConfigName.mappingBatchFormCurrent: 'mappingBatchFormCurrent',
  ListViewConfigName.mappingBatchFormMapping: 'mappingBatchFormMapping',
  ListViewConfigName.mappingBatchFormQrCode: 'mappingBatchFormQrCode',
  ListViewConfigName.mappingBatchFormQrCodeMapping:
      'mappingBatchFormQrCodeMapping',
};
