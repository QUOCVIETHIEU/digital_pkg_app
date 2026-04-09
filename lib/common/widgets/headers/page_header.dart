import 'package:flutter/material.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../core/typedefs/type_defs.dart';
import '../widgets.dart';

class IPageHeader extends StatelessWidget {
  final Widget image;
  final String title;
  final List<Widget>? actions;
  final String? searchLabel;
  final String? searchHint;
  final String searchValue;
  final OnSearchCallback? onSearchChanged;
  final void Function(String)? onSearchSubmitted;
  final bool showSearch;

  const IPageHeader({
    super.key,
    required this.image,
    required this.title,
    this.actions,
    this.searchLabel,
    this.searchHint,
    this.searchValue = '',
    this.onSearchChanged,
    this.onSearchSubmitted,
    this.showSearch = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.borderColor, width: 1.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon Block
          Container(
            width: 72.0,
            height: 72.0,
            decoration: BoxDecoration(
              color: AppColors.selectedColor, // Light blue background
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(child: image),
          ),
          const SizedBox(width: 16.0),

          // Title and Buttons Block
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                if (actions != null && actions!.isNotEmpty) ...[
                  const SizedBox(height: 8.0),
                  Wrap(spacing: 8.0, runSpacing: 8.0, children: actions!),
                ],
              ],
            ),
          ),

          // Search Block
          if (showSearch) ...[
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (searchLabel != null) ...[
                  Text(
                    searchLabel!,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                ],
                ITextFieldSearch(
                  size: const Size(250.0, 40.0),
                  value: searchValue,
                  hintText: searchHint ?? 'Nhập mã, tên... ',
                  onChanged: onSearchChanged,
                  onFieldSubmitted: onSearchSubmitted,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
