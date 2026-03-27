import 'package:flutter/material.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../gen/fonts.gen.dart';

class TableCellWrapper extends StatelessWidget {
  const TableCellWrapper({
    super.key,
    required this.child,
    required this.isCenter,
  });
  final Widget child;
  final bool isCenter;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: const TextStyle(
        fontSize: 12,
        color: AppColors.textColor,
        overflow: TextOverflow.ellipsis,
        fontFamily: FontFamily.montserrat,
      ),
      child: isCenter ? Center(child: child) : child,
    );
  }
}
