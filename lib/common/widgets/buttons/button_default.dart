import 'package:flutter/material.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../gen/fonts.gen.dart';

class IButtonDefault extends StatelessWidget {
  const IButtonDefault({
    super.key,
    required this.label,
    this.onPressed,
    this.backgroundColor = const Color(0xFFFFA500),
    this.foregroundColor = Colors.black87,
    this.textColor = Colors.white,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.w500,
    this.borderRadius = 8,
    this.shadowColor = Colors.transparent,
    this.padding = EdgeInsets.zero,
    this.buttonPadding = const EdgeInsets.symmetric(
      horizontal: 24.0,
      vertical: 0.0,
    ),
    this.disableBackgroundButton = AppColors.disableBackgroundButtonDialog,
    this.borderColor,
    this.textStyle,
    this.borderWidth = 0.5,
  });

  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback? onPressed;
  final double borderRadius;
  final Color? shadowColor;
  final EdgeInsets padding;
  final EdgeInsets buttonPadding;
  final Color disableBackgroundButton;
  final TextStyle? textStyle;
  final double borderWidth;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    final disableButton = onPressed == null;
    return Padding(
      padding: padding,
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
          padding: WidgetStateProperty.all<EdgeInsets>(buttonPadding),
          backgroundColor: disableButton
              ? WidgetStateProperty.all<Color>(disableBackgroundButton)
              : WidgetStateProperty.all<Color>(backgroundColor),
          foregroundColor: WidgetStateProperty.all<Color>(foregroundColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          side: WidgetStateProperty.all<BorderSide>(
            BorderSide(
              color: borderColor ?? backgroundColor,
              width: borderWidth,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style:
              textStyle ??
              TextStyle(
                fontSize: fontSize,
                color: textColor,
                fontWeight: fontWeight,
                fontStyle: FontStyle.normal,
                fontFamily: FontFamily.montserrat,
              ),
        ),
      ),
    );
  }
}
