import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/helpers/utils.dart';
import '../../../../core/constants/constants.dart';
import '../../../../gen/assets.gen.dart';

class HeaderWorkFlowStep extends StatelessWidget {
  const HeaderWorkFlowStep({
    super.key,
    required this.title,
    required this.peopleCreate,
    required this.datetimeCreate,
    this.onClose,
  });
  final String title;
  final String peopleCreate;
  final DateTime? datetimeCreate;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${AppStrings.dotChar} Người tạo: $peopleCreate',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      '${AppStrings.dotChar} Thời gian tạo: ${datetimeCreate != null ? DateTimeUtils.formatDateTime(datetimeCreate!, DateTimeFormat.dateTimeWithPipeFormat) : '---'}',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: onClose ?? () => context.popSafety(),
          child: SvgPicture.asset(
            Assets.icons.common.icoActionClose,
            width: 28,
            height: 28,
          ),
        ),
      ],
    );
  }
}
