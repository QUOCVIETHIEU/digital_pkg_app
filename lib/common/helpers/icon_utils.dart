import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class IconUtils {
  static String getSortIcon(
    int sortColumnIndex,
    int currentIndex,
    bool sortAscending,
  ) {
    if (sortColumnIndex == currentIndex && sortAscending) {
      return Assets.icons.common.icoListviewSortUp;
    } else if (sortColumnIndex == currentIndex && !sortAscending) {
      return Assets.icons.common.icoListviewSortDown;
    } else {
      return Assets.icons.common.icoListviewSortNone;
    }
  }

  static Color getSortIconColor(
    int sortColumnIndex,
    int currentIndex,
    bool sortAscending,
  ) {
    if (sortColumnIndex == currentIndex && sortAscending) {
      return Colors.orange;
    } else if (sortColumnIndex == currentIndex && !sortAscending) {
      return Colors.orange;
    } else {
      return Colors.white;
    }
  }
}
