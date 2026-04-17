import 'package:flutter/material.dart';
import 'package:tableview2/tableview2.dart';

import '../../../../common/widgets/widgets.dart';
import '../../../../core/configs/themes/app_colors.dart';
import '../../../../data/workflow/models/models.dart';
import 'matrix_preform_material_list.dart';

class MatrixPreformMaterial extends StatelessWidget {
  const MatrixPreformMaterial({
    super.key,
    required this.matrixEdiList,
    required this.listViewConfig,
    required this.onConfigUpdated,
  });
  final List<MatrixEdi> matrixEdiList;
  final ListViewConfigModel listViewConfig;
  final ListViewConfigUpdatedCallback onConfigUpdated;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        border: Border.all(
          color: AppColors.workFlowBorderColorFile,
          width: 0.7,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: MatrixPreFormMaterialList(
              matrixEdiList: matrixEdiList,
              listViewConfig: listViewConfig,
              onConfigUpdated: onConfigUpdated,
            ),
          ),
          StatusIndicator<TestingStatus>(
            values: [
              TestingStatus.testing,
              TestingStatus.testingFollow,
              TestingStatus.testingConfirm,
            ],
            getName: (status) => status.statusName,
            getColor: (status) => status.backgroundColor,
            getDescription: (status) => status.statusDescription,
            textStyle: TextStyle(fontWeight: FontWeight.w600),
            descriptionStyle: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
