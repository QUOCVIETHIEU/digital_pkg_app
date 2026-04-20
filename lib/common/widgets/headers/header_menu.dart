import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../presentation/auth/bloc/auth_bloc.dart';
import '../../helpers/bloc_reload_helper.dart';
import '../../models/drawer_model.dart';
import '../widgets.dart';

class HeaderMenu extends StatefulWidget {
  final DrawerModel drawer;
  final StatefulNavigationShell navigationShell;
  final String? subTitle;
  const HeaderMenu({
    super.key,
    required this.drawer,
    required this.navigationShell,
    this.subTitle,
  });

  @override
  State<HeaderMenu> createState() => _HeaderMenuState();
}

class _HeaderMenuState extends State<HeaderMenu> {
  late String _currentRoute;
  Listenable? _routerListenable;

  @override
  void initState() {
    super.initState();
    _currentRoute = '';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final router = GoRouter.of(context);
    _currentRoute = router.state.name ?? '';

    final listenable = router.routerDelegate;
    if (_routerListenable != listenable) {
      _routerListenable?.removeListener(_onRouteChanged);
      _routerListenable = listenable;
      _routerListenable?.addListener(_onRouteChanged);
    }
  }

  @override
  void dispose() {
    _routerListenable?.removeListener(_onRouteChanged);
    super.dispose();
  }

  void _onRouteChanged() {
    final newRoute = GoRouter.of(context).state.name ?? '';
    if (_currentRoute != newRoute) {
      setState(() {
        _currentRoute = newRoute;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      small: _buildHeader(
        context,
        showMenuItems: false,
        subTitle: widget.subTitle,
      ),
      normal: _buildHeader(
        context,
        showMenuItems: false,
        subTitle: widget.subTitle,
      ),
      large: _buildHeader(
        context,
        showMenuItems: false,
        subTitle: widget.subTitle,
      ),
      extraLarge: _buildHeader(
        context,
        showMenuItems: false,
        subTitle: widget.subTitle,
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context, {
    required bool showMenuItems,
    String? subTitle,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset(
                'assets/icons/drawers/${widget.drawer.icon}_active.svg',
                width: 24.0,
                height: 24.0,
              ),
            ),
            Row(
              children: [
                Text(
                  widget.drawer.title + (subTitle != null ? '  |  ' : ''),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                if (subTitle != null)
                  Text(
                    subTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
              ],
            ),
          ],
        ),
        if (showMenuItems)
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: widget.drawer.children.asMap().entries.map((entry) {
                final route = entry.value.route;
                final DrawerModel item = entry.value;
                final bool isSelected =
                    route.name == _currentRoute ||
                    item.children.any(
                      (child) => child.route.name == _currentRoute,
                    );
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: TextButton(
                    onPressed: () {
                      widget.navigationShell.goBranch(
                        entry.key,
                        initialLocation: true,
                      );
                      BlocReloadHelper.resetAllBypassWarnings();
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        BlocReloadHelper.reloadByRoute(context, item.route);
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: isSelected
                          ? Colors.lightBlue.shade50
                          : Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.title,
                            style: TextStyle(
                              color: isSelected
                                  ? AppColors.activeTextButtonColor
                                  : AppColors.textLevel0,
                              fontSize: 12,
                              fontWeight: isSelected
                                  ? FontWeight.w500
                                  : FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        IAvatarNotchedMenu(
          user: context.read<AuthenticationBloc>().state.userInfo,
          size: const Size(20.0, 20.0),
        ),
      ],
    );
  }
}
