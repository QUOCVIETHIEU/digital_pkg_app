import 'package:flutter/material.dart';

typedef DateSelectedCallback = bool Function(DateTime);
typedef DateSelectedCallbackVoid = void Function(DateTime);

typedef OnSearchCallback = void Function(String);
typedef OnSelectCallback<T> = void Function(T);
typedef OnSelectCheckCallback<T> = void Function(bool, T);
typedef OnSelectCheckAllCallback = void Function(bool);
typedef OnSelectChipCallback<T> = void Function(T);
typedef OnFilterCallback<T> = void Function(T);
typedef OnActionCallback<T> = void Function(T);
typedef ListItemBuilder<T> =
    Widget Function(
      BuildContext context,
      T item,
      bool isSelected,
      VoidCallback onItemSelect,
    );
typedef OnConfirmMaterialRecipeCallback =
    void Function(
      String itemCode,
      int? packCount,
      double weight,
      String note,
      bool isAccepTableTolerance,
    );

typedef OnDateRangeChangedCallback =
    void Function(DateTime dateFrom, DateTime dateTo);
typedef ListViewSortCallback = void Function(int columnIndex, bool ascending);
typedef HeaderBuilder<T> =
    Widget Function(BuildContext context, T selectedItem, bool enabled);
