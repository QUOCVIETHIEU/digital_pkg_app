import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';

class TableCellHeader extends StatelessWidget {
  const TableCellHeader({
    super.key,
    required this.child,
    required this.isCenter,
  });
  final Widget child;
  final bool isCenter;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      textAlign: TextAlign.center,
      style: const TextStyle(
        overflow: TextOverflow.clip,
        fontFamily: FontFamily.montserrat,
        fontSize: 12,
        color: Colors.white,
      ),
      child: isCenter ? Center(child: child) : child,
    );
  }
}
