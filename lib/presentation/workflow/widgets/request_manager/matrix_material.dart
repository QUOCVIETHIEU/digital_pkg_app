import 'package:digital_pkg_system/presentation/workflow/widgets/request_manager/header_matrix_material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/widgets/widgets.dart';
import '../../../../core/configs/themes/app_colors.dart';
import '../../../../data/workflow/models/models.dart';
import '../../../../gen/assets.gen.dart';
import 'header_matrix_item.dart';
import 'matrix_info.dart';

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
                          : const SizedBox.shrink(),
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
      duration: const Duration(milliseconds: 660),
      reverseDuration: const Duration(milliseconds: 520),
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
          begin: const Offset(0, -0.3),
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

  Widget buildItemPreview(MatrixEdi matrixEdi) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.workFlowMatrixItemIcon,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.workFlowMatrixItemIconShadow,
            offset: Offset(8, 6),
            blurRadius: 8,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: AppColors.workFlowMatrixItemIconShadow2,
            offset: Offset(-5, 4),
            blurRadius: 25,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 30,
        children: [
          Assets.icons.common.icoCommonPet.image(height: 200),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              buildPetIcon(
                Assets.icons.drawers.icoDrawerSize,
                '${matrixEdi.size.toString()} ${matrixEdi.unit}',
              ),
              buildPetIcon(
                Assets.icons.drawers.icoDrawerWeight,
                '${matrixEdi.weight.toString()} ${matrixEdi.unitWeight}',
              ),
              buildPetIcon(
                Assets.icons.drawers.icoDrawerMixingSap,
                matrixEdi.mold,
              ),
              Text(
                matrixEdi.itemName,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: AppColors.workFlowTextStepName,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPetIcon(String iconPath, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        SizedBox(width: 20, height: 20, child: SvgPicture.asset(iconPath)),
        Text(
          value,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget buildInfoField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2,
      children: [
        Text(
          '$label:',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.workFlowTextDescription,
          ),
        ),
        CustomTextFormField(
          style: const TextStyle(
            color: AppColors.workFlowTextDescription,
            fontWeight: FontWeight.w600,
          ),
          enabled: false,
          controller: controller,
          maxLines: 1,

          disabledTextColor: AppColors.workFlowTextDescription,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
          ),
        ),
      ],
    );
  }
}
