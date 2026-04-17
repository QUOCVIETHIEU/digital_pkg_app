import 'package:digital_pkg_system/presentation/workflow/widgets/request_manager/header_matrix_material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/widgets/widgets.dart';
import '../../../../core/configs/themes/app_colors.dart';
import '../../../../data/workflow/models/models.dart';
import '../../../../gen/assets.gen.dart';
import '../../../bloc.dart';
import 'header_matrix_item.dart';
import 'matrix_info.dart';
import 'matrix_preform_material.dart';

class MatrixMaterial extends StatefulWidget {
  const MatrixMaterial({super.key, this.workflowStep});
  final WorkflowStep? workflowStep;

  @override
  State<MatrixMaterial> createState() => _MatrixMaterialState();
}

class _MatrixMaterialState extends State<MatrixMaterial> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      small: buildFormContainer(context, widthFactor: 0.8),
      normal: buildFormContainer(context, widthFactor: 0.8),
      large: buildFormContainer(context, widthFactor: 0.8),
      extraLarge: buildFormContainer(context, widthFactor: 0.8),
    );
  }

  Widget buildFormContainer(
    BuildContext context, {
    required double widthFactor,
  }) {
    final matrixEdi = widget.workflowStep?.matrixEdi;
    final state = context.read<RequestManagerBloc>().state;
    return Container(
      width: MediaQuery.sizeOf(context).width * widthFactor,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          _buildAnimatedHeader(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  buildTabBar(),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 280),
                      reverseDuration: const Duration(milliseconds: 180),
                      switchInCurve: Curves.easeOutCubic,
                      switchOutCurve: Curves.easeInCubic,
                      transitionBuilder: (child, animation) {
                        final slideAnimation = Tween<Offset>(
                          begin: const Offset(0.02, 0),
                          end: Offset.zero,
                        ).animate(animation);
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: slideAnimation,
                            child: child,
                          ),
                        );
                      },
                      child: _selectedTabIndex == 0
                          ? buildTabContent(
                              matrixEdi: matrixEdi,
                              sectionTitle: 'CLOSURE',
                            )
                          : MatrixPreformMaterial(
                              matrixEdiList:
                                  widget.workflowStep?.matrixEdiList ?? [],
                              listViewConfig: state.matrixEdiListViewConfig,
                              onConfigUpdated: (config, isFixed) {},
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedHeader() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      reverseDuration: const Duration(milliseconds: 320),
      switchInCurve: Curves.easeOutQuart,
      switchOutCurve: Curves.easeInOutCubic,
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [...previousChildren, ?currentChild],
        );
      },
      transitionBuilder: (child, animation) {
        final slideAnimation = Tween<Offset>(
          begin: const Offset(0, -0.4),
          end: Offset.zero,
        ).animate(animation);
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: slideAnimation,
            child: SizeTransition(
              sizeFactor: animation,
              axisAlignment: -1,
              child: child,
            ),
          ),
        );
      },
      child: KeyedSubtree(
        key: ValueKey<int>(_selectedTabIndex),
        child: _selectedTabIndex == 0
            ? const HeaderMatrixItem()
            : HeaderMatrixMaterial(searchValue: '', onSearch: (value) {}),
      ),
    );
  }

  Widget buildTabBar() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          buildTabLabel(
            title: 'Matrix Item',
            iconPath: Assets.icons.drawers.icoDrawerMatrixItem,
            index: 0,
            borderIsLeft: true,
          ),
          buildTabLabel(
            title: 'Matrix NVL',
            iconPath: Assets.icons.drawers.icoDrawerMatrixNvl,
            index: 1,
            borderIsLeft: false,
          ),
        ],
      ),
    );
  }

  Widget buildTabLabel({
    required String title,
    required String iconPath,
    required int index,
    required bool borderIsLeft,
  }) {
    final isSelected = _selectedTabIndex == index;
    return InkWell(
      onTap: () {
        if (_selectedTabIndex == index) return;
        setState(() => _selectedTabIndex = index);
      },
      borderRadius: borderIsLeft
          ? const BorderRadius.only(topLeft: Radius.circular(10))
          : const BorderRadius.only(topRight: Radius.circular(10)),
      child: Container(
        width: 170,
        height: 44,
        decoration: BoxDecoration(
          gradient: isSelected
              ? null
              : const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFD3DAE4), Color(0xFFEAEAEA)],
                  stops: [0.1, 0.5],
                ),
          color: isSelected ? const Color(0xFF1BB4E9) : null,
          borderRadius: borderIsLeft
              ? const BorderRadius.only(topLeft: Radius.circular(10))
              : const BorderRadius.only(topRight: Radius.circular(10)),
          border: Border(
            top: BorderSide(color: AppColors.workFlowBorderColorFile),
            left: borderIsLeft
                ? BorderSide(color: AppColors.workFlowBorderColorFile)
                : BorderSide.none,
            right: borderIsLeft
                ? BorderSide.none
                : BorderSide(color: AppColors.workFlowBorderColorFile),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 14,
              height: 14,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.primary : const Color(0xFFE8B200),
                BlendMode.srcIn,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? AppColors.primary
                    : AppColors.workFlowTextStepName,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabContent({
    required MatrixEdi? matrixEdi,
    required String sectionTitle,
  }) {
    if (matrixEdi == null) {
      return const SizedBox.shrink();
    }

    return MatrixInfo(matrixEdi: matrixEdi);
  }
}
