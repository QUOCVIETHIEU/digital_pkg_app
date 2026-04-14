enum Plant {
  hmp(
    plantCode: 'HMP',
    plantId: 1010,
    planName: 'NHÀ MÁY SUNTORY PEPSICO HÓC MÔN',
    address:
        'Nhà máy sản xuất nước giải khát đặt tại Phường Thới An, Quận 12, Thành phố Hồ Chí Minh, Việt Nam.',
  ),
  dop(
    plantCode: 'DOP',
    plantId: 1020,
    planName: 'NHÀ MÁY SUNTORY PEPSICO ĐỒNG NAI',
    address:
        'Khu công nghiệp Long Bình (Amata), Phường Long Bình, Thành phố Biên Hòa, Tỉnh Đồng Nai, Việt Nam.',
  ),
  ctp(
    plantCode: 'CTP',
    plantId: 1030,
    planName: 'NHÀ MÁY SUNTORY PEPSICO CẦN THƠ',
    address:
        'Lô 2.19B, 2.19D, 2.19D1 Khu công nghiệp Trà Nóc II, Phường Phước Thới, Quận Ô Môn, Thành phố Cần Thơ, Việt Nam.',
  ),
  qnp(
    plantCode: 'QNP',
    plantId: 1040,
    planName: 'NHÀ MÁY SUNTORY PEPSICO QUẢNG NAM',
    address:
        'Lô số 10, Khu công nghiệp Điện Nam – Điện Ngọc, Phường Điện Nam Bắc, Thị xã Điện Bàn, Tỉnh Quảng Nam, Việt Nam.',
  ),
  bnp(
    plantCode: 'BNP',
    plantId: 1050,
    planName: 'NHÀ MÁY SUNTORY PEPSICO BẮC NINH',
    address:
        'Số 88 đường Hữu Nghị, Khu công nghiệp đô thị và dịch vụ VSIP Bắc Ninh, Phường Phù Chẩn, Thành phố Từ Sơn, Tỉnh Bắc Ninh, Việt Nam.',
  ),
  lap(
    plantCode: 'LAP',
    plantId: 1060,
    planName: 'NHÀ MÁY SUNTORY PEPSICO LONG AN',
    address:
        'Lô F-3, F-4, F-5, F-6, Đường D5 , Khu công nghiệp Hựu Thạnh, Xã Hựu Thạnh, Huyện Đức Hoà, Tỉnh Long An, Việt Nam.',
  );

  const Plant({
    required this.plantCode,
    required this.plantId,
    required this.planName,
    required this.address,
  });

  final String plantCode;
  final int plantId;
  final String planName;
  final String address;

  static List<String> getPlanCodes(List<int> ids) {
    return ids
        .map(
          (id) => Plant.values
              .firstWhere(
                (plant) => plant.plantId == id,
                orElse: () => throw ArgumentError('Invalid plant ID: $id'),
              )
              .plantCode,
        )
        .toList();
  }

  static List<String> plants = Plant.values.map((e) => e.plantCode).toList();

  static int? getPlantId(String code) {
    Plant? plant;
    for (final p in Plant.values) {
      if (p.plantCode == code) {
        plant = p;
        break;
      }
    }
    return plant?.plantId;
  }

  static String? getPlantCode(int id) {
    Plant? plant;
    for (final p in Plant.values) {
      if (p.plantId == id) {
        plant = p;
        break;
      }
    }
    return plant?.plantCode;
  }

  static String? getPlantName(int id) {
    Plant? plant;
    for (final p in Plant.values) {
      if (p.plantId == id) {
        plant = p;
        break;
      }
    }
    return plant?.planName;
  }

  static String? getAddress(int id) {
    Plant? plant;
    for (final p in Plant.values) {
      if (p.plantId == id) {
        plant = p;
        break;
      }
    }
    return plant?.address;
  }
}

enum ScreenSize {
  small(400),
  normal(600),
  large(1024),
  extraLarge(1440);

  final double size;
  const ScreenSize(this.size);
}

enum ListViewConfigName { request }

enum MultiSplitArea { area1, area2 }

enum DonutStatus { info, waiting, starting, inProgress, finish }

enum PermissionType {
  view,
  export,
  edit,
  delete,
  release,
  reuse,
  create,
  transfer,
  returnReq,
  print,
  submit,
  confirm,
  retry,
  import,
  reject,
}

enum ActionIndicator {
  get,
  insert,
  update,
  delete,
  reActive,
  updateHeader,
  release,
  submit,
  reject,
  none,
}

enum Status {
  initial,
  loading,
  loaded,
  error,
  selected,
  sorted,
  search,
  exported,
  transitionPage,
}

extension ActionIndicatorExtension on ActionIndicator {
  bool get isGet => this == ActionIndicator.get;
  bool get isInsert => this == ActionIndicator.insert;
  bool get isUpdate => this == ActionIndicator.update;
  bool get isDelete => this == ActionIndicator.delete;
  bool get isNone => this == ActionIndicator.none;
  bool get isSubmit => this == ActionIndicator.submit;
  bool get isReject => this == ActionIndicator.reject;
}

enum AccessLevel {
  unknown,
  syrupTechnician, // Syrup Technician
  syrupSupervisor, // Syrup Supervisor
  syrupSupervisorAdmin, // Syrup Supervisor Admin
  prdClerk, // Production Clerk
  syrupObserver, // Syrup Observer
  syrupObserverNW, // Syrup Observer NW
  syrupAdminPlant; // Syrup Admin Plant

  @override
  String toString() {
    switch (this) {
      case AccessLevel.unknown:
        return 'Unknown';
      case AccessLevel.syrupTechnician:
        return 'Syrup Technician';
      case AccessLevel.syrupSupervisor:
        return 'Syrup Supervisor';
      case AccessLevel.syrupSupervisorAdmin:
        return 'Syrup Supervisor Admin';
      case AccessLevel.prdClerk:
        return 'Production Clerk';
      case AccessLevel.syrupObserver:
        return 'Syrup Observer';
      case AccessLevel.syrupObserverNW:
        return 'Syrup Observer NW';
      case AccessLevel.syrupAdminPlant:
        return 'Syrup Admin Plant';
    }
  }
}

extension AccessLevelExtension on AccessLevel {
  bool get isSyrupTechnician => this == AccessLevel.syrupTechnician;
  bool get isSyrupSupervisor => this == AccessLevel.syrupSupervisor;
  bool get isPrdClerk => this == AccessLevel.prdClerk;
  bool get isSyrupObserver => this == AccessLevel.syrupObserver;
  bool get isSyrupObserverNW => this == AccessLevel.syrupObserverNW;
}

enum Department { unknown, productionSyrup, productionLine, qc }

enum ResultCode { wr001, wr002, wr003, wr004, none }
