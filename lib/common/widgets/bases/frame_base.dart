import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/drawer_model.dart';
import '../footers/footer_loader.dart';
import '../headers/header_loader.dart';
import '../headers/header_menu.dart';

class IFrameBase extends StatelessWidget {
  const IFrameBase({
    Key? key,
    this.footer,
    this.background = Colors.white,
    required this.navigationShell,
    required this.drawer,
  }) : super(key: key ?? const ValueKey<String>('IFrameBase'));
  final Widget? footer;
  final Color background;
  final StatefulNavigationShell navigationShell;
  final DrawerModel drawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: background,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            IHeaderLoader(
              child: HeaderMenu(
                drawer: drawer,
                navigationShell: navigationShell,
              ),
            ),
            Expanded(child: navigationShell),
            if (footer != null) IFooterLoader(child: footer!),
          ],
        ),
      ),
    );
  }
}
