import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/configs/themes/app_colors.dart';

class ICircleButton extends StatelessWidget {
  const ICircleButton({
    super.key,
    required this.iconPath,
    this.padding = const EdgeInsets.all(2.0),
    this.constraintsMin = 24.0,
    this.size = 24.0,
    this.color = AppColors.iconDefault,
    this.tooltip = '',
    required this.onPressed,
  });

  final String iconPath;
  final double size;
  final Color color;
  final String tooltip;
  final EdgeInsetsGeometry padding;
  final double constraintsMin;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: IconButton(
        onPressed: () => onPressed(),
        icon: SvgPicture.asset(iconPath, width: size, height: size),
        padding: const EdgeInsets.all(4.0),
        tooltip: tooltip,
        constraints: BoxConstraints(
          minWidth: constraintsMin,
          minHeight: constraintsMin,
        ),
      ),
    );
  }
}
