import 'package:json_annotation/json_annotation.dart';

import '../../../common/models/models.dart';
import '../../../gen/assets.gen.dart';

part 'workflow_file.g.dart';

@JsonSerializable()
class WorkflowFile {
  final String fileName;
  final double capacity;
  @ApiDateTimeConverter()
  final DateTime uploadDatetime;
  final String fileUrl;
  final WorkflowFileType fileType;
  WorkflowFile({
    required this.fileName,
    required this.capacity,
    required this.uploadDatetime,
    required this.fileUrl,
    required this.fileType,
  });

  factory WorkflowFile.fromJson(Map<String, dynamic> json) =>
      _$WorkflowFileFromJson(json);
  Map<String, dynamic> toJson() => _$WorkflowFileToJson(this);
}

enum WorkflowFileType { xlsx, pdf, image, docx, none }

extension WorkflowFileTypeExtension on WorkflowFileType {
  String get icon {
    switch (this) {
      case WorkflowFileType.xlsx:
        return Assets.icons.drawers.icoDrawerExcel;
      case WorkflowFileType.pdf:
        return Assets.icons.drawers.icoDrawerPdf;
      case WorkflowFileType.image:
        return Assets.icons.drawers.icoDrawerImage;
      case WorkflowFileType.docx:
        return Assets.icons.drawers.icoDrawerWord;
      case WorkflowFileType.none:
        return Assets.icons.drawers.icoDrawerFile;
    }
  }

  String get name {
    switch (this) {
      case WorkflowFileType.xlsx:
        return 'Excel';
      case WorkflowFileType.pdf:
        return 'PDF';
      case WorkflowFileType.image:
        return 'Jpg';
      case WorkflowFileType.docx:
        return 'DOCX';
      case WorkflowFileType.none:
        return 'NONE';
    }
  }
}
