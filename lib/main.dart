import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:url_strategy/url_strategy.dart';

import 'common/models/app_info_model.dart';
import 'core/configs/behavior/custom_behavior.dart';
import 'core/configs/listview/listview_config.dart';
import 'core/configs/themes/app_colors.dart';
import 'core/configs/themes/app_theme.dart';
import 'core/constants/constants.dart';
import 'core/routes/router.dart';
import 'presentation/bloc.dart';
import 'service_locator.dart';

void main() async {
  if (kIsWeb) {
    try {
      setPathUrlStrategy();
    } catch (_) {}
  }
  WidgetsFlutterBinding.ensureInitialized();
  await AppInfoModel.loadAppInfo();
  await ApiUrl.initializeBaseURL();
  await initializeDependencies();
  ListViewConfigProvider.initializeConfigsWithScreenSizeFromSize();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // Run app
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((value) {
    runApp(
      MultiSplitViewTheme(
        data: MultiSplitViewThemeData(
          dividerThickness: AppConfigs.dividerThickness,
          dividerPainter: DividerPainters.grooved1(
            backgroundColor: AppColors.backgroundGroovedDivider,
            color: AppColors.white,
            highlightedColor: AppColors.highlightGroovedDivider,
          ),
        ),
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = sl<AppRouter>();
    if (kIsWeb) {
      BrowserContextMenu.disableContextMenu();
    }
    super.initState();
  }

  @override
  void dispose() {
    if (kIsWeb) {
      BrowserContextMenu.enableContextMenu();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _appRouter,
      builder: (context, child) {
        final goRouter = _appRouter.router;
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthenticationBloc>(
              create: (BuildContext context) => sl.get<AuthenticationBloc>(),
            ),
            BlocProvider(create: (context) => SettingHomeBloc(), lazy: true),
            BlocProvider(create: (context) => SupportBloc(), lazy: true),
          ],
          child: MaterialApp.router(
            title: 'Label Management System',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            scrollBehavior: CustomScrollBehavior(),
            routeInformationParser: goRouter.routeInformationParser,
            routerDelegate: goRouter.routerDelegate,
            routeInformationProvider: goRouter.routeInformationProvider,
          ),
        );
      },
    );
  }
}
