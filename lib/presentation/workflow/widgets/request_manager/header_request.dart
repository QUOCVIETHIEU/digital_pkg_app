import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/helpers/context_utils.dart';
import '../../../../core/configs/themes/app_colors.dart';
import '../../../../data/workflow/models/workflow_request.dart';
import '../../../../gen/assets.gen.dart';

class HeaderRequest extends StatelessWidget {
  const HeaderRequest({super.key, required this.selectedMaterial});
  final WorkflowRequest selectedMaterial;

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
        spacing: 8,
        children: [
          SvgPicture.asset(Assets.icons.common.icoCommonRequest),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 4,
                children: [
                  InkWell(
                    onTap: () => context.popSafety(),
                    child: SvgPicture.asset(
                      Assets.icons.actions.icoBackPrevious,
                      width: 28,
                      height: 28,
                    ),
                  ),
                  Text(
                    selectedMaterial.requestId,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                spacing: 6,
                children: [
                  Text(
                    'Test nguyên liệu mới theo từ nhà cung cấp CROWN',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SvgPicture.asset(Assets.icons.common.icoCommonPrimary),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
