import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:soft_me_wallet/generated/l10n.dart";
import "../../feature/settings/inherited/inherited_local_notifier.dart";
import "../../feature/settings/inherited/local_controller.dart";
import "../routes/app_router.dart";


final LocalController localController = LocalController();

@immutable
class MaterialContext extends StatelessWidget {

  MaterialContext({super.key}): builderKey = GlobalKey();

  final GlobalKey builderKey;

  @override
  Widget build(BuildContext context) => InheritedLocalNotifier(
    localController: localController,
    child: Builder(
        builder: (BuildContext context) {
          return MaterialApp.router(
            onGenerateTitle: (BuildContext context) => "PDP Invest",
            routerConfig: AppRouter.router,
            restorationScopeId: "material_app",
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: InheritedLocalNotifier.maybeOf(context)?.appLocal ?? const Locale("uz", "UZ"),
            builder: (BuildContext context, Widget? child) => MediaQuery.withNoTextScaling(
              key: builderKey,
              child: child ?? const SizedBox.shrink(),
            ),
          );
        }
    ),
  );
}
