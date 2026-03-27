import 'package:flutter/material.dart';

import '../../../core/configs/themes/app_colors.dart';

class PercentProgressBar extends StatelessWidget {
  final double percent; // 0.0 - 100.0
  final double height;
  final double borderRadius;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  const PercentProgressBar({
    super.key,
    required this.percent,
    this.height = 8.0,
    this.borderRadius = 8.0,
    this.textStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final displayPercent = percent.clamp(0, 100);
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                '${displayPercent.toStringAsFixed(0)}%',
                style: textStyle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: LinearProgressIndicator(
                value: displayPercent / 100,
                minHeight: height,
                backgroundColor: Colors.grey.shade300,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.colorAnimatedDonut,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
