part of 'server_config_bloc.dart';

sealed class ServerConfigEvent extends Equatable {
  const ServerConfigEvent();

  @override
  List<Object> get props => [];
}

class LoadServerConfig extends ServerConfigEvent {}

class SaveServerConfig extends ServerConfigEvent {
  final String url;
  const SaveServerConfig(this.url);

  @override
  List<Object> get props => [url];
}

class ResetServerConfig extends ServerConfigEvent {}

class PingServerConfig extends ServerConfigEvent {
  final String url;
  const PingServerConfig(this.url);

  @override
  List<Object> get props => [url];
}
