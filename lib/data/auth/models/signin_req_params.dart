import 'package:json_annotation/json_annotation.dart';

part 'signin_req_params.g.dart';

@JsonSerializable()
class SigninReqParams {
  final String username;
  final String password;
  SigninReqParams({required this.username, required this.password});

  factory SigninReqParams.fromJson(Map<String, dynamic> json) =>
      _$SigninReqParamsFromJson(json);
  Map<String, dynamic> toJson() => _$SigninReqParamsToJson(this);
}
