import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/helpers/utils.dart';
import '../../../../common/widgets/widgets.dart';
import '../../../../core/configs/themes/app_colors.dart';
import '../../../../core/typedefs/type_defs.dart';
import '../../../../data/workflow/models/models.dart';
import '../../../../gen/assets.gen.dart';
import '../../../bloc.dart';

class HeaderMatrixMaterial extends StatelessWidget {
  const HeaderMatrixMaterial({
    super.key,
    required this.searchValue,
    required this.onSearch,
    required this.onFilter,
  });
  final String searchValue;
  final void Function(String value) onSearch;
  final OnFilterCallback<PlantStatus> onFilter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreformMaterialBlocBloc, PreformMaterialBlocState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 33.0),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.borderColor, width: 1.0),
            ),
          ),
          child: _buildHeader(context, state),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, PreformMaterialBlocState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            _buildFilter(context, state),
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
                value: state.searchQuery,
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

  Widget _buildFilter(BuildContext context, PreformMaterialBlocState state) {
    return EnumFilterWidget<PlantStatus>(
      iconPath: PlantStatus.hmp.iconPath,
      selectedValue: state.plantStatus,
      onFilterChanged: (filterType) {
        onFilter(filterType);
      },
      borderRadius: 16,
      buttonPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      options: [
        FilterOption(
          value: PlantStatus.none,
          label: PlantStatus.none.name,
          iconPath: PlantStatus.none.iconPath,
        ),
        FilterOption(
          value: PlantStatus.hmp,
          label: PlantStatus.hmp.name,
          iconPath: PlantStatus.hmp.iconPath,
        ),
        FilterOption(
          value: PlantStatus.dop,
          label: PlantStatus.dop.name,
          iconPath: PlantStatus.dop.iconPath,
        ),
        FilterOption(
          value: PlantStatus.ctp,
          label: PlantStatus.ctp.name,
          iconPath: PlantStatus.ctp.iconPath,
        ),
        FilterOption(
          value: PlantStatus.qnp,
          label: PlantStatus.qnp.name,
          iconPath: PlantStatus.qnp.iconPath,
        ),
        FilterOption(
          value: PlantStatus.bnp,
          label: PlantStatus.bnp.name,
          iconPath: PlantStatus.bnp.iconPath,
        ),
        FilterOption(
          value: PlantStatus.lap,
          label: PlantStatus.lap.name,
          iconPath: PlantStatus.lap.iconPath,
        ),
        // const FilterOption(value: Plant.none, label: 'Tất cả'),
      ],
    );
  }
}
