import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/configs/themes/app_colors.dart';
import '../../../../data/workflow/models/models.dart';
import '../../../../gen/assets.gen.dart';

class ParameterTestingItem extends StatelessWidget {
  const ParameterTestingItem({super.key, this.parameterTesting});
  final ParameterTesting? parameterTesting;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 4,
                  children: [
                    SvgPicture.asset(Assets.icons.drawers.icoDrawerTag),
                    Text(
                      parameterTesting?.parameterName ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                _buildValueParameter(context),
              ],
            ),
          ),
          SvgPicture.asset(
            Assets.icons.drawers.icoDrawerPassed,
            width: 16,
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildValueParameter(BuildContext context) {
    final values = parameterTesting?.values ?? const <double>[];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(values.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              '·  Value ${index + 1} = ${values[index]} mm',
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: AppColors.workFlowTextDescription,
              ),
              softWrap: true,
            ),
          );
        }),
      ],
    );
  }
}
