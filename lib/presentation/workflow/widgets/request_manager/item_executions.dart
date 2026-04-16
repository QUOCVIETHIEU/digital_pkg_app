import 'package:digital_pkg_system/presentation/workflow/widgets/request_manager/table_executions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/widgets.dart';
import '../../../../core/configs/themes/app_theme.dart';
import '../../../../data/workflow/models/models.dart';
import 'header_work_flow_step.dart';

class ItemExecutions extends StatefulWidget {
  const ItemExecutions({super.key, required this.itemInformation});
  final ItemInformation itemInformation;

  @override
  State<ItemExecutions> createState() => _ItemExecutionsState();
}

class _ItemExecutionsState extends State<ItemExecutions> {
  late TextEditingController itemCodeController,
      itemNameController,
      noteController;

  @override
  void initState() {
    super.initState();
    itemCodeController = TextEditingController(
      text: widget.itemInformation.itemCode,
    );
    itemNameController = TextEditingController(
      text: widget.itemInformation.itemName,
    );
    noteController = TextEditingController(text: widget.itemInformation.note);
  }

  @override
  void dispose() {
    itemCodeController.dispose();
    itemNameController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.4,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
        color: Colors.white,
        child: Column(
          spacing: 20,
          children: [
            _buildHeader(context),
            Expanded(child: SingleChildScrollView(child: _buildBody(context))),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return HeaderWorkFlowStep(
      value: 'THÔNG TIN NGUYÊN LIỆU TESTING',
      peopleCreate: 'Người tải: ${widget.itemInformation.peopleDownload}',
      datetimeCreate: widget.itemInformation.dateTimeCreate,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        _buildField('Mã nguyên liệu', itemCodeController),
        _buildField('Tên nguyên liệu', itemNameController),
        TableExecutions(batchItems: widget.itemInformation.batchItems),
        _buildField('Ghi chú', noteController, maxLines: 3),
      ],
    );
  }

  Widget _buildField(
    String label,
    TextEditingController controller, {
    bool required = true,
    bool enabled = false,
    int maxLines = 1,
    Color? textColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 4.0,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(label, style: AppTheme.styleLabelInput),
            if (required) ...[
              Text(' *', style: const TextStyle(color: Colors.red)),
            ],
          ],
        ),
        CustomTextFormField(
          style: TextStyle(color: textColor),
          enabled: enabled,
          controller: controller,
          maxLines: maxLines,
          decoration: const InputDecoration(isDense: true),
        ),
      ],
    );
  }
}
