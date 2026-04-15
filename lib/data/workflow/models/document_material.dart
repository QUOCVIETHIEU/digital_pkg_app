import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'document_material.g.dart';

@JsonSerializable()
class DocumentMaterial {
  final String peopleDownload;
  final DateTime dateTimeCreate;
  final List<ParameterTesting> parameterTestings;
  final String documentTitle;
  final List<WorkflowFile> files;
  DocumentMaterial({
    required this.peopleDownload,
    required this.dateTimeCreate,
    required this.parameterTestings,
    required this.files,
    required this.documentTitle,
  });

  factory DocumentMaterial.fromJson(Map<String, dynamic> json) =>
      _$DocumentMaterialFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentMaterialToJson(this);
}
