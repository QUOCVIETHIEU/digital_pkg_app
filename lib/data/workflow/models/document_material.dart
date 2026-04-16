import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'document_material.g.dart';

@JsonSerializable()
class DocumentMaterial {
  final String peopleDownload;
  final DateTime dateTimeCreate;
  final List<ParameterTesting>? parameterTestings;
  final String documentTitle;
  final List<WorkflowFile>? files;
  final GlobalUploadType? globalUploadType;
  DocumentMaterial({
    required this.peopleDownload,
    required this.dateTimeCreate,
    this.parameterTestings,
    this.files,
    required this.documentTitle,
    this.globalUploadType,
  });

  factory DocumentMaterial.fromJson(Map<String, dynamic> json) =>
      _$DocumentMaterialFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentMaterialToJson(this);
}

enum GlobalUploadType { globalApprove, globalReject }
