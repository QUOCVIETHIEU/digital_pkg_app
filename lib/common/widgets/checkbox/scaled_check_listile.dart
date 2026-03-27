import 'package:flutter/material.dart';

class ScaledCheckListTile extends StatelessWidget {
  const ScaledCheckListTile({
    super.key,
    required this.value,
    required this.onChanged,
    this.title,
    this.subtitle,
    this.isThreeLine = false,
    this.dense,
    this.secondary,
    this.selected = false,
    this.activeColor,
    this.checkColor,
    this.fillColor,
    this.overlayColor,
    this.splashRadius,
    this.autofocus = false,
    this.shape,
    this.side,
    this.mouseCursor,
    this.visualDensity,
    this.contentPadding,
    this.tileColor,
    this.selectedTileColor,
    this.controlAffinity = ListTileControlAffinity.platform,
    this.focusNode,
    this.enableFeedback,
    this.tristate = false,
    this.scale = 1.0,
  });

  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final Widget? title;
  final Widget? subtitle;
  final bool isThreeLine;
  final bool? dense;
  final Widget? secondary;
  final bool selected;
  final Color? activeColor;
  final Color? checkColor;
  final WidgetStateProperty<Color?>? fillColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final bool autofocus;
  final OutlinedBorder? shape;
  final BorderSide? side;
  final MouseCursor? mouseCursor;
  final VisualDensity? visualDensity;
  final EdgeInsetsGeometry? contentPadding;
  final Color? tileColor;
  final Color? selectedTileColor;
  final ListTileControlAffinity controlAffinity;
  final FocusNode? focusNode;
  final bool? enableFeedback;
  final bool tristate;
  final double scale;

  @override
  Widget build(BuildContext context) {
    final Widget scaledCheckbox = Transform.scale(
      scale: scale,
      child: Checkbox(
        value: value,
        onChanged: onChanged,
        tristate: tristate,
        activeColor: activeColor,
        checkColor: checkColor,
        fillColor: fillColor,
        overlayColor: overlayColor,
        splashRadius: splashRadius,
        focusNode: focusNode,
        autofocus: autofocus,
        shape: shape,
        side: side,
        mouseCursor: mouseCursor,
        visualDensity: visualDensity,
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
    );

    Widget? leading;
    Widget? trailing;
    switch (controlAffinity) {
      case ListTileControlAffinity.leading:
        leading = scaledCheckbox;
        trailing = secondary;
        break;
      case ListTileControlAffinity.trailing:
        leading = secondary;
        trailing = scaledCheckbox;
        break;
      case ListTileControlAffinity.platform:
        leading = secondary;
        trailing = scaledCheckbox;
        break;
    }

    return ListTile(
      leading: leading,
      trailing: trailing,
      title: title,
      subtitle: subtitle,
      isThreeLine: isThreeLine,
      dense: dense,
      selected: selected,
      contentPadding: contentPadding,
      tileColor: tileColor,
      selectedTileColor: selectedTileColor,
      visualDensity: visualDensity,
      onTap: onChanged != null ? () => onChanged!(!(value ?? false)) : null,
      enableFeedback: enableFeedback,
    );
  }
}
