import 'package:flutter/material.dart';

import '../../../core/typedefs/type_defs.dart';
import '../../../gen/assets.gen.dart';
import '../dialogs/dialog.dart';
import 'datetime_textfield.dart';

class DateRangePicker extends StatelessWidget {
  const DateRangePicker({
    super.key,
    this.onDateFromSelected,
    this.onDateToSelected,
    this.dateFrom,
    this.dateTo,
  });

  final DateTime? dateFrom;
  final DateTime? dateTo;
  final DateSelectedCallbackVoid? onDateFromSelected;
  final DateSelectedCallbackVoid? onDateToSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Từ ngày:', style: TextStyle(fontSize: 12)),
            const SizedBox(height: 4),
            DateTimeTextField(
              showPrefixIcon: true,
              iconString: Assets.icons.common.icoCalendarFrom,
              onDateSelected: (date) {
                if (date.isAfter(dateTo ?? DateTime.now())) {
                  IDialog.showErrorMessage(
                    context: context,
                    message:
                        'Ngày bắt đầu không được lớn hơn ngày kết thúc được. Chọn lại thời gian để tiếp tục...',
                  );
                  return false;
                }

                onDateFromSelected?.call(date);
                return true;
              },
              initialDate: dateFrom,
            ),
          ],
        ),
        const SizedBox(width: 16),
        const Padding(
          padding: EdgeInsets.only(top: 32), // align with textfields
          child: Text(
            '-',
            style: TextStyle(
              color: Color(0xFF4B5C6B), // match your theme
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Đến ngày:', style: TextStyle(fontSize: 12)),
            const SizedBox(height: 4),
            DateTimeTextField(
              showPrefixIcon: true,
              iconString: Assets.icons.common.icoCalendarTo,
              onDateSelected: (date) {
                if (date.isBefore(dateFrom ?? DateTime.now())) {
                  IDialog.showErrorMessage(
                    context: context,
                    message:
                        'Ngày kết thúc không được nhỏ hơn ngày bắt đầu được. Chọn lại thời gian để tiếp tục...',
                  );
                  return false;
                }
                onDateToSelected?.call(date);
                return true;
              },
              initialDate: dateTo,
            ),
          ],
        ),
      ],
    );
  }
}
