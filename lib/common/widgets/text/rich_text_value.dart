import 'package:flutter/material.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../gen/fonts.gen.dart';

class IRichTextValue extends StatelessWidget {
  const IRichTextValue({
    super.key,
    required this.label,
    required this.value,
    this.fontSizeValue,
    this.maxLines,
    this.noDot = false,
    this.styleValue,
  });

  final String label;
  final String value;
  final double? fontSizeValue;
  final int? maxLines;
  final bool noDot;
  final TextStyle? styleValue;
  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      maxLines: maxLines,
      TextSpan(
        text: noDot ? '$label: ' : '${AppStrings.dotChar} $label: ',
        style: DefaultTextStyle.of(context).style.copyWith(
          fontSize: fontSizeValue,
          fontWeight: FontWeight.w600,
          color: AppColors.textColor,
          fontFamily: FontFamily.montserrat,
        ),
        children: <TextSpan>[
          TextSpan(
            text: value,
            style:
                styleValue ??
                TextStyle(fontWeight: FontWeight.w500, fontSize: fontSizeValue),
          ),
        ],
      ),
    );
  }
}
