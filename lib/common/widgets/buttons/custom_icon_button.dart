import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry alignment;
  final Color? color;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final double? splashRadius;
  final bool autofocus;
  final String? tooltip;
  final bool? enableFeedback;
  final BoxConstraints? constraints;
  final VoidCallback? onPressed;
  final FocusNode? focusNode;
  final MouseCursor? mouseCursor;
  final VisualDensity? visualDensity;
  final bool? isSelected;
  final Color? disabledColor;
  final Widget? selectedIcon;
  final ValueChanged<bool>? onHover;
  final VoidCallback? onLongPress;
  final ButtonStyle? style;
  final Color? backgroundColor;
  const CustomIconButton({
    super.key,
    required this.icon,
    this.iconSize,
    this.padding,
    this.alignment = Alignment.center,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.splashRadius = 16,
    this.autofocus = false,
    this.tooltip,
    this.enableFeedback,
    this.constraints,
    this.onPressed,
    this.focusNode,
    this.mouseCursor,
    this.visualDensity,
    this.isSelected,
    this.disabledColor,
    this.selectedIcon,
    this.onHover,
    this.onLongPress,
    this.style,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: icon,
        iconSize: iconSize,
        padding: padding,
        alignment: alignment,
        color: color,
        focusColor: focusColor,
        hoverColor: hoverColor,
        highlightColor: highlightColor,
        splashColor: splashColor,
        splashRadius: splashRadius,
        autofocus: autofocus,
        tooltip: tooltip,
        enableFeedback: enableFeedback,
        constraints: constraints,
        onPressed: onPressed,
        focusNode: focusNode,
        mouseCursor: mouseCursor,
        visualDensity: visualDensity,
        isSelected: isSelected,
        disabledColor: disabledColor,
        selectedIcon: selectedIcon,
        onHover: onHover,
        onLongPress: onLongPress,
        style: style,
      ),
    );
  }
}
