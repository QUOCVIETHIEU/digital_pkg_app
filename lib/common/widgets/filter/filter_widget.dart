import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../gen/assets.gen.dart';

class FilterOption<T> {
  final T value;
  final String label;

  const FilterOption({required this.value, required this.label});
}

class FilterWidget<T> extends StatelessWidget {
  const FilterWidget({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onFilterChanged,
    this.label = 'Filter:',
    this.showIcon = true,
    this.spacing = 4.0,
    this.buttonPadding = const EdgeInsets.all(8),
    this.borderRadius = 4.0,
  });

  final List<FilterOption<T>> options;
  final T selectedValue;
  final void Function(T value) onFilterChanged;
  final String label;
  final bool showIcon;
  final double spacing;
  final EdgeInsetsGeometry buttonPadding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: spacing,
      children: [
        if (showIcon) ...[
          SvgPicture.asset(Assets.icons.common.icoActionFilter),
          const SizedBox(width: 4),
        ],
        Text(
          label,
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
      color: isSelected ? AppColors.activeTextButtonColor : null,
      fontSize: 12,
    );

    return TextButton(
      onPressed: () => onFilterChanged(option.value),
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textColor,
        textStyle: TextStyle(
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.w300,
          decoration: isSelected
              ? TextDecoration.underline
              : TextDecoration.none,
        ),
        padding: buttonPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(option.label, style: textStyle()),
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
      FilterOption(value: -1, label: 'All'),
      FilterOption(value: 0, label: 'Active'),
      FilterOption(value: 1, label: 'InActive'),
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
    this.label = 'Filter:',
  });

  final List<FilterOption<T>> options;
  final T selectedValue;
  final void Function(T value) onFilterChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    return FilterWidget<T>(
      options: options,
      selectedValue: selectedValue,
      onFilterChanged: onFilterChanged,
      label: label,
    );
  }
}
