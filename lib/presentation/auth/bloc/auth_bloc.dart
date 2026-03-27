import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../common/helpers/utils.dart';
import '../../../common/models/network.dart';
import '../../../core/routes/router.dart';
import '../../../data/auth/models/signin_req_params.dart';
import '../../../data/auth/models/user_info.dart';
import '../../../domain/auth/repositories/auth.dart';
import '../../../service_locator.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(Uninitialized(userInfo: UserInfo.empty)) {
    on<LoggedIn>(_loggedIn);
    on<LoggedOut>(_loggedOut);
    on<AuthenticationStatusChecked>(_authenticationStatusChecked);
    add(const AuthenticationStatusChecked());
    on<UpdatePasswordEvent>(_updatePassword);
  }

  FutureOr<void> _loggedIn(
    LoggedIn event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoadInProgress(userInfo: UserInfo.empty));
    try {
      final signinRes = await sl<AuthRepository>().signIn(
        SigninReqParams(username: event.username, password: event.password),
      );
      await UserPreferences.saveToken(signinRes.accessToken);
      await UserPreferences.saveExpireDatetime(signinRes.expireDatetime);
      await UserPreferences.saveUserInfo(signinRes.userInfo);
      if (signinRes.userInfo.plantArray.isEmpty) {
        emit(Unauthenticated(userInfo: UserInfo.empty));
      } else {
        await sl<AccessUtils>().init();
        sl<AppRouter>().reInit();
        emit(Authenticated(userInfo: signinRes.userInfo));
        await UserPreferences.savePlantId(signinRes.userInfo.plantArray.first);
      }
    } on AppException catch (e) {
      emit(AuthenticationError(userInfo: UserInfo.empty, error: e));
    } catch (e) {
      emit(Unauthenticated(userInfo: UserInfo.empty));
    }
  }

  FutureOr<void> _authenticationStatusChecked(
    AuthenticationStatusChecked event,
    Emitter<AuthenticationState> emit,
  ) async {
    final isLoggedIn = await sl<AuthRepository>().isLoggedIn();
    if (isLoggedIn) {
      final userInfo = await UserPreferences.getUserInfo();
      await sl<AccessUtils>().init();
      sl<AppRouter>().reInit();
      emit(Authenticated(userInfo: userInfo));
    } else {
      emit(Unauthenticated(userInfo: UserInfo.empty));
      await UserPreferences.clearUserInfo();
      await UserPreferences.clearExpireDatetime();
      await UserPreferences.deleteToken();
    }
  }

  FutureOr<void> _loggedOut(
    LoggedOut event,
    Emitter<AuthenticationState> emit,
  ) async {
    await UserPreferences.deleteToken();
    await UserPreferences.clearUserInfo();
    await UserPreferences.clearExpireDatetime();
    emit(Unauthenticated(userInfo: UserInfo.empty));
  }

  FutureOr<void> _updatePassword(
    UpdatePasswordEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoadInProgress(userInfo: state.userInfo));
    try {
      await sl<AuthRepository>().updatePassword(
        userId: event.userId,
        currentPassword: event.currentPassword,
        newPassword: event.newPassword,
      );
      await UserPreferences.deleteToken();
      await UserPreferences.clearUserInfo();
      await UserPreferences.clearExpireDatetime();
      emit(Unauthenticated(userInfo: UserInfo.empty));
    } on AppException catch (e) {
      emit(AuthenticationError(userInfo: state.userInfo, error: e));
    }
  }
}
