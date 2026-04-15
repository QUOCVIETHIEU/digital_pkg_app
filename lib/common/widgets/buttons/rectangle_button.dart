import 'package:flutter/material.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/configs.dart';

class IRectangleButton extends StatelessWidget {
  const IRectangleButton({
    super.key,
    required this.leading,
    required this.title,
    this.height = 40.0,
    this.width,
    this.radius = 6.0,
    this.fontSize = 12.0,
    this.borderSize = AppConfigs.borderWidth,
    this.backgroundColor = Colors.transparent,
    this.outlineColor = AppColors.borderColor,
    this.textColor = AppColors.textColor,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.showDivider = true,
    this.padding = const EdgeInsets.all(0.0),
    required this.onPressed,
    this.enable = true,
    this.hasPermission = true,
    this.disabledTextColor = AppColors.disabledBorderTextColor,
    this.enableVerticalDivider = true,
    this.buttonPadding = const EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 12,
    ),
  });

  final Widget leading;
  final String title;
  final double height;
  final double? width;
  final double radius;
  final double fontSize;
  final double borderSize;
  final Color backgroundColor;
  final Color outlineColor;
  final Color textColor;
  final Color disabledTextColor;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final bool showDivider;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onPressed;
  final bool enable;
  final bool hasPermission;
  final bool enableVerticalDivider;
  final EdgeInsets buttonPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        height: height,
        width: width,
        child: hasPermission
            ? OutlinedButton(
                onPressed: enable ? () => onPressed?.call() : null,
                style: OutlinedButton.styleFrom(
                  padding: buttonPadding,
                  side: BorderSide(color: outlineColor, width: borderSize),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  backgroundColor: backgroundColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: enableVerticalDivider ? 0 : 6,
                  children: [
                    SizedBox(width: 12.0, height: 12.0, child: leading),
                    if (enableVerticalDivider)
                      const VerticalDivider(
                        color: AppColors.borderColor,
                        width: 16,
                        thickness: 1,
                        indent: 12.0,
                        endIndent: 12.0,
                      ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                        fontStyle: fontStyle,
                        color: enable
                            ? textColor
                            : disabledTextColor.withValues(alpha: .7),
                      ),
                    ),
                  ],
                ),
              )
            : null,
      ),
    );
  }
}
