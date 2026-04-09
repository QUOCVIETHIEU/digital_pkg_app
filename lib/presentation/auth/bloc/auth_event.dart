part of 'auth_bloc.dart';

sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

class LoggedIn extends AuthenticationEvent {
  final String username;
  final String password;
  const LoggedIn({required this.username, required this.password});
}

class LoggedOut extends AuthenticationEvent {
  const LoggedOut();
}

class AuthenticationStatusChecked extends AuthenticationEvent {
  const AuthenticationStatusChecked();
}

class UpdatePasswordEvent extends AuthenticationEvent {
  final String userId;
  final String currentPassword;
  final String newPassword;
  const UpdatePasswordEvent({
    required this.userId,
    required this.currentPassword,
    required this.newPassword,
  });
}
