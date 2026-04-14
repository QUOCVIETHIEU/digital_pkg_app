import 'package:flutter/material.dart';

import '../../../../core/configs/themes/app_colors.dart';
import '../../../../core/constants/size.dart';

class TimelineLine extends StatelessWidget {
  final double width;
  final Color color;
  final double borderRadius;
  final double minHeight;

  const TimelineLine({
    super.key,
    this.width = AppSize.timelineLineWidth,
    this.color = AppColors.dividerTimeLine,
    this.borderRadius = 10,
    this.minHeight = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      width: width,
      constraints: BoxConstraints(minHeight: minHeight),
    );
  }
}
