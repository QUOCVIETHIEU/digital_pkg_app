part of 'setting_home_bloc.dart';

sealed class SettingHomeEvent extends Equatable {
  const SettingHomeEvent();

  @override
  List<Object> get props => [];
}

class SettingLoadRequested extends SettingHomeEvent {
  const SettingLoadRequested();
}

class SettingUserSelected extends SettingHomeEvent {
  const SettingUserSelected(this.user);
  final UserInfo user;
  @override
  List<Object> get props => [user];
}

class SettingSearchRequested extends SettingHomeEvent {
  final String query;
  const SettingSearchRequested(this.query);
  @override
  List<Object> get props => [query];
}

class SettingUserRoleUpdated extends SettingHomeEvent {
  final UserInfo user;
  const SettingUserRoleUpdated(this.user);
  @override
  List<Object> get props => [user];
}
