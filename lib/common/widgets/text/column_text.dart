import 'package:flutter/material.dart';

class ColumnText extends StatelessWidget {
  const ColumnText({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [Text(text1), Text(text2)],
    );
  }
}
