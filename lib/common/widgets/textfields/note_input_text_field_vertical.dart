import 'package:flutter/material.dart';

import '../../../core/configs/themes/app_theme.dart';
import '../../../core/constants/configs.dart';

class NoteInputTextFieldVertical extends StatelessWidget {
  const NoteInputTextFieldVertical({
    super.key,
    required this.label,
    required this.controller,
  });
  final String label;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppConfigs.spacingTextWithTitle,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTheme.styleLabelInput),
        TextFormField(
          controller: controller,
          minLines: 6,
          maxLines: 7,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            isDense: true,
            hintText: 'Ghi chú chỉnh sửa nguyên liệu...',
          ),
        ),
      ],
    );
  }
}
