import "package:flutter/cupertino.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

AutoDisposeChangeNotifierProvider<ProfileVM> profileVM = ChangeNotifierProvider.autoDispose<ProfileVM>((ChangeNotifierProviderRef<ProfileVM> ref) => ProfileVM());

class ProfileVM with ChangeNotifier {
  bool isNotificationOn = true;

  void changeNotification(bool v){
    isNotificationOn = v;
    notifyListeners();
  }
}