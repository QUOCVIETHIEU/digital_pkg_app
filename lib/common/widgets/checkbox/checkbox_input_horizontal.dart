import 'package:flutter/material.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../core/configs/themes/app_theme.dart';
import 'scaled_checkbox.dart';

class CheckboxInputHorizontal extends StatelessWidget {
  const CheckboxInputHorizontal({
    super.key,
    this.labelText = '',
    required this.title,
    required this.value,
    required this.onChanged,
    this.labelWidth = 125.0,
    this.activeColor,
  });

  final String labelText;
  final String title;
  final bool value;
  final ValueChanged<bool?> onChanged;
  final double labelWidth;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.0,
      children: [
        SizedBox(
          width: labelWidth,
          child: labelText.isNotEmpty
              ? Text(labelText, textAlign: TextAlign.end)
              : const SizedBox.shrink(),
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 2.0),
              width: 28,
              height: 28,
              child: ScaledCheckbox(
                value: value,
                onChanged: onChanged,
                activeColor:
                    activeColor ?? AppColors.checkboxActiveCreateColor2,
              ),
            ),
            Text(title, style: value ? AppTheme.styleLabelInput : null),
          ],
        ),
      ],
    );
  }
}
