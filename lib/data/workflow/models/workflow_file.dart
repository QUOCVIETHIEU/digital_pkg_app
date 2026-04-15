import 'package:json_annotation/json_annotation.dart';

import '../../../common/models/models.dart';

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
