import 'package:flutter/rendering.dart';

class DialogModel {
  final String? titleHeader;
  final Map<ValueDialogModel, ValueDialogModel?>? content;
  final String? footer;

  DialogModel({this.titleHeader, this.content, this.footer});
}

class ValueDialogModel {
  final String value;
  final TextStyle? textStyle;

  ValueDialogModel({required this.value, this.textStyle});
}
