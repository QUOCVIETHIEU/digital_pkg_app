import 'package:flutter/material.dart';

import '../../../../common/helpers/datetime_utils.dart';
import '../../../../core/configs/themes/app_colors.dart';
import '../../../../core/constants/constants.dart';
import '../../../../data/workflow/models/models.dart';
import '../../../../gen/fonts.gen.dart';

class ContentLetter extends StatelessWidget {
  const ContentLetter({super.key, this.materialNotification});
  final MaterialNotification? materialNotification;

  @override
  Widget build(BuildContext context) {
    final dateText = materialNotification?.dateTimeSend == null
        ? '---'
        : DateTimeUtils.formatDateTimeToFormat(
            materialNotification!.dateTimeSend,
            DateTimeFormat.dateFormat,
          );

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.workFlowBorderColorLetter),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: const BoxDecoration(
              color: AppColors.workFlowHeaderLetter,
              border: Border(
                bottom: BorderSide(color: AppColors.workFlowBorderColorLetter),
              ),
            ),
            child: Text(
              'Nội dung:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Text(
                  'Dear Plant Manager,',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  'Đây là email thông báo kế hoạch testing NVL Phôi đến nhà máy DOP vào ngày $dateText.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.visible,
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thông tin nguyên vật liệu như sau:',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    _buildContent(
                      context,
                      'Item code',
                      materialNotification?.itemCode ?? '',
                    ),
                    _buildContent(
                      context,
                      'Số lượng',
                      materialNotification?.quantity.toString() ?? '',
                    ),
                    _buildContent(
                      context,
                      'Line name',
                      materialNotification?.lineName ?? '',
                    ),
                  ],
                ),
                Text('Cảm ơn!', style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SelectableText.rich(
        TextSpan(
          text: '${AppStrings.dotChar} $label: ',
          style: DefaultTextStyle.of(context).style.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textColor,
            fontFamily: FontFamily.montserrat,
          ),
          children: <TextSpan>[
            TextSpan(
              text: value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                fontFamily: FontFamily.montserrat,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
