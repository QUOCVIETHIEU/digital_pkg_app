import 'package:flutter/material.dart';

class NoteInputTextFieldHorizontal extends StatelessWidget {
  const NoteInputTextFieldHorizontal({
    super.key,
    required this.label,
    required this.controller,
    this.labelWidth = 125.0,
  });
  final String label;
  final TextEditingController controller;
  final double labelWidth;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: labelWidth,
          child: Text(label, textAlign: TextAlign.end),
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            minLines: 6,
            maxLines: 7,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              hintText: 'Ghi chú...',
            ),
          ),
        ),
      ],
    );
  }
}
