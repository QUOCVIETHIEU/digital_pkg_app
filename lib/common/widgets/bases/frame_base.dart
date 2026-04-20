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
    this.subTitle,
  }) : super(key: key ?? const ValueKey<String>('IFrameBase'));
  final Widget? footer;
  final Color background;
  final StatefulNavigationShell navigationShell;
  final DrawerModel drawer;
  final String? subTitle;

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
                subTitle: subTitle,
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
