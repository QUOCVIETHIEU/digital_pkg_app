import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/configs/themes/app_colors.dart';

class FilterOption<T> {
  final T value;
  final String label;
  final String iconPath;

  const FilterOption({
    required this.value,
    required this.label,
    required this.iconPath,
  });
}

class FilterWidget<T> extends StatelessWidget {
  const FilterWidget({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onFilterChanged,
    this.label,
    this.spacing = 4.0,
    this.buttonPadding = const EdgeInsets.all(8),
    this.borderRadius = 4.0,
  });

  final List<FilterOption<T>> options;
  final T selectedValue;
  final void Function(T value) onFilterChanged;
  final String? label;
  final double spacing;
  final EdgeInsetsGeometry buttonPadding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: spacing,
      children: [
        if (label != null)
          Text(
            label!,
            style: const TextStyle(
              color: AppColors.textColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ...options.map((option) => _buildFilterButton(option)),
      ],
    );
  }

  Widget _buildFilterButton(FilterOption<T> option) {
    final isSelected = selectedValue == option.value;

    TextStyle textStyle() => TextStyle(
      color: AppColors.iconDefault,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onFilterChanged(option.value),
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          padding: buttonPadding,
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.choiceChipSelectedBackground
                : Colors.transparent,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: isSelected
                  ? AppColors.choiceChipSelectedColor
                  : AppColors.borderColor,
              width: 0.5,
            ),
          ),
          child: Row(
            spacing: 8,
            children: [
              SvgPicture.asset(option.iconPath, width: 16, height: 16),
              Text(option.label, style: textStyle()),
            ],
          ),
        ),
      ),
    );
  }
}

// Convenience widget for common filter types
class StatusFilterWidget extends StatelessWidget {
  const StatusFilterWidget({
    super.key,
    required this.selectedStatus,
    required this.onStatusChanged,
    this.options = const [
      FilterOption(value: -1, label: 'All', iconPath: ''),
      FilterOption(value: 0, label: 'Active', iconPath: ''),
      FilterOption(value: 1, label: 'InActive', iconPath: ''),
    ],
  });

  final int selectedStatus;
  final void Function(int status) onStatusChanged;
  final List<FilterOption<int>> options;

  @override
  Widget build(BuildContext context) {
    return FilterWidget<int>(
      options: options,
      selectedValue: selectedStatus,
      onFilterChanged: onStatusChanged,
    );
  }
}

// Convenience widget for enum-based filters
class EnumFilterWidget<T extends Enum> extends StatelessWidget {
  const EnumFilterWidget({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onFilterChanged,
    this.label,
    required this.iconPath,
    this.borderRadius = 4.0,
    this.buttonPadding = const EdgeInsets.all(8),
  });

  final List<FilterOption<T>> options;
  final T selectedValue;
  final void Function(T value) onFilterChanged;
  final String? label;
  final String iconPath;
  final double borderRadius;
  final EdgeInsetsGeometry buttonPadding;

  @override
  Widget build(BuildContext context) {
    return FilterWidget<T>(
      options: options,
      selectedValue: selectedValue,
      onFilterChanged: onFilterChanged,
      label: label,
      borderRadius: borderRadius,
      buttonPadding: buttonPadding,
    );
  }
}
