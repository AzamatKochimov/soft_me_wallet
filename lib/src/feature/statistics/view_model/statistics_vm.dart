import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repository/app_repository_implementation.dart';

AutoDisposeChangeNotifierProvider<StatisticsVm> statisticsVM =
    ChangeNotifierProvider.autoDispose<StatisticsVm>((ref) => StatisticsVm());


final selectedPageProvider = StateProvider<String>((ref) => 'Expenses');

class StatisticsVm with ChangeNotifier {
  // Statistics data
  double _totalIncome = 0.0;
  double _totalExpenses = 0.0;
  int _transactionCount = 0;

  // Notification status
  bool _isNotificationOn = true;

  // Getters for statistics data
  double get totalIncome => _totalIncome;
  double get totalExpenses => _totalExpenses;
  int get transactionCount => _transactionCount;

  // Getter for notification status
  bool get isNotificationOn => _isNotificationOn;

  // Method to change notification status
  void changeNotification(bool isOn) {
    _isNotificationOn = isOn;
    notifyListeners();
  }

  // Method to update total income
  void updateTotalIncome(double amount) {
    _totalIncome += amount;
    notifyListeners();
  }

  // Method to update total expenses
  void updateTotalExpenses(double amount) {
    _totalExpenses += amount;
    notifyListeners();
  }

  // Method to add a transaction and update count
  void addTransaction(double income, double expenses) {
    _totalIncome += income;
    _totalExpenses += expenses;
    _transactionCount++;
    notifyListeners();
  }

  // Example method to toggle notification settings
  void toggleNotification() {
    _isNotificationOn = !_isNotificationOn;
    notifyListeners();
  }

}

class StateVM extends StateNotifier<int> {
  StateVM() : super(0) {
    categoryNameController = TextEditingController();
  }

  late TextEditingController categoryNameController;

  void changeTab(int index) {
    state = index;
  }
}
