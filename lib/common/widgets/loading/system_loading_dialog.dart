import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../gen/assets.gen.dart';

class SystemLoadingDialog extends StatelessWidget {
  const SystemLoadingDialog({super.key, this.label = 'Đang tải dữ liệu...'});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8.0,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.icons.launchers.appLauncherDigital,
            width: 50,
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: LoadingAnimationWidget.discreteCircle(
              color: AppColors.mosquittoColor,
              size: 40,
            ),
          ),
          Text(label),
        ],
      ),
    );
  }
}
