import 'package:digital_pkg_system/common/helpers/utils.dart';
import 'package:digital_pkg_system/data/workflow/models/models.dart';
import 'package:flutter/material.dart';

import '../../../../core/configs/themes/app_colors.dart';
import '../../../../core/constants/size.dart';
import '../../../../gen/fonts.gen.dart';

class TableExecutions extends StatelessWidget {
  const TableExecutions({super.key, required, required this.batchItems});
  final List<BatchItem> batchItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(
          width: AppSize.borderOutSizeTable,
          color: AppColors.dividerTimeLine,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.borderRadiusCircular),
                topRight: Radius.circular(AppSize.borderRadiusCircular),
              ),
            ),
            child: Row(
              children: [
                _buildHeaderCell('#', 35, AppColors.primary, Alignment.center),
                _buildHeaderCell(
                  'Lot Batch',
                  170,
                  AppColors.primary,
                  Alignment.centerLeft,
                ),
                _buildHeaderCell(
                  'Quantity (Kg)',
                  170,
                  AppColors.primary,
                  Alignment.center,
                ),
                Expanded(
                  child: _buildHeaderCell(
                    'Ghi chú',
                    null,
                    AppColors.primary,
                    Alignment.center,
                  ),
                ),
              ],
            ),
          ),
          ...List.generate(batchItems.length, (index) {
            final item = batchItems[index];

            return IntrinsicHeight(
              child: Row(
                children: [
                  _buildDataCell(
                    '${index + 1}',
                    35,
                    AppColors.batchColor,
                    isCenter: true,
                  ),
                  _buildDataCell(
                    item.batchLot,
                    170,
                    AppColors.primary,
                    isCenter: false,
                  ),
                  _buildDataCell(
                    FormatUtils.formatDouble(item.quantity),
                    170,
                    AppColors.preparedColor,
                  ),
                  Expanded(
                    child: _buildDataCell(
                      item.note ?? '',
                      null,
                      AppColors.preparedColor,
                      isCenter: true,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(
    String text,
    double? width,
    Color textColor,
    Alignment? alignment,
  ) {
    return Container(
      width: width,
      constraints: const BoxConstraints(minHeight: 35),
      decoration: const BoxDecoration(
        color: AppColors.backgroundButtonDialogComment,
        border: Border(
          bottom: BorderSide(
            color: AppColors.dividerTimeLine,
            width: AppSize.borderSizeTable,
          ),
        ),
      ),
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          fontFamily: FontFamily.montserrat,
        ),
      ),
    );
  }

  Widget _buildDataCell(
    String text,
    double? width,
    Color textColor, {
    bool isCenter = true,
    bool isLast = false,
  }) {
    final textStyle = TextStyle(
      fontSize: 11,
      color: AppColors.batchColor,
      fontWeight: FontWeight.w500,
    );

    return Container(
      width: width,
      constraints: const BoxConstraints(minHeight: 35),
      decoration: BoxDecoration(
        border: Border(
          bottom: isLast
              ? BorderSide.none
              : const BorderSide(
                  color: AppColors.dividerTimeLine,
                  width: AppSize.borderSizeTable,
                ),
        ),
      ),
      alignment: isCenter ? Alignment.center : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Text(
          text,
          style: textStyle,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
      ),
    );
  }
}
