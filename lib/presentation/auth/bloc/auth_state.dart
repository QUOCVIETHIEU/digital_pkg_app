part of 'auth_bloc.dart';

@immutable
sealed class AuthenticationState extends Equatable {
  final UserInfo userInfo;
  const AuthenticationState({required this.userInfo});
}

class Uninitialized extends AuthenticationState {
  const Uninitialized({required super.userInfo});
  @override
  List<Object> get props => [];
}

class Unauthenticated extends AuthenticationState {
  const Unauthenticated({required super.userInfo});
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthenticationState {
  const Authenticated({required super.userInfo});
  @override
  List<Object> get props => [];
}

class AuthenticationLoadInProgress extends AuthenticationState {
  const AuthenticationLoadInProgress({required super.userInfo});
  @override
  List<Object> get props => [];
}

class AuthenticationError extends AuthenticationState {
  final AppException error;
  const AuthenticationError({required super.userInfo, required this.error});
  @override
  List<Object> get props => [error];
}
