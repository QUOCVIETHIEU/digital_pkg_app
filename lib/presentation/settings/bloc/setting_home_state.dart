part of 'setting_home_bloc.dart';

final class SettingHomeState extends Equatable {
  final List<UserInfo> users;
  final List<UserInfo> originalUsers;
  final Status status;
  final AppException? error;
  final UserInfo? selectedUser;
  const SettingHomeState({
    this.users = const [],
    this.originalUsers = const [],
    this.status = Status.loading,
    this.error,
    this.selectedUser,
  });
  SettingHomeState copyWith({
    List<UserInfo>? users,
    List<UserInfo>? originalUsers,
    Status? status,
    AppException? error,
    UserInfo? selectedUser,
  }) {
    return SettingHomeState(
      users: users ?? this.users,
      status: status ?? this.status,
      error: error ?? this.error,
      selectedUser: selectedUser ?? this.selectedUser,
      originalUsers: originalUsers ?? this.originalUsers,
    );
  }

  @override
  List<Object?> get props => [
    users,
    status,
    error,
    selectedUser,
    originalUsers,
  ];
}
