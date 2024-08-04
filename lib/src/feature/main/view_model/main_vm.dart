import "package:flutter/cupertino.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "../../../common/routes/app_route_name.dart";


AutoDisposeChangeNotifierProvider<MainVM> mainVM = ChangeNotifierProvider.autoDispose<MainVM>((ChangeNotifierProviderRef<MainVM> ref) => MainVM());

class MainVM with ChangeNotifier {
  int currentIndex = 0;

  void changeIndex(int index, BuildContext context) {
    currentIndex = index;
    if (index == 0) {
      context.go(AppRouteName.recordsPage);
    } else if (index == 1) {
      context.go(AppRouteName.statisticsPage);
    } else if (index == 2) {
      // context.go(AppRouteName.addPage);
    } else if (index == 3) {
      context.go(AppRouteName.reportsPage);
    } else if (index == 4){
      context.go(AppRouteName.profilePage);
    }else{
      context.go(AppRouteName.recordsPage);
    }
  }
}
