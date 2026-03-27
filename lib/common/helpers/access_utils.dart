import '../../core/constants/constants.dart';
import '../../domain/common/repositories/common.dart';
import '../../service_locator.dart';

class AccessUtils {
  AccessLevel _accessLevel = AccessLevel.unknown;
  Future<void> init() async {
    _accessLevel = await sl<CommonRepository>().getAccessLevel();
  }

  bool get isSyrupTechnician => _accessLevel == AccessLevel.syrupTechnician;
  bool get isSyrupSupervisor =>
      _accessLevel == AccessLevel.syrupSupervisor ||
      _accessLevel == AccessLevel.syrupSupervisorAdmin;
  // Helper lists based on the provided image (Material Manager)
  // Viewers: Observer, Supervisor, Admin Nationwide. (Technician is excluded).
  static const List<AccessLevel> _materialViewers = [
    AccessLevel.syrupObserver,
    AccessLevel.syrupAdminPlant,
    AccessLevel.syrupSupervisor,
    AccessLevel.syrupSupervisorAdmin,
    AccessLevel.syrupObserverNW,
  ];

  // Writers (Edit/Create/Delete/Release/Reuse): Supervisor only.
  static const List<AccessLevel> _materialWriters = [
    AccessLevel.syrupSupervisor,
    AccessLevel.syrupSupervisorAdmin,
  ];

  // Exporters: Supervisor, Admin .
  static const List<AccessLevel> _materialExporters = [
    AccessLevel.syrupSupervisor,
    AccessLevel.syrupSupervisorAdmin,
  ];

  bool get isCanUpdateRole =>
      _accessLevel == AccessLevel.syrupAdminPlant ||
      _accessLevel == AccessLevel.syrupSupervisorAdmin;

