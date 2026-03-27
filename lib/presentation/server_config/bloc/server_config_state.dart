part of 'server_config_bloc.dart';

sealed class ServerConfigState extends Equatable {
  const ServerConfigState();

  @override
  List<Object> get props => [];
}

final class ServerConfigInitial extends ServerConfigState {}

class ServerConfigLoading extends ServerConfigState {}

class ServerConfigLoaded extends ServerConfigState {
  final String url;
  final bool canSave;
  const ServerConfigLoaded({required this.url, required this.canSave});

  @override
  List<Object> get props => [url, canSave];
}

class ServerConfigSaving extends ServerConfigState {}

class ServerConfigSaved extends ServerConfigState {}

class ServerConfigError extends ServerConfigState {
  final String message;
  const ServerConfigError(this.message);

  @override
  List<Object> get props => [message];
}

class ServerConfigReset extends ServerConfigState {}

class ServerConfigPingSuccess extends ServerConfigState {
  final String url;
  const ServerConfigPingSuccess(this.url);

  @override
  List<Object> get props => [url];
}

class ServerConfigPingFailure extends ServerConfigState {
  final String message;
  const ServerConfigPingFailure(this.message);

  @override
  List<Object> get props => [message];
}
