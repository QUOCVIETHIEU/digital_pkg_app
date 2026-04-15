import 'package:flutter/material.dart';

import '../../../../common/helpers/utils.dart';
import '../../../../common/widgets/widgets.dart';
import '../../../../core/configs/themes/app_colors.dart';

class ViewComment extends StatelessWidget {
  const ViewComment({super.key, required this.comment});
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width / 4.5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            'View Comment',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          Text(
            comment,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
          ),
          Text(
            'Approved!',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 10,
        children: [
          IButtonDefault(
            label: 'Ok',
            onPressed: () => context.popSafety(),
            buttonPadding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 2,
            ),
            textStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            backgroundColor: AppColors.backgroundButtonDialogComment,
          ),
        ],
      ),
    );
  }
}
