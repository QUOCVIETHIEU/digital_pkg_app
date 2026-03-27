import 'package:flutter/material.dart';

import '../../../core/constants/enums.dart';
import '../../helpers/responsive_util.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget small;
  final Widget normal;
  final Widget large;
  final Widget extraLarge;

  const ResponsiveWidget({
    required this.small,
    required this.normal,
    required this.large,
    required this.extraLarge,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = ResponsiveUtil.getScreenSize(context);
    switch (screenSize) {
      case ScreenSize.extraLarge:
        return extraLarge;
      case ScreenSize.large:
        return large;
      case ScreenSize.normal:
        return normal;
      case ScreenSize.small:
        return small;
    }
  }
}
