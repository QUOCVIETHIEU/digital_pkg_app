import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/widgets/responsive/responsive_widget.dart';
import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../gen/assets.gen.dart';
import '../../helpers/utils.dart';

class ListFooterWithoutPage extends StatelessWidget {
  final String updatedText;
  final VoidCallback? onReload;

  const ListFooterWithoutPage({
    super.key,
    this.updatedText = '',
    this.onReload,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      small: _buildFooter(),
      normal: _buildFooter(),
      large: _buildFooter(),
      extraLarge: _buildFooter(),
    );
  }

  Widget _buildFooter() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      margin: const EdgeInsets.only(top: 2),
      decoration: const BoxDecoration(
        color: AppColors.systemColor,
        border: Border(
          top: BorderSide(
            color: AppColors.borderColor,
            width: AppConfigs.strokeWidth,
          ),
        ),
      ),
      child: Row(
        spacing: 2.0,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (onReload != null)
            IconButton(
              onPressed: onReload,
              padding: const EdgeInsets.all(8),
              splashRadius: 100,
              constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
              icon: SvgPicture.asset(
                Assets.icons.common.icoUpdateTime,
                width: 16,
                height: 16,
              ),
            ),
          InkResponse(
            onTap: onReload,
            child: Text(
              'Updated at: ${DateTimeUtils.formatDateTime(DateTime.now(), DateTimeFormat.dateTimeWithPipeDateFirstFormat)}',
              style: TextStyle(fontSize: 13, color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}
