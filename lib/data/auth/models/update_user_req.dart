import 'package:json_annotation/json_annotation.dart';

import '../../../common/models/models.dart';

part 'update_user_req.g.dart';

@JsonSerializable()
class UpdateUserReq extends BaseReq {
  @JsonKey(name: 'id')
  final String userId;
  @JsonKey(name: 'accessLevel')
  final String accessLevel;
  UpdateUserReq({
    required super.isOffLine,
    required super.actionIndicator,
    required super.updateNote,
    required this.userId,
    required this.accessLevel,
  });

  factory UpdateUserReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserReqFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$UpdateUserReqToJson(this);
}
