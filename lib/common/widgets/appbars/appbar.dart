import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/configs.dart';
import '../../../core/constants/strings.dart';
import '../../../gen/assets.gen.dart';
import '../../../presentation/bloc.dart';
import '../menus/menu_notched.dart';

class IAppbar extends StatelessWidget {
  const IAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity,
      height: 45,
      decoration: const ShapeDecoration(
        color: AppColors.background,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: AppConfigs.strokeWidth,
            color: AppColors.borderColor,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                Assets.logos.logoSpvbHeader,
                height: 26.0,
              ),
            ),
          ),
          const Expanded(
            flex: 3,
            child: Text(
              AppStrings.appName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IAvatarNotchedMenu(
                  user: context.read<AuthenticationBloc>().state.userInfo,
                  size: const Size(20.0, 20.0),
                ),
                const SizedBox(width: 2.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
