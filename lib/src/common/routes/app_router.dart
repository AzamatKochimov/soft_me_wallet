import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:soft_me_wallet/src/feature/add/presentation/pages/add_page.dart";
import "package:soft_me_wallet/src/feature/auth/presentation/pages/login_page.dart";
import "package:soft_me_wallet/src/feature/profile/presentation/pages/not_signed_porfile_page.dart";
import "package:soft_me_wallet/src/feature/reports/presentation/pages/reports_page.dart";
import "package:soft_me_wallet/src/feature/statistics/presentation/pages/statistics_page.dart";

import "../../feature/home/presentation/pages/home.dart";
import "../../feature/main/presentation/pages/main_page.dart";
import "../../feature/profile/presentation/pages/profile_page.dart";
import "app_route_name.dart";

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "root");
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "shell");

@immutable
class AppRouter {
  factory AppRouter() => _router;

  const AppRouter._internal();

  static const AppRouter _router = AppRouter._internal();

  static final GoRoute invest = GoRoute(
    parentNavigatorKey: rootNavigatorKey,
    path: AppRouteName.addDataPage,
    // pageBuilder: (BuildContext context, GoRouterState state){
    //   return _customEachTransitionAnimation(context, state, const AddInvestPage());
    // },
    builder: (BuildContext context, GoRouterState state) {
      return const AddPage();
    },
    routes: const <RouteBase>[
      // GoRoute(
      //   path: AppRouteName.addPage,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const AddPage();
      //   },
      // ),
      // GoRoute(
      //   path: AppRouteName.cardSMSCodePage,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const CardSMSCodePage();
      //   },
      // ),
      // GoRoute(
      //   path: AppRouteName.confirmPaymentPage,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const ConfirmPaymentPage();
      //   },
      //   routes: <RouteBase>[
      //     GoRoute(
      //       path: AppRouteName.addSuccessPage,
      //       builder: (BuildContext context, GoRouterState state) {
      //         return const AddSuccessPage();
      //       },
      //     ),
      //   ],
      // ),
    ],
  );

  static final GoRouter router = GoRouter(
    initialLocation: AppRouteName.recordsPage,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        name: "LoginPage",
        path: AppRouteName.loginPage,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        name: "AddData Page",
        path: AppRouteName.addDataPage,
        builder: (BuildContext context, GoRouterState state) {
          return const AddPage();
        },
      ),
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return MainPage(
            child: child,
          );
        },
        routes: <RouteBase>[
          GoRoute(
            name: "Records Page",
            path: AppRouteName.recordsPage,
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
          ),
          GoRoute(
            name: "Statistics Page",
            path: AppRouteName.statisticsPage,
            builder: (BuildContext context, GoRouterState state) {
              return const StatisticsPage();
            },
          ),
          GoRoute(
            name: "Reports Page",
            path: AppRouteName.reportsPage,
            builder: (BuildContext context, GoRouterState state) {
              return const ReportsPage();
            },
          ),
          GoRoute(
            name: "ProfilePage",
            path: AppRouteName.profilePage,
            builder: (BuildContext context, GoRouterState state) {
              return const ProfilePage();
            },
          ),
          GoRoute(
            name: "NotSignedProfilePage",
            path: AppRouteName.notSignedProfilePage,
            builder: (BuildContext context, GoRouterState state) {
              return const NotSignedPorfilePage();
            },
          ),
        ],
      ),
    ],
  );
}

@immutable
final class BlockedRouter {
  factory BlockedRouter() => _router;

  const BlockedRouter._internal();

  static const BlockedRouter _router = BlockedRouter._internal();

  static final GoRouter router = GoRouter(
    initialLocation: AppRouteName.blockedPage,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        name: "BlockedPage",
        path: AppRouteName.blockedPage,
        builder: (BuildContext context, GoRouterState state) {
          return const Scaffold(
            body: Center(
              child: Text("App is permanently blocked !!!"),
            ),
          );
        },
      ),
    ],
  );
}
