import 'package:json_annotation/json_annotation.dart';

part 'base_req.g.dart';

@JsonSerializable()
class BaseReq {
  final bool isOffLine;
  final int actionIndicator;
  final String updateNote;
  const BaseReq({
    required this.isOffLine,
    required this.actionIndicator,
    required this.updateNote,
  });
  factory BaseReq.fromJson(Map<String, dynamic> json) =>
      _$BaseReqFromJson(json);
  Map<String, dynamic> toJson() => _$BaseReqToJson(this);
}
