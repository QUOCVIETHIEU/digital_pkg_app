import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class FormatUtils {
  static String formatRecipeId({
    required String bomId,
    required int recipeIndex,
    required int bomAlternative,
  }) {
    //00000212_01_001
    return '${bomId.padLeft(8, '0')}_${bomAlternative.toString().padLeft(2, '0')}_${recipeIndex.toString().padLeft(3, '0')}';
  }

  static String formatWeighCommandId(
    String processOrder,
    int weighCommandIndex,
  ) {
    //PLC_1990000904_001
    return 'PLC_${processOrder.padLeft(10, '0')}_${weighCommandIndex.toString().padLeft(3, '0')}';
  }

  static String formatReturnRequestId(
    String processOrder,
    int returnRequestIndex,
  ) {
    //PHK_1990000904_001
    return 'PHK_${processOrder.padLeft(10, '0')}_${returnRequestIndex.toString().padLeft(3, '0')}';
  }

  static String formatDouble(double weight) {
    final formatter = NumberFormat("#.####");
    return formatter.format(weight);
  }

  static double roundWeight(double weight, [int decimalPlaces = 4]) {
    return double.parse(weight.toStringAsFixed(decimalPlaces));
  }

  static double formatProgress(double progress) {
    final formatter = NumberFormat("#,###.####");
    return double.parse(formatter.format(progress)).abs();
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
