import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../common/helpers/utils.dart';
import '../../../common/widgets/widgets.dart';
import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../data/auth/models/user_info.dart';
import '../../../gen/assets.gen.dart';
import '../../../presentation/bloc.dart';
import '../../models/models.dart';

class IDrawer extends StatefulWidget {
  const IDrawer({
    super.key,
    required this.navigationShell,
    required this.onExpandedChanged,
  });

  final StatefulNavigationShell navigationShell;
  final Function(bool isExpanded) onExpandedChanged;

  @override
  State<IDrawer> createState() => _IDrawerState();
}

class _IDrawerState extends State<IDrawer> {
  UserInfo? user;
  bool expandedDrawer = false;
  int _currentPlantId = 0;
  List<DrawerModel> _drawerItems = [];
  void _getPlantId() async {
    final plantId = await UserPreferences.getPlantId();
    setState(() {
      _currentPlantId = plantId;
    });
    getDrawerItems(plantId);
  }

  void getDrawerItems(int plantId) {
    _drawerItems = Drawers.drawers.where((element) => element.enabled).toList();
    if (plantId != Plant.lap.plantId && plantId != Plant.ctp.plantId) {
      List<DrawerModel> items = _drawerItems;
      _drawerItems = items;
    }
  }

  @override
  void initState() {
    super.initState();
    user = context.read<AuthenticationBloc>().state.userInfo;
    _getPlantId();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: expandedDrawer
          ? AppConfigs.drawerMainExpanded
          : AppConfigs.drawerMainCollapse,
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(
          right: BorderSide(
            width: AppConfigs.strokeWidth,
            color: AppColors.borderColor,
          ),
        ),
      ),
      child: Column(
        children: [
          // 01. DRAWER HEADER
          InkWell(
            onTap: () async {
              if (user != null) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      clipBehavior: Clip.hardEdge,
                      child: DlgSelectPlant(
                        goPlant: (selectedPlant) async {
                          if (selectedPlant == null) {
                            return;
                          }
                          await UserPreferences.savePlantId(selectedPlant);
                          getDrawerItems(selectedPlant);
                          setState(() => _currentPlantId = selectedPlant);
                          if (context.mounted) {
                            while (context.canPop()) {
                              context.popSafety();
                            }
                            context.pushReplacementNamed(
                              AppRoute.workflow.name,
                            );
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              BlocReloadHelper.reloadByRoute(
                                context,
                                AppRoute.workflow,
                              );
                            });
                          }
                        },
                        currentPlant: _currentPlantId,
                        plants: user!.plantArray,
                      ),
                    );
                  },
                );
              } else {
                IDialog.showErrorMessage(
                  context: context,
                  message:
                      'Không tìm thấy thông tin user, vui lòng liên hệ admin để được hướng dẫn.',
                );
              }
            },
            child: Container(
              height: AppConfigs.drawerMenuHeight,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.background,
                border: Border(
                  bottom: BorderSide(
                    width: AppConfigs.strokeWidth,
                    color: AppColors.borderColor,
                  ),
                ),
              ),
              child: expandedDrawer
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 12.0, right: 8.0),
                          child: Icon(
                            Icons.menu_rounded,
                            size: 24.0,
                            color: AppColors.drawerItemColor,
                          ),
                        ),
                        Text(
                          '${Plant.getPlantName(_currentPlantId)} ${expandedDrawer ? 'PLANT' : ''}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.drawerItemColor,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Icon(
                          Icons.menu_rounded,
                          size: 24.0,
                          color: AppColors.drawerItemColor,
                        ),
                        Text(
                          Plant.getPlantCode(_currentPlantId) ?? 'None',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.drawerItemColor,
                          ),
                        ),
                      ],
                    ),
            ),
          ),

          // 02. DRAWER BODY
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ..._drawerItems.asMap().entries.map((entry) {
                    final drawItem = entry.value;
                    final index = entry.key;
                    final bool isSelected =
                        drawItem.route.name ==
                            GoRouter.of(context).state.name ||
                        drawItem.children.any(
                          (child) =>
                              child.route.name ==
                                  GoRouter.of(context).state.name ||
                              child.children.any(
                                (child) =>
                                    child.route.name ==
                                    GoRouter.of(context).state.name,
                              ),
                        );
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: IDrawerMenuItem(
                        tooltip: drawItem.title,
                        iconPath: drawItem.icon,
                        children: drawItem.children,
                        selected: isSelected,
                        expandedDrawer: expandedDrawer,
                        size: 20,
                        onPressed: () {
                          widget.navigationShell.goBranch(
                            index,
                            initialLocation: true,
                          );
                          BlocReloadHelper.resetAllBypassWarnings();
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            BlocReloadHelper.reloadByRoute(
                              context,
                              drawItem.route,
                            );
                          });
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),

          // 03. DRAWER FOOTER
          Container(
            padding: const EdgeInsets.only(bottom: 8.0),
            decoration: const BoxDecoration(
              color: AppColors.background,
              border: Border(
                top: BorderSide(
                  width: AppConfigs.strokeWidth,
                  color: AppColors.borderColor,
                ),
              ),
            ),
            child: expandedDrawer
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ICircleButton(
                          iconPath: Assets.icons.launchers.appLauncher,
                          size: 28.0,
                          onPressed: () async {
                            String url = await UserPreferences.getBaseURL();
                            if (context.mounted) {
                              IDialog.showAboutDialog(context, url);
                            }
                          },
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            '${AppInfoModel.instance.shortVersion} (${AppInfoModel.instance.buildNumber})',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.drawerItemColor,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ICircleButton(
                        iconPath: Assets.icons.common.icoActionExit,
                        size: 24.0,
                        onPressed: () async {},
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ICircleButton(
                        iconPath: Assets.icons.launchers.appLauncherDigital,
                        size: 28.0,
                        onPressed: () async {
                          String url = await UserPreferences.getBaseURL();
                          if (context.mounted) {
                            IDialog.showAboutDialog(context, url);
                          }
                        },
                      ),
                      Column(
                        children: [
                          Text(
                            AppInfoModel.instance.shortVersion,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.drawerItemColor,
                            ),
                          ),
                          Text(
                            '(${AppInfoModel.instance.buildNumber})',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.drawerItemColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
