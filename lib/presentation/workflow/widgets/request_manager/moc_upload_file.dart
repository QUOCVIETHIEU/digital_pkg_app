import 'package:flutter/material.dart';

import '../../../../data/workflow/models/models.dart';
import 'file_item.dart';
import 'header_work_flow_step.dart';

class MocUploadFile extends StatelessWidget {
  const MocUploadFile({super.key, required this.documentMaterial});
  final DocumentMaterial documentMaterial;

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
            Expanded(
              child: Column(
                children: [
                  ...documentMaterial.files.map((file) => FileItem(file: file)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return HeaderWorkFlowStep(
      value: documentMaterial.documentTitle,
      peopleCreate: 'Người tạo: ${documentMaterial.peopleDownload}',
      datetimeCreate: documentMaterial.dateTimeCreate,
    );
  }
}
