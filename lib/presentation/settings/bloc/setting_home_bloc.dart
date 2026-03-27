import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/helpers/utils.dart';
import '../../../common/models/models.dart';
import '../../../core/constants/constants.dart';
import '../../../data/auth/models/user_info.dart';
import '../../../domain/settings/repositories/settings.dart';
import '../../../service_locator.dart';

part 'setting_home_event.dart';
part 'setting_home_state.dart';

class SettingHomeBloc extends Bloc<SettingHomeEvent, SettingHomeState> {
  SettingHomeBloc() : super(const SettingHomeState()) {
    on<SettingLoadRequested>(_onLoadRequested);
    on<SettingUserSelected>(_onUserSelected);
    on<SettingSearchRequested>(_onSearchRequested);
    on<SettingUserRoleUpdated>(_onUserRoleUpdated);
  }
  Future<void> _onLoadRequested(
    SettingLoadRequested event,
    Emitter<SettingHomeState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final users = await sl<SettingsRepository>().getUsers();
      emit(
        state.copyWith(
          status: Status.loaded,
          users: users,
          originalUsers: users,
        ),
      );
    } on AppException catch (e) {
      emit(state.copyWith(status: Status.error, error: e));
    }
  }

  Future<void> _onUserSelected(
    SettingUserSelected event,
    Emitter<SettingHomeState> emit,
  ) async {
    emit(state.copyWith(selectedUser: event.user, status: Status.selected));
  }

  Future<void> _onSearchRequested(
    SettingSearchRequested event,
    Emitter<SettingHomeState> emit,
  ) async {
    final List<UserInfo> filtered = SearchUtils.filterListBySearch(
      items: state.originalUsers,
      search: event.query,
      getSearchableFields: (m) => [
        m.userName,
        m.email,
        m.fullName,
        m.accessLevel.name,
      ],
    );
    emit(state.copyWith(users: filtered, status: Status.sorted));
  }

  Future<void> _onUserRoleUpdated(
    SettingUserRoleUpdated event,
    Emitter<SettingHomeState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      await sl<SettingsRepository>().updateUser(
        userId: event.user.id,
        accessLevel: event.user.accessLevel.name,
      );
      final updatedOriginalUsers = state.originalUsers.map((user) {
        return user.id == event.user.id ? event.user : user;
      }).toList();

      final updatedUsers = state.users.map((user) {
        return user.id == event.user.id ? event.user : user;
      }).toList();

      final updatedSelectedUser = state.selectedUser?.id == event.user.id
          ? event.user
          : state.selectedUser;

      emit(
        state.copyWith(
          users: updatedUsers,
          originalUsers: updatedOriginalUsers,
          selectedUser: updatedSelectedUser,
          status: Status.loaded,
        ),
      );
    } on AppException catch (e) {
      emit(state.copyWith(status: Status.error, error: e));
    }
  }
}
