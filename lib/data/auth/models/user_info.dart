import 'package:json_annotation/json_annotation.dart';

import '../../../core/constants/constants.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "username")
  final String userName;
  @JsonKey(name: "fullName")
  final String fullName;
  @JsonKey(name: "phoneNumber")
  final String phoneNumber;
  @JsonKey(name: "address")
  final String address;
  @JsonKey(name: "imagePath")
  final String imagePath;
  @JsonKey(
    name: "accessLevel",
    fromJson: UserInfo.fromJsonAccessLevel,
    toJson: UserInfo.toJsonAccessLevel,
  )
  final AccessLevel accessLevel;
  @JsonKey(
    name: "department",
    fromJson: UserInfo.fromJsonDepartment,
    toJson: UserInfo.toJsonDepartment,
  )
  final Department department;
  @JsonKey(name: "approvalManager")
  final String approvalManager;
  @JsonKey(
    name: "plantArray",
    fromJson: UserInfo.parseIntList,
    toJson: UserInfo._parseIntListToJson,
  )
  final List<int> plantArray;
  @JsonKey(name: "fullRoleName")
  final String? fullRoleName;
  @JsonKey(
    name: "moduleArray",
    fromJson: UserInfo.parseIntList,
    toJson: UserInfo._parseIntListToJson,
  )
  final List<int> moduleArray;

  UserInfo({
    required this.id,
    required this.email,
    required this.userName,
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.imagePath,
    required this.accessLevel,
    required this.department,
    required this.approvalManager,
    required this.plantArray,
    required this.fullRoleName,
    required this.moduleArray,
  });
  static final empty = UserInfo(
    id: '',
    email: '',
    userName: '',
    fullName: '',
    phoneNumber: '',
    address: '',
    imagePath: '',
    accessLevel: AccessLevel.unknown,
    department: Department.unknown,
    approvalManager: '',
    plantArray: const [],
    fullRoleName: '',
    moduleArray: const [],
  );

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

  UserInfo copyWith({
    String? id,
    String? email,
    String? userName,
    String? fullName,
    String? phoneNumber,
    String? address,
    String? imagePath,
    AccessLevel? accessLevel,
    Department? department,
    String? approvalManager,
    List<int>? plantArray,
    String? fullRoleName,
    List<int>? moduleArray,
  }) {
    return UserInfo(
      id: id ?? this.id,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      imagePath: imagePath ?? this.imagePath,
      accessLevel: accessLevel ?? this.accessLevel,
      department: department ?? this.department,
      approvalManager: approvalManager ?? this.approvalManager,
      plantArray: plantArray ?? this.plantArray,
      fullRoleName: fullRoleName ?? this.fullRoleName,
      moduleArray: moduleArray ?? this.moduleArray,
    );
  }

  static List<int> parseIntList(String str) {
    try {
      return str
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(',')
          .map((s) => int.parse(s.trim()))
          .toList();
    } catch (e) {
      return [];
    }
  }

  static String _parseIntListToJson(List<int> plantArray) =>
      plantArray.toString();
  static AccessLevel fromJsonAccessLevel(String accessLevel) {
    return AccessLevel.values.firstWhere(
      (e) => e.name.toLowerCase() == accessLevel.toLowerCase(),
      orElse: () => AccessLevel.unknown,
    );
  }

  static String toJsonAccessLevel(AccessLevel accessLevel) => accessLevel.name;
  static Department fromJsonDepartment(String department) {
    return Department.values.firstWhere(
      (e) => e.name.toLowerCase() == department.toLowerCase(),
      orElse: () => Department.unknown,
    );
  }

  static String toJsonDepartment(Department department) => department.name;
}
