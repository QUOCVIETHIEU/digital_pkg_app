import 'package:flutter/material.dart';

import '../../../../common/widgets/widgets.dart';
import '../../../../core/configs/themes/app_theme.dart';
import '../../../../data/workflow/models/models.dart';
import 'content_letter.dart';
import 'file_item.dart';
import 'header_work_flow_step.dart';

class PlanExecutions extends StatefulWidget {
  const PlanExecutions({super.key, this.workflowStep});
  final WorkflowStep? workflowStep;

  @override
  State<PlanExecutions> createState() => _PlanExecutionsState();
}

class _PlanExecutionsState extends State<PlanExecutions> {
  late TextEditingController sendToPeopleController, subjectController;
  @override
  void initState() {
    super.initState();
    final materialNotification = widget.workflowStep?.materialNotification;
    sendToPeopleController = TextEditingController(
      text: materialNotification?.sendToPeople ?? '',
    );
    subjectController = TextEditingController(
      text: materialNotification?.subject ?? '',
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
    return ResponsiveWidget(
      small: _buildFormContainer(context, widthFactor: 0.98),
      normal: _buildFormContainer(context, widthFactor: 0.8),
      large: _buildFormContainer(context, widthFactor: 0.5),
      extraLarge: _buildFormContainer(context, widthFactor: 0.45),
    );
  }

  Widget _buildFormContainer(
    BuildContext context, {
    required double widthFactor,
  }) {
    final materialNotification = widget.workflowStep;
    return Container(
      width: MediaQuery.sizeOf(context).width * widthFactor,
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
          _buildHeader(context, materialNotification?.materialNotification),
          Expanded(
            child: SingleChildScrollView(
              child: _buildBody(
                context,
                materialNotification?.materialNotification,
                materialNotification?.documentMaterial?.files ?? [],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    MaterialNotification? materialNotification,
  ) {
    return HeaderWorkFlowStep(
      value: materialNotification?.title ?? '',
      peopleCreate: 'Người tải: ${materialNotification?.peopleDownload ?? ''}',
      datetimeCreate: materialNotification?.datetimeCreate,
    );
  }

  Widget _buildBody(
    BuildContext context,
    MaterialNotification? materialNotification,
    List<WorkflowFile>? files,
  ) {
    return Column(
      spacing: 20,
      children: [
        _buildTextField('To', sendToPeopleController),
        _buildTextField('Subject', subjectController),
        ContentLetter(materialNotification: materialNotification),
        if (files?.isNotEmpty ?? false)
          Column(
            spacing: 6,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Files đính kèm:', style: AppTheme.styleLabelInput),
              ...files!.map((file) => FileItem(file: file)),
            ],
          ),
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
