import 'package:get_it/get_it.dart';

import 'common/helpers/access_utils.dart';
import 'core/network/dio_client.dart';
import 'core/routes/router.dart';
import 'core/warning/warning_client.dart';
import 'data/auth/repositories/auth.dart';
import 'data/auth/sources/auth_api_service.dart';
import 'data/common/repositories/common.dart';
import 'data/common/sources/common_service.dart';
import 'data/database/models/app_database.dart';
import 'data/database/repositories/database.dart';
import 'data/database/sources/app_database_service.dart';
import 'data/server_config/repositories/server_config.dart';
import 'data/server_config/sources/server_config_api_service.dart';
import 'data/settings/repositories/setting.dart';
import 'data/settings/sources/setting_services.dart';
import 'data/support/repositories/support.dart';
import 'data/support/sources/support_api_service.dart';
import 'domain/auth/repositories/auth.dart';
import 'domain/common/repositories/common.dart';
import 'domain/database/repositories/app_database.dart';
import 'domain/server/repositories/server_config.dart';
import 'domain/settings/repositories/settings.dart';
import 'domain/support/repositories/support.dart';
import 'presentation/auth/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthenticationBloc>(AuthenticationBloc());
  sl.registerSingleton<DioClient>(DioClient());

  //common
  sl.registerSingleton<WarningClient>(WarningClient());
  sl.registerSingleton<CommonRepository>(CommonRepositoryImpl());
  sl.registerSingleton<CommonService>(CommonServiceImpl());
  //server config
  sl.registerSingleton<ServerConfigService>(ServerConfigServiceImpl());
  sl.registerSingleton<ServerConfigRepository>(ServerConfigRepositoryImpl());
  //auth
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  //database
  sl.registerSingleton<AppDatabase>(AppDatabase());
  sl.registerSingleton<AppDatabaseService>(AppDatabaseServiceImpl());
  sl.registerSingleton<AppDatabaseRepository>(DatabaseRepositoryImpl());

  // support
  sl.registerSingleton<SupportApiService>(SupportApiServiceImpl());
  sl.registerSingleton<SupportRepository>(SupportRepositoryImpl());

  // Access Utils
  sl.registerSingleton<AccessUtils>(AccessUtils());

  // App Router
  sl.registerSingleton<AppRouter>(AppRouter(sl()));

  // settings
  sl.registerSingleton<SettingsService>(SettingsServiceImpl());
  sl.registerSingleton<SettingsRepository>(SettingsRepositoryImpl());
}

void reInitDioClient() {
  // Remove the old instance if it exists
  if (sl.isRegistered<DioClient>()) {
    sl.unregister<DioClient>();
  }
  // Register a new instance (with updated base URL)
  sl.registerSingleton<DioClient>(DioClient());
}
