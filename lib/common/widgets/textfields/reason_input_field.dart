import 'package:flutter/material.dart';

import '../../../core/configs/themes/app_theme.dart';
import '../../../core/constants/constants.dart';

class ReasonInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final String label;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final int minLines;
  final int maxLines;

  final bool isRequired;

  const ReasonInputField({
    super.key,
    required this.controller,
    this.errorText,
    this.label = 'Lý do',
    this.hintText = 'Nhập lý do huỷ...',
    this.onChanged,
    this.minLines = 6,
    this.maxLines = 7,
    this.isRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppConfigs.spacingTextWithTitle,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: '$label: ',
            style: AppTheme.styleLabelInput,
            children: [
              if (isRequired)
                const TextSpan(
                  text: '*',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
            ],
          ),
        ),

        TextField(
          controller: controller,
          minLines: minLines,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(),
            errorText: errorText,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
