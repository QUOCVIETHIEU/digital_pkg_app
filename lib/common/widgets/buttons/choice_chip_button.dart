import 'package:flutter/material.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/configs.dart';

class ChoiceChipButton extends StatelessWidget {
  const ChoiceChipButton({
    super.key,
    required this.icon,
    required this.title,
    this.height = 40.0,
    this.width,
    this.radius = 32.0,
    this.fontSize = 12.0,
    this.borderSize = AppConfigs.borderWidth,
    this.backgroundColor = Colors.transparent,
    this.outlineColor = AppColors.borderColor,
    this.textColor = AppColors.textColor,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.showDivider = true,
    this.padding = const EdgeInsets.all(0.0),
    required this.onSelected,
    this.enable = true,
    this.disabledTextColor = AppColors.disabledBorderTextColor,
    required this.selected,
    this.selectedColor = AppColors.choiceChipSelectedColor,
    this.selectedBackgroundColor = AppColors.choiceChipSelectedBackground,
  });

  final Widget icon;
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
  final Function() onSelected;
  final bool enable;
  final bool selected;
  final Color selectedColor;
  final Color selectedBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        height: height,
        width: width,
        child: OutlinedButton(
          onPressed: enable ? () => onSelected() : null,
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 4.0,
            ),
            side: BorderSide(
              color: selected ? selectedColor : outlineColor,
              width: borderSize,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            backgroundColor: selected
                ? selectedBackgroundColor
                : backgroundColor,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8.0,
            children: [
              SizedBox(width: 16.0, height: 16.0, child: icon),

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
        ),
      ),
    );
  }
}
