import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/configs.dart';
import '../../../gen/assets.gen.dart';

class IDropdownBasic<T> extends StatefulWidget {
  const IDropdownBasic({
    super.key,
    required this.listItems,
    this.initialItem,
    this.textAlign = TextAlign.start,
    this.fontSize = 12,
    this.fontWeight = FontWeight.normal,
    this.hintText = '',
    this.maxLines = 1,
    this.closeRadius = 4,
    this.expandRadius = 4,
    this.closedHeaderPadding = 10,
    required this.searchHintText,
    this.onItemSelected,
    this.enabled = true,
    this.prefixIcon,
    this.closedSuffixIcon,
    this.closedFillColor,
    this.noClosedBorder = false,
    this.borderColor = AppColors.borderTextColor,
    this.headerBuilder,
    this.required = false,
    this.errorText = '',
  });

  final List<T>? listItems;
  final T? initialItem;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  final String hintText;
  final int maxLines;
  final double closeRadius;
  final double expandRadius;
  final double closedHeaderPadding;
  final String searchHintText;
  final void Function(T value)? onItemSelected;
  final bool enabled;
  final String? prefixIcon;
  final Widget? closedSuffixIcon;
  final Color? closedFillColor;
  final bool noClosedBorder;
  final Color borderColor;
  final Widget Function(BuildContext, T, bool)? headerBuilder;
  final bool required;
  final String errorText;

  @override
  State<IDropdownBasic<T>> createState() => _IDropdownBasicState<T>();
}

class _IDropdownBasicState<T> extends State<IDropdownBasic<T>> {
  bool _hasUserInteracted = false;

  @override
  Widget build(BuildContext context) {
    // Ensure initialItem is either null or present in listItems
    final T? safeInitialItem =
        (widget.initialItem != null &&
            widget.listItems != null &&
            widget.listItems!.contains(widget.initialItem))
        ? widget.initialItem
        : null;
    bool haveError = widget.required && safeInitialItem == null;
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4.0,
        children: [
          CustomDropdown<T>(
            disabledDecoration: CustomDropdownDisabledDecoration(
              headerStyle: const TextStyle(
                fontSize: 12,
                color: AppColors.disabledBorderTextColor,
                fontWeight: FontWeight.normal,
              ),
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color: haveError
                    ? AppColors.errorTextColor
                    : AppColors.disabledBorderColor,
                width: 0.75,
              ),
            ),
            headerBuilder:
                widget.headerBuilder ??
                (context, selectedItem, enabled) {
                  return Text(
                    textAlign: widget.textAlign,
                    selectedItem.toString(),
                    style: TextStyle(
                      color: enabled
                          ? AppColors.textColor
                          : AppColors.disabledBorderTextColor,
                      fontSize: widget.fontSize,
                      fontWeight: widget.fontWeight,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
            enabled: widget.listItems == null ? false : widget.enabled,
            hintText: widget.hintText,
            maxlines: 10,
            initialItem: safeInitialItem,
            closedHeaderPadding: EdgeInsets.all(widget.closedHeaderPadding),
            decoration: CustomDropdownDecoration(
              closedFillColor: widget.closedFillColor ?? Colors.transparent,
              expandedFillColor: Theme.of(context).scaffoldBackgroundColor,
              closedBorderRadius: BorderRadius.circular(widget.closeRadius),
              closedErrorBorderRadius: BorderRadius.circular(
                widget.closeRadius,
              ),
              expandedBorderRadius: BorderRadius.circular(widget.expandRadius),
              closedBorder: Border.all(
                color: haveError
                    ? AppColors.errorTextColor
                    : widget.noClosedBorder
                    ? Colors.transparent
                    : widget.borderColor,
                width: AppConfigs.borderWidth,
              ),
              listItemStyle: const TextStyle(
                color: AppColors.textColor,
                fontSize: 12,
                overflow: TextOverflow.ellipsis,
              ),
              headerStyle: const TextStyle(
                color: AppColors.textColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
              hintStyle: const TextStyle(
                color: AppColors.textColor,
                fontSize: 12,
                fontStyle: FontStyle.italic,
                overflow: TextOverflow.ellipsis,
              ),
              noResultFoundStyle: const TextStyle(
                color: AppColors.textColor,
                fontSize: 12,
                fontStyle: FontStyle.italic,
                overflow: TextOverflow.ellipsis,
              ),
              listItemDecoration: ListItemDecoration(
                selectedColor: Colors.blue.withValues(alpha: 0.1),
                highlightColor: Theme.of(context).scaffoldBackgroundColor,
              ),
              searchFieldDecoration: SearchFieldDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: AppConfigs.borderWidth,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: AppConfigs.borderWidth,
                  ),
                ),
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                textStyle: const TextStyle(
                  color: AppColors.textColor,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              closedSuffixIcon: widget.closedSuffixIcon,
              prefixIcon: widget.prefixIcon == null
                  ? null
                  : SvgPicture.asset(
                      widget.prefixIcon ?? Assets.icons.common.icoAccepted,
                      width: 20,
                      height: 20,
                    ),
            ),
            items: widget.listItems,
            excludeSelected: false,
            onChanged: (value) {
              if (value == null) return;
              if (_hasUserInteracted) {
                widget.onItemSelected?.call(value);
              } else {
                _hasUserInteracted = true;
                if (value != safeInitialItem) {
                  widget.onItemSelected?.call(value);
                }
              }
            },
          ),
          if (haveError && widget.errorText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                widget.errorText,
                style: TextStyle(color: AppColors.errorTextColor, fontSize: 10),
              ),
            ),
        ],
      ),
    );
  }
}
