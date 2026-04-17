import 'package:digital_pkg_system/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/helpers/utils.dart';
import '../../../../common/widgets/widgets.dart';
import '../../../../core/configs/themes/app_colors.dart';
import '../../../../gen/assets.gen.dart';

class HeaderMatrixMaterial extends StatelessWidget {
  const HeaderMatrixMaterial({
    super.key,
    required this.searchValue,
    required this.onSearch,
  });
  final String searchValue;
  final void Function(String value) onSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 33.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.borderColor, width: 1.0),
        ),
      ),
      child: _buildHeader(context),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          spacing: 6,
          children: [
            Text(
              'THÔNG TIN MATRIX NGUYÊN LIỆU PREFORM MỚI',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor,
              ),
            ),
            _buildFilter(context),
          ],
        ),
        SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 8,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(Assets.icons.common.icoActionFilter),
                      Text(
                        'Filters & search:',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () => context.popSafety(),
                    child: SvgPicture.asset(
                      Assets.icons.common.icoActionClose,
                      width: 28,
                      height: 28,
                    ),
                  ),
                ],
              ),
              ITextFieldSearch(
                size: Size(300, 40),
                value: searchValue,
                radius: 100,
                hintText: 'Nhập mã, tên... ',
                onChanged: (s) => onSearch(s),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilter(BuildContext context) {
    return EnumFilterWidget<Plant>(
      iconPath: Plant.hmp.iconPath,
      selectedValue: Plant.hmp,
      onFilterChanged: (filterType) {
        // onFilter(filterType);
      },
      borderRadius: 16,
      buttonPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      options: [
        FilterOption(
          value: Plant.hmp,
          label: Plant.hmp.name,

          iconPath: Plant.hmp.iconPath,
        ),
        FilterOption(
          value: Plant.dop,
          label: Plant.dop.name,
          iconPath: Plant.dop.iconPath,
        ),
        FilterOption(
          value: Plant.ctp,
          label: Plant.ctp.name,
          iconPath: Plant.ctp.iconPath,
        ),
        FilterOption(
          value: Plant.qnp,
          label: Plant.qnp.name,
          iconPath: Plant.qnp.iconPath,
        ),
        FilterOption(
          value: Plant.bnp,
          label: Plant.bnp.name,
          iconPath: Plant.bnp.iconPath,
        ),
        FilterOption(
          value: Plant.lap,
          label: Plant.lap.name,
          iconPath: Plant.lap.iconPath,
        ),
        // const FilterOption(value: Plant.none, label: 'Tất cả'),
      ],
    );
  }
}
