import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/bloc.dart';
import '../../presentation/presentation.dart';
import '../constants/app_route.dart';

// GlobalKeys declared at module level to prevent recreation on router rebuilds
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

CustomTransitionPage pageBuilder(Widget child) {
  return CustomTransitionPage(
    transitionDuration: const Duration(
      milliseconds: 10,
    ), // No transition duration
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );

      return FadeTransition(opacity: curvedAnimation, child: child);
    },
    child: child,
  );
}

class AppRouter extends ChangeNotifier {
  final AuthenticationBloc authBloc;
  GoRouter? _router;
  AppRouter(this.authBloc);

  GoRouter get router => _router ??= _createRouter();

  void reInit() {
    _router = _createRouter();
    notifyListeners();
  }

  GoRouter _createRouter() {
    return GoRouter(
      //initialLocation: AppRoute.login.path,
      initialLocation: AppRoute.home.path,
      redirect: (context, state) async {
        final isAuthenticated = authBloc.state is Authenticated;
        final isUnAuthenticated = authBloc.state is Unauthenticated;

        // Redirect to the login page if the user is not authenticated, and if authenticated, do not show the login page
        if (state.matchedLocation == AppRoute.serverConfig.path) {
          return AppRoute.serverConfig.path;
        }
        // Redirect to the home page if the user is authenticated
        else if (isAuthenticated &&
            (state.matchedLocation == AppRoute.login.path)) {
          return AppRoute.home.path;
        } else if (isUnAuthenticated &&
            !(state.matchedLocation == AppRoute.login.path)) {
          //return AppRoute.login.path;
          return null;
        }

        return null;
      },
      refreshListenable: StreamToListenable([authBloc.stream]),
      navigatorKey: _rootNavigatorKey,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return IFrameMain(navigationShell: navigationShell);
          },
          branches: <StatefulShellBranch>[
            // Home
            StatefulShellBranch(
              routes: <RouteBase>[
                StatefulShellRoute.indexedStack(
                  builder: (context, state, navigationShell) {
                    return IFrameBase(
                      navigationShell: navigationShell,
                      drawer: PageHome.drawer,
                    );
                  },
                  branches: [
                    StatefulShellBranch(
                      routes: [
                        GoRoute(
                          path: AppRoute.home.path,
                          name: AppRoute.home.name,
                          pageBuilder: (context, state) {
                            return pageBuilder(const PageHome());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // Dashboard
            StatefulShellBranch(
              routes: <RouteBase>[
                StatefulShellRoute.indexedStack(
                  builder: (context, state, navigationShell) {
                    return IFrameBase(
                      navigationShell: navigationShell,
                      drawer: PageDashboard.drawer,
                    );
                  },
                  branches: [
                    StatefulShellBranch(
                      routes: [
                        GoRoute(
                          path: AppRoute.dashboard.path,
                          name: AppRoute.dashboard.name,
                          pageBuilder: (context, state) {
                            return pageBuilder(const PageDashboard());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // Settings
            StatefulShellBranch(
              routes: <RouteBase>[
                StatefulShellRoute.indexedStack(
                  builder: (context, state, navigationShell) {
                    return IFrameBase(
                      navigationShell: navigationShell,
                      drawer: SettingHomePage.drawer,
                    );
                  },
                  branches: [
                    StatefulShellBranch(
                      routes: [
                        GoRoute(
                          path: AppRoute.setting.path,
                          name: AppRoute.setting.name,
                          pageBuilder: (context, state) {
                            return pageBuilder(
                              SettingHomePage(
                                plantName:
                                    state.uri.queryParameters['plant'] ?? '',
                                showHeader: true,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            ///  Supports
            StatefulShellBranch(
              routes: <RouteBase>[
                StatefulShellRoute.indexedStack(
                  builder: (context, state, navigationShell) {
                    return IFrameBase(
                      navigationShell: navigationShell,
                      drawer: SupportHomePage.drawer,
                    );
                  },
                  branches: [
                    StatefulShellBranch(
                      routes: [
                        GoRoute(
                          path: AppRoute.support.path,
                          name: AppRoute.support.name,
                          pageBuilder: (context, state) {
                            return pageBuilder(const SupportHomePage());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: AppRoute.login.path,
          name: AppRoute.login.name,
          pageBuilder: (context, state) => pageBuilder(const PageLogin()),
        ),
        GoRoute(
          path: AppRoute.serverConfig.path,
          name: AppRoute.serverConfig.name,
          pageBuilder: (context, state) =>
              pageBuilder(const PageServerConfig()),
        ),
      ],
      errorBuilder: (context, state) => const NotFoundPage(),
    );
  }
}

class StreamToListenable extends ChangeNotifier {
  late final List<StreamSubscription> subscriptions;

  StreamToListenable(List<Stream> streams) {
    subscriptions = [];
    for (var e in streams) {
      var s = e.asBroadcastStream().listen(_tt);
      subscriptions.add(s);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    for (var e in subscriptions) {
      e.cancel();
    }
    super.dispose();
  }

  void _tt(dynamic event) => notifyListeners();
}
