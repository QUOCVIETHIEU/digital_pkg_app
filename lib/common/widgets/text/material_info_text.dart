import 'package:flutter/material.dart';

class MaterialInfoText extends StatelessWidget {
  const MaterialInfoText({
    super.key,
    required this.primaryText,
    this.secondaryText,
    this.primaryTextStyle,
    this.secondaryTextStyle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String primaryText;
  final String? secondaryText;
  final TextStyle? primaryTextStyle;
  final TextStyle? secondaryTextStyle;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          primaryText,
          style:
              primaryTextStyle ?? const TextStyle(fontWeight: FontWeight.w600),
        ),
        if (secondaryText != null)
          Text(
            secondaryText!,
            style:
                secondaryTextStyle ??
                const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
          ),
      ],
    );
  }
}
