import 'package:flutter/material.dart';

import '../../../../common/widgets/widgets.dart';
import '../../../../core/configs/themes/app_theme.dart';
import '../../../../data/workflow/models/models.dart';
import 'content_letter.dart';
import 'header_work_flow_step.dart';

class PlanExecutions extends StatefulWidget {
  const PlanExecutions({super.key, this.materialNotification});
  final MaterialNotification? materialNotification;

  @override
  State<PlanExecutions> createState() => _PlanExecutionsState();
}

class _PlanExecutionsState extends State<PlanExecutions> {
  late TextEditingController sendToPeopleController, subjectController;
  @override
  void initState() {
    super.initState();
    sendToPeopleController = TextEditingController(
      text: widget.materialNotification?.sendToPeople ?? '',
    );
    subjectController = TextEditingController(
      text: widget.materialNotification?.subject ?? '',
    );
  }

  @override
  void dispose() {
    sendToPeopleController.dispose();
    subjectController.dispose();
    super.dispose();
  }

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
        spacing: 30,
        children: [
          _buildHeader(context),
          Expanded(child: SingleChildScrollView(child: _buildBody(context))),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return HeaderWorkFlowStep(
      value: 'YÊU CẦU TESTING NGUYÊN VẬT LIỆU',
      peopleCreate:
          'Người tải: ${widget.materialNotification?.peopleDownload ?? ''}',
      datetimeCreate: widget.materialNotification?.datetimeCreate,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        _buildTextField('To', sendToPeopleController),
        _buildTextField('Subject', subjectController),
        ContentLetter(materialNotification: widget.materialNotification),
      ],
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool enabled = false,
    Color? textColor,
    double? width,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.0,
      children: [
        Row(
          spacing: 8.0,
          children: [
            SizedBox(
              width: width ?? 60,
              child: Text('$label:', style: AppTheme.styleLabelInput),
            ),
            Expanded(
              child: CustomTextFormField(
                style: TextStyle(color: textColor),
                enabled: enabled,
                controller: controller,
                decoration: const InputDecoration(isDense: true),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
