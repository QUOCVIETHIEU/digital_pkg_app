import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/configs/themes/app_colors.dart';
import '../../../../data/workflow/models/models.dart';
import '../../../../gen/assets.gen.dart';
import 'file_item.dart';
import 'header_work_flow_step.dart';
import 'parameter_testing_item.dart';

class MocUploadFile extends StatelessWidget {
  const MocUploadFile({super.key, this.documentMaterial, required this.status});
  final DocumentMaterial? documentMaterial;
  final WorkflowStepStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.4,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
      ),
      child: Column(
        spacing: 20,
        children: [
          _buildHeader(context),
          Expanded(
            child: Column(
              children: [
                if (status == WorkflowStepStatus.globalUpload)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          documentMaterial?.globalUploadType ==
                                  GlobalUploadType.globalApprove
                              ? Assets.icons.drawers.icoDrawerGlobalApprovedStep
                              : Assets
                                    .icons
                                    .drawers
                                    .icoDrawerGlobalRejectedStep,
                        ),
                        Text(
                          documentMaterial?.globalUploadType ==
                                  GlobalUploadType.globalApprove
                              ? 'GLOBAL APPROVED'
                              : 'GLOBAL REJECTED',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color:
                                documentMaterial?.globalUploadType ==
                                    GlobalUploadType.globalApprove
                                ? AppColors.workFlowTextGlobalApproved
                                : AppColors.workFlowTextGlobalRejected,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (documentMaterial?.parameterTestings?.isNotEmpty ?? false)
                  ...documentMaterial!.parameterTestings!.map(
                    (parameterTesting) => ParameterTestingItem(
                      parameterTesting: parameterTesting,
                    ),
                  ),
                if (documentMaterial?.files?.isNotEmpty ?? false)
                  ...documentMaterial!.files!.map(
                    (file) => FileItem(file: file),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return HeaderWorkFlowStep(
      value: documentMaterial?.documentTitle ?? '',
      peopleCreate: 'Người tạo: ${documentMaterial?.peopleDownload ?? ''}',
      datetimeCreate: documentMaterial?.dateTimeCreate,
    );
  }
}
