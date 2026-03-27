import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/typedefs/type_defs.dart';
import '../../../gen/assets.gen.dart';

class DateTimeTextField extends StatefulWidget {
  final String hintText;
  final DateTime? initialDate;
  final bool readOnly;
  final bool enabled;
  final double width;
  final double? height;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateSelectedCallback onDateSelected;
  final String? format;
  final String? iconString;
  final Color? borderColor;
  final bool showPrefixIcon;
  final bool initEmpty;
  final bool showTimePicker;
  const DateTimeTextField({
    super.key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.hintText = 'dd/MM/yyyy',
    this.format = DateTimeFormat.dateFormat,
    required this.onDateSelected,
    this.readOnly = true,
    this.enabled = true,
    this.width = 200,
    this.height = 40,
    this.iconString,
    this.borderColor,
    this.showPrefixIcon = false,
    this.initEmpty = false,
    this.showTimePicker = false,
  });

  @override
  State<DateTimeTextField> createState() => _DateTimeTextFieldState();
}

class _DateTimeTextFieldState extends State<DateTimeTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.initEmpty
          ? ''
          : DateFormat(
              widget.format,
            ).format(widget.initialDate ?? DateTime.now()),
    );
    _focusNode = FocusNode();
  }

  @override
  void didUpdateWidget(covariant DateTimeTextField oldWidget) {
    if (widget.initialDate != oldWidget.initialDate) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _controller.text = DateFormat(
          widget.format,
        ).format(widget.initialDate ?? DateTime.now());
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleTap(BuildContext context) async {
    DateTime? picked;
    DateTime? pickedDate = await showDatePicker(
      barrierDismissible: false,
      context: context,
      initialDate: widget.initialDate ?? DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(1900),
      lastDate: widget.lastDate ?? DateTime(2100),
    );
    picked = pickedDate;
    if (pickedDate != null) {
      picked = pickedDate;
      if (widget.showTimePicker && context.mounted) {
        final time = await showTimePicker(
          barrierDismissible: false,
          context: context,
          initialTime: TimeOfDay.now(),
          initialEntryMode: TimePickerEntryMode.input,
        );
        if (time == null) return;
        picked = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          time.hour,
          time.minute,
        );
      }
      final isValueValid = widget.onDateSelected(picked);
      if (isValueValid) {
        _controller.text = DateFormat(widget.format).format(picked);
        _focusNode.unfocus();
        _controller.selection = TextSelection.collapsed(
          offset: _controller.text.length,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        enabled: widget.enabled,
        controller: _controller,
        readOnly: widget.readOnly,
        focusNode: _focusNode,
        onTap: () => _handleTap(context),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.borderColor,
              width: 0.75,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 0.75),
          ),
          prefixIcon: widget.showPrefixIcon
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    widget.iconString ?? Assets.icons.common.icoCalendar,
                    width: 8,
                    height: 8,
                  ),
                )
              : null,
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
