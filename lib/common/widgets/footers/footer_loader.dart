import 'package:flutter/material.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/configs.dart';

class IFooterLoader extends StatelessWidget {
  const IFooterLoader({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConfigs.headerFooterHeight,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(
          top: BorderSide(
            width: AppConfigs.strokeWidth,
            color: AppColors.borderColor,
          ),
          bottom: BorderSide(
            width: AppConfigs.strokeWidth,
            color: AppColors.borderColor,
          ),
        ),
      ),
      child: child,
    );
  }
}
