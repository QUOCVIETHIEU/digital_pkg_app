import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../common/helpers/preferences.dart';
import '../../../core/constants/api_url.dart';
import '../../../domain/server/repositories/server_config.dart';
import '../../../service_locator.dart';

part 'server_config_event.dart';
part 'server_config_state.dart';

class ServerConfigBloc extends Bloc<ServerConfigEvent, ServerConfigState> {
  ServerConfigBloc() : super(ServerConfigInitial()) {
    on<LoadServerConfig>(_onLoadServerConfig);
    on<SaveServerConfig>(_onSaveServerConfig);
    on<ResetServerConfig>(_onResetServerConfig);
    on<PingServerConfig>(_onPingServerConfig);
  }

  Future<void> _onLoadServerConfig(
    LoadServerConfig event,
    Emitter<ServerConfigState> emit,
  ) async {
    emit(ServerConfigLoading());
    try {
      final url = await UserPreferences.getBaseURL();
      emit(ServerConfigLoaded(url: url, canSave: false));
    } catch (e) {
      emit(const ServerConfigError('Failed to load server config'));
    }
  }

  Future<void> _onSaveServerConfig(
    SaveServerConfig event,
    Emitter<ServerConfigState> emit,
  ) async {
    emit(ServerConfigSaving());
    try {
      await UserPreferences.setBaseURL(event.url);
      await ApiUrl.initializeBaseURL();
      reInitDioClient();
      emit(ServerConfigSaved());
      emit(ServerConfigLoaded(url: event.url, canSave: true));
    } catch (e) {
      emit(const ServerConfigError('Failed to save server config'));
    }
  }

  void _onResetServerConfig(
    ResetServerConfig event,
    Emitter<ServerConfigState> emit,
  ) {
    emit(const ServerConfigLoaded(url: '', canSave: false));
  }

  Future<void> _onPingServerConfig(
    PingServerConfig event,
    Emitter<ServerConfigState> emit,
  ) async {
    emit(ServerConfigLoading());
    final repository = sl<ServerConfigRepository>();
    try {
      final canPing = await repository.pingServer(event.url);
      if (canPing) {
        emit(ServerConfigPingSuccess(event.url));
      } else {
        emit(const ServerConfigPingFailure('Cannot connect to server.'));
      }
    } catch (e) {
      emit(const ServerConfigPingFailure('Cannot connect to server.'));
    }
  }
}