  // Define permission matrix mirroring the spreadsheet
  static final Map<ListViewConfigName, Map<PermissionType, List<AccessLevel>>>
  _permissions = {
    // Quản Lý Nguyên Liệu (Material Raw)
    ListViewConfigName.materialRaw: {
      PermissionType.view: _materialViewers,
      PermissionType.edit: _materialWriters, // Cập Nhật NL
      PermissionType.export: _materialExporters, // Export NL
    },

    // Variant Actions (Mapped to materialVariant Screen)
    ListViewConfigName.materialVariant: {
      PermissionType.view: [
        ..._materialViewers,
        AccessLevel.syrupTechnician,
        AccessLevel.prdClerk,
      ],
      PermissionType.create: _materialWriters, // Tạo Variant
      PermissionType.edit: _materialWriters, // Cập nhật Variant
      PermissionType.delete: _materialWriters, // Hủy Variant
    },
    // Lịch sử Variant
    ListViewConfigName.materialVariantHistory: {
      PermissionType.export: _materialExporters, // Export variant
      PermissionType.reuse: _materialWriters, // Tái sử dụng
    },
    // Quản Lý BOM
    ListViewConfigName.bomSap: {
      PermissionType.view: [
        ..._materialViewers,
        AccessLevel.prdClerk,
        AccessLevel.syrupTechnician,
      ],
      PermissionType.export: _materialExporters,
      PermissionType.edit: _materialWriters,
    },
    // Chi tiết BOM
    ListViewConfigName.bomDetail: {
      PermissionType.view: _materialViewers,
      PermissionType.export: _materialExporters,
    },
    ListViewConfigName.recipe: {
      PermissionType.view: [
        ..._materialViewers,
        AccessLevel.prdClerk,
        AccessLevel.syrupTechnician,
      ],
      PermissionType.create: _materialWriters,
    },

    // Lịch sử Recipe
    ListViewConfigName.recipeInfoHistory: {
      PermissionType.view: _materialViewers,
      PermissionType.export: _materialExporters,
      PermissionType.reuse: _materialWriters, // Tái sử dụng
    },
    // Chi tiết Recipe
    ListViewConfigName.recipeInfo: {
      PermissionType.view: _materialViewers,
      PermissionType.export: _materialExporters,
      PermissionType.edit: _materialWriters, // Sửa Recipe
      PermissionType.release: _materialWriters, // Phát hành Recipe
      PermissionType.delete: _materialWriters, // Hủy Recipe
    },
    ListViewConfigName.recipeGroupDetail: {
      PermissionType.view: _materialViewers,
      PermissionType.export: _materialExporters,
      PermissionType.edit: _materialWriters, // Sửa Recipe
      PermissionType.release: _materialWriters, // Phát hành Recipe
      PermissionType.delete: _materialWriters, // Hủy Recipe
    },
    // Quản Lý Process Order
    ListViewConfigName.materialProcessOrder: {
      PermissionType.view: _materialViewers,
      PermissionType.export: _materialExporters,
    },
    //weigh
    ListViewConfigName.weighProcessOrder: {
      PermissionType.view: _materialViewers,
      PermissionType.export: _materialExporters,
    },
    ListViewConfigName.weightCommand: {
      PermissionType.view: _materialViewers,
      PermissionType.create: [
        .syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
        .syrupTechnician,
      ],
      PermissionType.delete: [
        .syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
      PermissionType.edit: [.syrupSupervisor, AccessLevel.syrupSupervisorAdmin],
    },
    ListViewConfigName.weighBatch: {
      PermissionType.view: _materialViewers,
      PermissionType.export: _materialExporters,
    },
    ListViewConfigName.weighItem: {PermissionType.view: _materialViewers},
    ListViewConfigName.weighReturnProcessOrder: {
      PermissionType.view: _materialViewers,
      PermissionType.export: _materialExporters,
    },

    ListViewConfigName.weighReturnRequest: {
      PermissionType.view: [..._materialViewers, .syrupTechnician, .prdClerk],
      PermissionType.create: [..._materialWriters, .syrupTechnician],
      PermissionType.delete: _materialWriters,
      PermissionType.submit: _materialWriters,
      PermissionType.reject: _materialWriters,
    },
    ListViewConfigName.itemWeighReturnMaterial: {
      PermissionType.view: _materialViewers,
      PermissionType.export: _materialExporters,
    },
    ListViewConfigName.weighReturnMaterialQrItem: {
      PermissionType.view: _materialViewers,
      PermissionType.export: _materialExporters,
      PermissionType.returnReq: _materialWriters,
      PermissionType.print: _materialWriters,
    },
    ListViewConfigName.weightReport: {
      PermissionType.view: _materialViewers,
      PermissionType.export: _materialExporters,
    },
    // use common for device manager
    ListViewConfigName.deviceManagerScale: {
      PermissionType.view: _materialViewers,
      PermissionType.create: _materialWriters,
      PermissionType.edit: _materialWriters,
      PermissionType.delete: _materialWriters,
    },
    // mixing
    ListViewConfigName.syrupMixingProcessOrder: {
      PermissionType.view: [
        ..._materialViewers,
        AccessLevel.prdClerk,
        AccessLevel.syrupTechnician,
      ],
      PermissionType.export: [
        ..._materialExporters,
        AccessLevel.syrupTechnician,
        AccessLevel.prdClerk,
      ],
    },
    ListViewConfigName.syrupMixingBatch: {
      PermissionType.view: [
        ..._materialViewers,
        AccessLevel.syrupTechnician,
        AccessLevel.prdClerk,
      ],
      PermissionType.create: [
        AccessLevel.syrupTechnician,
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
      PermissionType.confirm: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
        AccessLevel.syrupTechnician,
        AccessLevel.prdClerk,
        AccessLevel.syrupObserver,
        AccessLevel.syrupAdminPlant,
        AccessLevel.syrupObserverNW,
      ],
    },
    ListViewConfigName.mixingBatchDetail: {
      //only syrup supervisor can edit should use common
      PermissionType.edit: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
    },
    ListViewConfigName.mixingWeightProgress: {
      PermissionType.view: [
        ..._materialViewers,
        AccessLevel.syrupTechnician,
        AccessLevel.prdClerk,
      ],
      PermissionType.returnReq: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
      PermissionType.export: [
        ..._materialExporters,
        AccessLevel.syrupTechnician,
        AccessLevel.prdClerk,
      ],
    },
    ListViewConfigName.mixingWeightProgressDetail: {
      PermissionType.print: [
        AccessLevel.syrupTechnician,
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
      PermissionType.returnReq: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
    },
    ListViewConfigName.pickingGroup: {
      PermissionType.view: [
        ..._materialViewers,
        AccessLevel.syrupTechnician,
        AccessLevel.prdClerk,
      ],
      PermissionType.returnReq: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
      PermissionType.export: [
        ..._materialExporters,
        AccessLevel.syrupTechnician,
        AccessLevel.prdClerk,
      ],
    },
    ListViewConfigName.pickingLabel: {
      PermissionType.print: [
        AccessLevel.syrupTechnician,
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
      PermissionType.returnReq: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
    },
    ListViewConfigName.mixingGroup: {
      PermissionType.view: [
        ..._materialViewers,
        AccessLevel.syrupTechnician,
        AccessLevel.prdClerk,
      ],
      PermissionType.returnReq: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
      PermissionType.export: [
        ..._materialExporters,
        AccessLevel.syrupTechnician,
        AccessLevel.prdClerk,
      ],
    },
    ListViewConfigName.mixingLabel: {
      PermissionType.print: [
        AccessLevel.syrupTechnician,
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
      PermissionType.returnReq: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
    },
    ListViewConfigName.syrupMixingMaterialReconcile: {
      PermissionType.view: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
        AccessLevel.prdClerk,
      ],
      PermissionType.export: [
        ..._materialExporters,
        AccessLevel.prdClerk,
        AccessLevel.syrupTechnician,
      ],
      PermissionType.submit: [
        AccessLevel.syrupObserver,
        AccessLevel.syrupAdminPlant,
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
        AccessLevel.syrupObserverNW,
        AccessLevel.prdClerk,
      ],
      PermissionType.confirm: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
        AccessLevel.syrupTechnician,
        AccessLevel.syrupObserver,
        AccessLevel.syrupObserverNW,
        AccessLevel.syrupAdminPlant,
      ],
    },
    ListViewConfigName.syrupMixingConfirmReconcile: {
      PermissionType.export: [
        ..._materialExporters,
        AccessLevel.prdClerk,
        AccessLevel.syrupTechnician,
      ],
      PermissionType.confirm: [AccessLevel.prdClerk],
    },
    ListViewConfigName.syrupMixingHistoryReconCile: {
      PermissionType.view: [..._materialViewers, AccessLevel.prdClerk],
    },
    ListViewConfigName.syrupMixingMaterialWasted: {
      PermissionType.view: [..._materialViewers, AccessLevel.prdClerk],
      PermissionType.export: _materialExporters,
      PermissionType.confirm: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
      PermissionType.delete: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
    },
    ListViewConfigName.syrupMixingConfirmConsumption: {
      PermissionType.export: [
        ..._materialExporters,
        AccessLevel.prdClerk,
        AccessLevel.syrupAdminPlant,
      ],
      PermissionType.confirm: [AccessLevel.prdClerk],
    },
    ListViewConfigName.syrupMixingGoodsReceiptOrder: {
      PermissionType.view: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
        AccessLevel.syrupTechnician,
        AccessLevel.prdClerk,
      ],
      PermissionType.export: [..._materialExporters, AccessLevel.prdClerk],
      PermissionType.confirm: [AccessLevel.prdClerk],
    },
    ListViewConfigName.syrupMixingHistoryGoodsReceiptOrder: {
      PermissionType.export: [..._materialExporters, AccessLevel.prdClerk],
    },
    ListViewConfigName.syrupMixingConfirmGoodReceipt: {
      PermissionType.view: [
        ..._materialViewers,
        AccessLevel.syrupTechnician,
        AccessLevel.prdClerk,
      ],
      PermissionType.export: [..._materialExporters, AccessLevel.prdClerk],
      PermissionType.confirm: [AccessLevel.prdClerk],
    },
    ListViewConfigName.syrupMixingConsumption: {
      PermissionType.view: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
        AccessLevel.syrupTechnician,
        AccessLevel.prdClerk,
      ],
      PermissionType.export: [..._materialExporters, AccessLevel.prdClerk],
      PermissionType.confirm: [
        AccessLevel.prdClerk,
        AccessLevel.syrupTechnician,
        ..._materialViewers,
      ],
    },
    ListViewConfigName.syrupMixingProcessOrderSugarConsumption: {
      PermissionType.export: _materialExporters,
      PermissionType.edit: _materialWriters,
    },
    ListViewConfigName.syrupMixingSugarConsumptionBatch: {
      PermissionType.edit: _materialWriters,
    },
    //setting mixing use common for all setting
    ListViewConfigName.syrupMixingSettingProductionLine: {
      PermissionType.view: [
        .syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
        AccessLevel.syrupTechnician,
      ],
      PermissionType.create: _materialWriters,
      PermissionType.edit: _materialWriters,
      PermissionType.delete: _materialWriters,
    },
    ListViewConfigName.syrupMixingSettingBagSize: {
      PermissionType.view: [
        .syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
        AccessLevel.syrupTechnician,
      ],
      PermissionType.create: _materialWriters,
      PermissionType.edit: _materialWriters,
      PermissionType.delete: _materialWriters,
    },
    ListViewConfigName.syrupMixingSettingStation: {
      PermissionType.view: [
        .syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
        AccessLevel.syrupTechnician,
      ],
      PermissionType.create: _materialWriters,
      PermissionType.edit: _materialWriters,
      PermissionType.delete: _materialWriters,
    },
    ListViewConfigName.syrupMixingSettingCart: {
      PermissionType.view: [
        .syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
        AccessLevel.syrupTechnician,
      ],
      PermissionType.create: _materialWriters,
      PermissionType.edit: _materialWriters,
      PermissionType.delete: _materialWriters,
    },
    ListViewConfigName.syrupMixingSettingMixerTank: {
      PermissionType.view: [
        .syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
        AccessLevel.syrupTechnician,
      ],
      PermissionType.create: _materialWriters,
      PermissionType.edit: _materialWriters,
      PermissionType.delete: _materialWriters,
    },
    ListViewConfigName.syrupMixingSettingMixingTank: {
      PermissionType.view: [
        .syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
        AccessLevel.syrupTechnician,
      ],
      PermissionType.create: _materialWriters,
      PermissionType.edit: _materialWriters,
      PermissionType.delete: _materialWriters,
    },
    ListViewConfigName.syrupMixingSettingDosingLine: {
      PermissionType.view: [
        .syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
        AccessLevel.syrupTechnician,
      ],
      PermissionType.create: _materialWriters,
      PermissionType.edit: _materialWriters,
      PermissionType.delete: _materialWriters,
    },
    //use common for all history setting
    ListViewConfigName.syrupMixingHistorySettingProductionLine: {
      PermissionType.export: _materialExporters,
      PermissionType.reuse: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
    },
    // alarm
    ListViewConfigName.syrupMixingAlarm: {
      PermissionType.export: _materialExporters,
      PermissionType.confirm: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
    },
    // Process Order | Batch Items
    ListViewConfigName.materialBatchItem: {
      PermissionType.view: _materialViewers,
      PermissionType.export: _materialExporters,
    },
    // Quản Lý Sản Phẩm
    ListViewConfigName.product: {
      PermissionType.view: _materialViewers,
      PermissionType.export: _materialExporters,
    },
    //storageProcessOrder
    ListViewConfigName.storageProcessOrder: {
      PermissionType.view: [
        .syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
        AccessLevel.syrupTechnician,
      ],
      PermissionType.export: [
        ..._materialExporters,
        AccessLevel.syrupTechnician,
      ],
    },
    ListViewConfigName.poItemList: {
      PermissionType.print: [
        AccessLevel.syrupTechnician,
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
    },
    ListViewConfigName.warehouseDetail: {
      PermissionType.transfer: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
      PermissionType.returnReq: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
      PermissionType.print: [
        AccessLevel.syrupTechnician,
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
      PermissionType.edit: [..._materialWriters, AccessLevel.syrupTechnician],
    },
    ListViewConfigName.onHandQrCode: {
      PermissionType.transfer: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
      PermissionType.returnReq: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
      PermissionType.print: [
        AccessLevel.syrupTechnician,
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
    },
    ListViewConfigName.storageReturnWarehouse: {
      PermissionType.view: _materialViewers,
      PermissionType.export: [
        ..._materialExporters,
        AccessLevel.syrupTechnician,
      ],
    },
    ListViewConfigName.storageReturnWarehouseItemQrCode: {
      PermissionType.view: _materialViewers,
      PermissionType.print: [
        AccessLevel.syrupTechnician,
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
    },
    ListViewConfigName.storageReturnGoodsProcessOrder: {
      PermissionType.view: _materialViewers,
      PermissionType.export: _materialExporters,
    },
    //krones master data use common for all krones
    ListViewConfigName.kronesMasterData: {
      PermissionType.view: [.syrupSupervisor, AccessLevel.syrupSupervisorAdmin],
      PermissionType.retry: _materialWriters,
      PermissionType.export: _materialExporters,
      PermissionType.import: [
        AccessLevel.syrupSupervisor,
        AccessLevel.syrupSupervisorAdmin,
      ],
    },
    // use common for all page detail
    ListViewConfigName.kronesQualityManagement: {
      PermissionType.export: _materialExporters,
    },
    ListViewConfigName.kronesEdiMessages: {
      PermissionType.export: _materialExporters,
    },
  };

  static final Map<AppRoute, List<AccessLevel>> _noPermissionRoutes = {};

  bool hasRoutePermission({required AppRoute route}) {
    final accessLevels = _noPermissionRoutes[route];
    if (accessLevels == null) {
      return true;
    }
    return !accessLevels.contains(_accessLevel);
  }

  bool hasPermission({
    required ListViewConfigName table,
    required PermissionType action,
    AccessLevel? accessLevel,
  }) {
    // Use provided accessLevel or fallback to current user's accessLevel
    final levelToCheck = accessLevel ?? _accessLevel;

    // Check if screen is configured in matrix
    final screenConfig = _permissions[table];
    if (screenConfig == null) {
      return false;
    }

    // Check if action is configured
    final allowedRoles = screenConfig[action];
    if (allowedRoles == null) {
      return false;
    }

    // Check if user has role
    return allowedRoles.contains(levelToCheck);
  }
}
