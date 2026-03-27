class ValidationUtils {
  static String? doubleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập giá trị';
    }
    if (double.tryParse(value) == null) {
      return 'Giá trị phải là số';
    }
    return null;
  }

  static String? doubleGreaterThanOrEqualToZeroValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập giá trị';
    }
    if (double.tryParse(value) == null) {
      return 'Giá trị phải là số';
    }
    if (double.tryParse(value)! < 0) {
      return 'Giá trị phải lớn hơn hoặc bằng 0';
    }
    return null;
  }

  static String? intValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập giá trị';
    }
    if (int.tryParse(value) == null) {
      return 'Giá trị phải là số nguyên';
    }
    return null;
  }

  static String? stringValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập giá trị';
    }
    return null;
  }

  static String? reasonValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập lý do';
    }
    return null;
  }

  static String? doubleGreaterThanZeroValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập giá trị';
    }
    if (double.tryParse(value) == null) {
      return 'Giá trị phải là số';
    }
    if (double.tryParse(value)! <= 0) {
      return 'Giá trị phải lớn hơn 0';
    }
    return null;
  }

  static String? intGreaterThanZeroValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập giá trị';
    }
    if (int.tryParse(value) == null) {
      return 'Giá trị phải là số nguyên';
    }
    if (int.tryParse(value)! <= 0) {
      return 'Giá trị phải lớn hơn 0';
    }
    return null;
  }

  static String? intGet10Validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập giá trị';
    }
    if (value.length > 10) {
      return 'Không được nhập quá 10 ký tự';
    }
    if (int.tryParse(value) == null) {
      return 'Giá trị phải là số nguyên';
    }
    return null;
  }

  static String? intGreaterThanOrEqualToZeroValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập giá trị';
    }
    if (int.tryParse(value) == null) {
      return 'Giá trị phải là số nguyên';
    }
    if (int.tryParse(value)! < 0) {
      return 'Giá trị phải lớn hơn hoặc bằng 0';
    }
    return null;
  }

  static String? unitSizeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập giá trị';
    }
    if (int.tryParse(value) == null) {
      return 'Giá trị phải là số nguyên';
    }
    if (int.tryParse(value)! <= 0) {
      return 'Giá trị phải lớn hơn 0';
    }
    if (int.tryParse(value)! >= 1000) {
      return 'Giá trị phải nhỏ hơn 1000';
    }
    return null;
  }

  static String? batchValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập giá trị';
    }
    final regex = RegExp(r'^\d{6}-[A-Z]{3}$');
    if (!regex.hasMatch(value)) {
      return 'Format: ddmmyy-NCC (VD: 021025-SIN)';
    }

    final day = int.tryParse(value.substring(0, 2)) ?? 0;
    final month = int.tryParse(value.substring(2, 4)) ?? 0;

    if (day < 1 || day > 31) {
      return 'Ngày (dd) phải từ 01 - 31. Format: ddmmyy-NCC (VD: 021025-SIN)';
    }
    if (month < 1 || month > 12) {
      return 'Tháng (mm) phải từ 01 - 12. Format: ddmmyy-NCC (VD: 021025-SIN)';
    }

    return null;
  }
}
