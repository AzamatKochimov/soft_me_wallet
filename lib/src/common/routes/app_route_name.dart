import "package:flutter/foundation.dart";

import "app_router.dart";

@immutable
final class AppRouteName {
  const AppRouteName._();

  // blocked
  static const String blockedPage = "/blocked_page";

  // home
  static const String recordsPage = "/";
  static const String profilePage = "/profile";
  static const String notSignedProfilePage = "/not_signed_profile";
  static const String loginPage = "/login";
  static const String registerPage = "/register_page";

  // statistics
  static const String statisticsPage = "/statistics_page";

  // reports
  static const String reportsPage = "/reports_page";

  static const String addDataPage = "/addData_page";

}