import 'package:flutter/material.dart';

import '../../../common/models/models.dart';
import '../../../common/widgets/widgets.dart';
import '../../../core/constants/constants.dart';

class PageDashboard extends StatelessWidget {
  const PageDashboard({super.key});
  static DrawerModel get drawer => Drawers.drawers.firstWhere(
    (element) => element.route == AppRoute.dashboard,
  );
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Dashboard'));
  }
}
