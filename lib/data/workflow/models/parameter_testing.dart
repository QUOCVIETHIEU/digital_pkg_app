import 'package:json_annotation/json_annotation.dart';

part 'parameter_testing.g.dart';

@JsonSerializable()
class ParameterTesting {
  final String parameterName;
  final List<double> values;
  ParameterTesting({required this.parameterName, required this.values});

  factory ParameterTesting.fromJson(Map<String, dynamic> json) =>
      _$ParameterTestingFromJson(json);
  Map<String, dynamic> toJson() => _$ParameterTestingToJson(this);
}
