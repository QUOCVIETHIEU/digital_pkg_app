import 'package:flutter/material.dart';

class IRichTextTitle extends StatelessWidget {
  const IRichTextTitle({
    super.key,
    required this.label,
    required this.value,
    this.fontSizeValue,
  });
  final String label;
  final String value;
  final double? fontSizeValue;
  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        text: '$label: ',
        style: const TextStyle(fontWeight: FontWeight.w600),
        children: <TextSpan>[
          TextSpan(
            text: value,
            style: const TextStyle(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
