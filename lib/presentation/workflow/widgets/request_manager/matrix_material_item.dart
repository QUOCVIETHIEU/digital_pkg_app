import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/configs/themes/app_colors.dart';
import '../../../../data/workflow/models/models.dart';
import '../../../../gen/assets.gen.dart';

class MatrixMaterialItem extends StatelessWidget {
  const MatrixMaterialItem({super.key, required this.matrixEdiItem});
  final MatrixEdiItem matrixEdiItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.workFlowBorderColorDone,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            Assets.icons.common.icoCommonBottle,
            width: 36,
            height: 36,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 2,
            children: [
              Text(
                matrixEdiItem.materialCode,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.workFlowTextStepName,
                ),
              ),
              Text(
                matrixEdiItem.materialName,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.workFlowTextStepName,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
