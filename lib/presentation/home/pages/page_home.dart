import 'package:flutter/material.dart';

import '../../../common/models/models.dart';
import '../../../common/widgets/widgets.dart';
import '../../../core/constants/constants.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});
  static DrawerModel get drawer =>
      Drawers.drawers.firstWhere((element) => element.route == AppRoute.home);
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home'));
  }
}
