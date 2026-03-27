import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../appbars/appbar.dart';
import '../drawers/drawer.dart';

class IFrameMain extends StatelessWidget {
  const IFrameMain({Key? key, required this.navigationShell})
    : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          /// FRAME HEADER APPBAR
          const IAppbar(),

          /// FRAME BODY
          Expanded(
            child: Row(
              children: [
                /// Navigation
                IDrawer(navigationShell: navigationShell, onExpandedChanged: (bool isExpanded) {}),

                /// Main Body
                Expanded(flex: 1, child: navigationShell),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
