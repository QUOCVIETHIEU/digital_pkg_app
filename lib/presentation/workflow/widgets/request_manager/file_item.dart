import 'package:digital_pkg_system/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/helpers/utils.dart';
import '../../../../core/configs/themes/app_colors.dart';
import '../../../../data/workflow/models/models.dart';

class FileItem extends StatelessWidget {
  const FileItem({super.key, required this.file});
  final WorkflowFile file;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.workFlowBorderColorFile),
        ),
        child: Row(
          children: [
            Row(
              spacing: 10,
              children: [
                SvgPicture.asset(file.fileType.icon, width: 30, height: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      file.fileName,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 30,
                      children: [
                        Text(
                          file.fileType.name,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.workFlowTextDescription,
                          ),
                        ),
                        Text(
                          '${file.capacity} MB',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.workFlowTextDescription,
                          ),
                        ),
                        Text(
                          DateTimeUtils.formatDateTime(
                            file.uploadDatetime,
                            DateTimeFormat.dateTimeWithPipeFormat,
                          ),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.workFlowTextDescription,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Row(
              spacing: 10,
              children: [
                SizedBox(
                  height: 26,
                  child: IButtonDefault(
                    label: 'Download',
                    backgroundColor: AppColors.backgroundButtonDialogComment,
                    textColor: AppColors.workFlowTextFile,
                    buttonPadding: EdgeInsets.symmetric(horizontal: 2),
                    borderRadius: 4,
                    textStyle: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 26,
                  width: 40,
                  child: IButtonDefault(
                    label: 'View',
                    backgroundColor: AppColors.workFlowTextFileView,
                    borderColor: AppColors.backgroundButtonDialogComment,
                    buttonPadding: EdgeInsets.symmetric(
                      horizontal: 2,
                      vertical: 2,
                    ),
                    borderRadius: 4,
                    textStyle: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: AppColors.returnRequestInitialColor,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
