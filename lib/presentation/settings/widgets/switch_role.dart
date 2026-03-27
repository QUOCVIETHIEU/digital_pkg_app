import 'package:flutter/material.dart';

import '../../../core/configs/themes/app_colors.dart';

class SwitchRole extends StatefulWidget {
  const SwitchRole({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
  });

  final String title;
  final bool value;
  final Function(bool)? onChanged;

  @override
  State<SwitchRole> createState() => _SwitchRoleState();
}

class _SwitchRoleState extends State<SwitchRole> {
  bool switchState = false;

  @override
  void initState() {
    super.initState();
    switchState = widget.value;
  }

  @override
  void didUpdateWidget(covariant SwitchRole oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      setState(() => switchState = widget.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.title,
            style: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        Switch(
          value: switchState,
          trackColor: WidgetStateProperty.all(Colors.grey.shade300),
          inactiveTrackColor: Colors.grey.shade300,
          activeThumbColor: Colors.green,
          activeTrackColor: Colors.green,
          trackOutlineWidth: WidgetStateProperty.all(1.0),
          onChanged: (bool val) {
            if (widget.onChanged != null) {
              setState(() => switchState = val);
              widget.onChanged!(switchState);
            }
          },
        ),
      ],
    );
  }
}
