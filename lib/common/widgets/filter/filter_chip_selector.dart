import 'package:flutter/material.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/constants.dart';

/// A generic reusable filter chip selection widget
///
/// Type parameter [T] represents the type of items in the list
///
/// Example usage:
/// ```dart
/// FilterChipSelector<MixerTankSetting>(
///   items: mixerTanks,
///   labelBuilder: (item) => item.tankName,
///   isSelectedChecker: (item) => selectedTanks.contains(item),
///   onSelected: (item) => handleSelection(item),
/// )
/// ```
class FilterChipSelector<T> extends StatelessWidget {
  /// List of items to display as filter chips
  final List<T> items;

  /// Function to build the label text for each item
  final String Function(T item) labelBuilder;

  /// Function to check if an item is selected
  final bool Function(T item) isSelectedChecker;

  /// Callback when a chip is selected/deselected
  final void Function(T item) onSelected;

  /// Minimum height of the container (default: 36.0)
  final double minHeight;

  /// Spacing between chips (default: 12.0)
  final double spacing;

  /// Run spacing between chip rows (default: 12.0)
  final double runSpacing;

  /// Container padding (default: EdgeInsets.all(8))
  final EdgeInsets padding;

  /// Font size for chip labels (default: 12)
  final double fontSize;

  const FilterChipSelector({
    super.key,
    required this.items,
    required this.labelBuilder,
    required this.isSelectedChecker,
    required this.onSelected,
    this.minHeight = 36.0,
    this.spacing = 12.0,
    this.runSpacing = 12.0,
    this.padding = const EdgeInsets.all(8),
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: minHeight),
      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.borderTextColor,
          width: AppConfigs.borderWidth,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Wrap(
        spacing: spacing,
        runSpacing: runSpacing,
        children: items.map((item) {
          final isSelected = isSelectedChecker(item);
          return FilterChip(
            label: Text(
              labelBuilder(item),
              style: TextStyle(
                fontSize: fontSize,
                color: isSelected ? Colors.white : null,
              ),
            ),
            selected: isSelected,
            selectedColor: AppColors.backgroundColorFilterChipSelected,
            checkmarkColor: Colors.white,
            backgroundColor: AppColors.backgroundColorFilterChip,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onSelected: (selected) {
              onSelected(item);
            },
          );
        }).toList(),
      ),
    );
  }
}
