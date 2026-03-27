import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/widgets/responsive/responsive_widget.dart';
import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../buttons/custom_icon_button.dart';

class ListFooter extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int rowsPerPage;
  final int totalItems;
  final int startItem;
  final int endItem;
  final List<int> availableRowsPerPage;
  final String updatedText;
  final ValueChanged<int>? onRowsPerPageChanged;
  final VoidCallback? onFirstPage;
  final VoidCallback? onPreviousPage;
  final VoidCallback? onNextPage;
  final VoidCallback? onLastPage;
  final VoidCallback? onReload;

  const ListFooter({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.rowsPerPage,
    required this.totalItems,
    required this.startItem,
    required this.endItem,
    this.availableRowsPerPage = const [10, 20, 30, 40, 50],
    required this.updatedText,
    this.onRowsPerPageChanged,
    this.onFirstPage,
    this.onPreviousPage,
    this.onNextPage,
    this.onLastPage,
    this.onReload,
  });

  @override
  Widget build(BuildContext context) {
    final bool isFirstPageEnabled = currentPage > 0;
    final bool isLastPageEnabled = currentPage < totalPages - 1;
    final Color enabledColor = AppColors.enabledColor;
    final Color disabledColor = AppColors.disabledColor;

    return ResponsiveWidget(
      small: _buildSmall(
        context,
        isFirstPageEnabled,
        isLastPageEnabled,
        enabledColor,
        disabledColor,
      ),
      normal: _buildNormal(
        context,
        isFirstPageEnabled,
        isLastPageEnabled,
        enabledColor,
        disabledColor,
      ),
      large: _buildLarge(
        context,
        isFirstPageEnabled,
        isLastPageEnabled,
        enabledColor,
        disabledColor,
      ),
      extraLarge: _buildLarge(
        context,
        isFirstPageEnabled,
        isLastPageEnabled,
        enabledColor,
        disabledColor,
      ),
    );
  }

  Widget _buildPaginationControls({
    required bool isFirstPageEnabled,
    required bool isLastPageEnabled,
    required Color enabledColor,
    required Color disabledColor,
    required double iconSize,
    required Color backgroundColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
          backgroundColor: backgroundColor,
          icon: SvgPicture.asset(
            Assets.icons.common.icoActionFirstPage,
            width: iconSize,
            height: iconSize,
            colorFilter: isFirstPageEnabled
                ? ColorFilter.mode(enabledColor, BlendMode.srcIn)
                : ColorFilter.mode(disabledColor, BlendMode.srcIn),
          ),
          onPressed: isFirstPageEnabled ? onFirstPage : null,
          tooltip: "First page",
        ),
        const SizedBox(width: 8),
        CustomIconButton(
          backgroundColor: backgroundColor,
          icon: SvgPicture.asset(
            Assets.icons.common.icoActionPreviousPage,
            width: iconSize,
            height: iconSize,
            colorFilter: isFirstPageEnabled
                ? ColorFilter.mode(enabledColor, BlendMode.srcIn)
                : ColorFilter.mode(disabledColor, BlendMode.srcIn),
          ),
          onPressed: isFirstPageEnabled ? onPreviousPage : null,
          tooltip: "Previous page",
        ),
        const SizedBox(width: 8),
        CustomIconButton(
          backgroundColor: backgroundColor,
          icon: SvgPicture.asset(
            Assets.icons.common.icoActionNextPage,
            width: iconSize,
            height: iconSize,
            colorFilter: isLastPageEnabled
                ? ColorFilter.mode(enabledColor, BlendMode.srcIn)
                : ColorFilter.mode(disabledColor, BlendMode.srcIn),
          ),
          onPressed: isLastPageEnabled ? onNextPage : null,
          tooltip: "Next page",
        ),
        const SizedBox(width: 8),
        CustomIconButton(
          backgroundColor: backgroundColor,
          icon: SvgPicture.asset(
            Assets.icons.common.icoActionLastPage,
            width: iconSize,
            height: iconSize,
            colorFilter: isLastPageEnabled
                ? ColorFilter.mode(enabledColor, BlendMode.srcIn)
                : ColorFilter.mode(disabledColor, BlendMode.srcIn),
          ),
          onPressed: isLastPageEnabled ? onLastPage : null,
          tooltip: "Last page",
        ),
      ],
    );
  }

  Widget _buildSmall(
    BuildContext context,
    bool isFirstPageEnabled,
    bool isLastPageEnabled,
    Color enabledColor,
    Color disabledColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 2),
      decoration: const BoxDecoration(
        color: AppColors.systemColor,
        border: Border(top: BorderSide(color: AppColors.borderColor)),
      ),
      child: _buildPaginationControls(
        isFirstPageEnabled: isFirstPageEnabled,
        isLastPageEnabled: isLastPageEnabled,
        enabledColor: enabledColor,
        disabledColor: disabledColor,
        iconSize: 18,
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget _buildNormal(
    BuildContext context,
    bool isFirstPageEnabled,
    bool isLastPageEnabled,
    Color enabledColor,
    Color disabledColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 2),
      decoration: const BoxDecoration(
        color: AppColors.systemColor,
        border: Border(top: BorderSide(color: AppColors.borderColor)),
      ),
      child: _buildPaginationControls(
        isFirstPageEnabled: isFirstPageEnabled,
        isLastPageEnabled: isLastPageEnabled,
        enabledColor: enabledColor,
        disabledColor: disabledColor,
        iconSize: 18,
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget _buildLarge(
    BuildContext context,
    bool isFirstPageEnabled,
    bool isLastPageEnabled,
    Color enabledColor,
    Color disabledColor,
  ) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      margin: const EdgeInsets.only(top: 2),
      decoration: const BoxDecoration(
        color: AppColors.systemColor,
        border: Border(
          top: BorderSide(
            color: AppColors.borderColor,
            width: AppConfigs.strokeWidth,
          ),
        ),
      ),
      child: Row(
        spacing: 2.0,
        children: [
          Row(
            children: [
              if (onReload != null)
                IconButton(
                  onPressed: onReload,
                  padding: const EdgeInsets.all(8),
                  splashRadius: 100,
                  constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                  icon: SvgPicture.asset(
                    Assets.icons.common.icoUpdateTime,
                    width: 16,
                    height: 16,
                  ),
                ),
              InkResponse(
                onTap: onReload,
                child: Text(
                  updatedText,
                  style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text("Result per page "),
          Container(
            padding: const EdgeInsets.only(right: 8.0, left: 4.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                isDense: true,
                value: rowsPerPage,
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                items: availableRowsPerPage
                    .map((v) => DropdownMenuItem(value: v, child: Text("$v")))
                    .toList(),
                onChanged: (v) {
                  if (v != null && onRowsPerPageChanged != null) {
                    onRowsPerPageChanged!(v);
                  }
                },
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.montserrat,
                  color: AppColors.textColor,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 4.0,
                ),
                focusColor: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text("$startItem-$endItem of $totalItems"),
          const SizedBox(width: 16),
          _buildPaginationControls(
            isFirstPageEnabled: isFirstPageEnabled,
            isLastPageEnabled: isLastPageEnabled,
            enabledColor: enabledColor,
            disabledColor: disabledColor,
            iconSize: 20,
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
