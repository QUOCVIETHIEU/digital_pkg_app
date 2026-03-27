import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_split_view/multi_split_view.dart';

import '../../../common/helpers/utils.dart';
import '../../../common/models/drawer_model.dart';
import '../../../common/widgets/widgets.dart';
import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../gen/assets.gen.dart';
import '../../bloc.dart';
import '../widgets/card_user_info.dart';
import '../widgets/header_user.dart';
import '../widgets/user_detail_list.dart';
import '../widgets/user_list.dart';

class SettingHomePage extends StatefulWidget {
  const SettingHomePage({
    super.key,
    required this.plantName,
    this.showHeader = true,
  });

  final String plantName;
  final bool showHeader;
  static DrawerModel get drawer => Drawers.drawers.firstWhere(
    (element) => element.route == AppRoute.setting,
  );

  @override
  State<SettingHomePage> createState() => _SettingHomePageState();
}

class _SettingHomePageState extends State<SettingHomePage> {
  late MultiSplitViewController _controller;
  @override
  void initState() {
    super.initState();
    context.read<SettingHomeBloc>().add(const SettingLoadRequested());
    _controller = MultiSplitViewController(
      areas: [
        Area(flex: 0.4, data: MultiSplitArea.area1, min: 0.2, max: 2),
        Area(flex: 1.5, data: MultiSplitArea.area2, min: 0.7, max: 2),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingHomeBloc, SettingHomeState>(
      listener: (context, state) {
        if (state.status == Status.loading) {
          IDialog.showDialogLoading(context: context);
        } else if (state.status == Status.loaded) {
          context.popSafety();
        } else if (state.status == Status.error) {
          context.popSafety();
          IDialog.showErrorException(context: context, error: state.error!);
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildSettingHome(context, state)),
            ListFooterWithoutPage(
              onReload: () {
                context.read<SettingHomeBloc>().add(
                  const SettingLoadRequested(),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildSettingHome(BuildContext context, SettingHomeState state) {
    return MultiSplitView(
      axis: Axis.horizontal,
      controller: _controller,
      builder: (context, area) {
        if (area.data == MultiSplitArea.area1) {
          return _buildSettingArea1(context, state);
        }
        return _buildSettingArea2(context, state);
      },
    );
  }

  Widget _buildSettingArea1(BuildContext context, SettingHomeState state) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderUser(
            onSearch: (s) {
              context.read<SettingHomeBloc>().add(SettingSearchRequested(s));
            },
            users: state.users,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: UserList(
              users: state.users,
              selectedUser: state.selectedUser,
              onUserSelected: (user) {
                context.read<SettingHomeBloc>().add(SettingUserSelected(user));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingArea2(BuildContext context, SettingHomeState state) {
    return state.selectedUser == null
        ? Container(
            color: Colors.white,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'QUẢN LÝ USER',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Xem các quyền của user trên app SFI\nPhân quyền mới cho user.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 50),
                SvgPicture.asset(
                  Assets.icons.common.icoUserSetting,
                  height: 200,
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Click chọn user để xem thông tin chi tiết.',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserInfoCard(
                  user: state.selectedUser!,
                  levels: AccessLevel.values
                      .where((e) => e != AccessLevel.unknown)
                      .toList(),
                ),
                Expanded(child: UserDetailList(user: state.selectedUser!)),
              ],
            ),
          );
  }
}
