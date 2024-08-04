import "package:flutter/cupertino.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

AutoDisposeChangeNotifierProvider<HomeVM> homeVM = ChangeNotifierProvider.autoDispose<HomeVM>((ChangeNotifierProviderRef<HomeVM> ref) => HomeVM());

class HomeVM with ChangeNotifier {
  bool? userBreakfast;
  bool? userLunch;
  bool? userDinner;

  void getBreakfast(){
    userBreakfast = true;
    notifyListeners();
  }

  void nullBreakfast(){
    userBreakfast = null;
    notifyListeners();
  }

  void nullLunch(){
    userLunch = null;
    notifyListeners();
  }

  void nullDinner(){
    userDinner = null;
    notifyListeners();
  }

  void getLunch(){
    userLunch = true;
    notifyListeners();
  }

  void getDinner(){
    userDinner = true;
    notifyListeners();
  }

  void declineBreakfast(){
    userBreakfast = false;
    notifyListeners();
  }

  void declineLunch(){
    userLunch = false;
    notifyListeners();
  }

  void declineDinner(){
    userDinner = false;
    notifyListeners();
  }
}
