import 'package:flutter/material.dart';

import '../../../core/configs/themes/app_colors.dart';

class ScaledCheckbox extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final bool tristate;
  final Color? activeColor;
  final Color? checkColor;
  final Color? focusColor;
  final Color? hoverColor;
  final WidgetStateProperty<Color?>? fillColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final FocusNode? focusNode;
  final bool autofocus;
  final OutlinedBorder? shape;
  final BorderSide? side;
  final MouseCursor? mouseCursor;
  final VisualDensity? visualDensity;
  final MaterialTapTargetSize? materialTapTargetSize;
  final Color? disabledColor;
  final double scale;
  final bool enabled;
  final Color disabledBorderColor;
  const ScaledCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.tristate = false,
    this.activeColor,
    this.checkColor,
    this.focusColor,
    this.hoverColor,
    this.fillColor,
    this.overlayColor,
    this.splashRadius = 16.0,
    this.focusNode,
    this.autofocus = false,
    this.shape,
    this.side,
    this.mouseCursor,
    this.visualDensity = VisualDensity.compact,
    this.materialTapTargetSize = MaterialTapTargetSize.shrinkWrap,
    this.disabledColor,
    this.scale = 1.0,
    this.enabled = true,
    this.disabledBorderColor = AppColors.borderColorDisabled,
  });

  @override
  Widget build(BuildContext context) {
    final BorderSide? effectiveSide = !enabled
        ? BorderSide(color: disabledBorderColor)
        : side;

    return Transform.scale(
      scale: scale,
      child: Checkbox(
        value: value,
        onChanged: enabled
            ? (value) {
                onChanged?.call(value);
              }
            : null,
        tristate: tristate,
        activeColor: activeColor,
        checkColor: checkColor,
        focusColor: focusColor,
        hoverColor: hoverColor,
        fillColor: fillColor,
        overlayColor: overlayColor,
        splashRadius: splashRadius,
        focusNode: focusNode,
        autofocus: autofocus,
        shape: shape,
        side: effectiveSide,
        mouseCursor: mouseCursor,
        visualDensity: visualDensity,
        materialTapTargetSize: materialTapTargetSize,
      ),
    );
  }
}
