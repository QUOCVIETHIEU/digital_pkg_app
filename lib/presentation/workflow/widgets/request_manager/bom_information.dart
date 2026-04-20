import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import 'header_work_flow_step.dart';

class BomInformation extends StatelessWidget {
  const BomInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.4,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
      ),
      child: Column(
        spacing: 20,
        children: [
          _buildHeader(context),
          Expanded(
            child: Column(
              spacing: 20,
              children: [Assets.icons.common.icoCommonReservation.image()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return HeaderWorkFlowStep(
      value: 'THÔNG TIN NGUYÊN LIỆU TESTING',
      peopleCreate: 'Người tải: Nguyen Van A',
      datetimeCreate: DateTime.now(),
    );
  }
}
