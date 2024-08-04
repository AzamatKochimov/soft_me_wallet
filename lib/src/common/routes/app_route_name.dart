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

  // statistics
  static const String statisticsPage = "/statisticsPage";

  // reports
  static const String reportsPage = "/reportsPage";

  static const String addDataPage = "/addDataPage";

}