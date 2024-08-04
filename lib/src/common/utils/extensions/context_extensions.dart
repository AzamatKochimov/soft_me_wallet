import "package:flutter/material.dart";
import "package:soft_me_wallet/generated/l10n.dart";

extension CustomContextExtension on BuildContext {
  S get localized => S.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => mediaQuery.size;

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}
