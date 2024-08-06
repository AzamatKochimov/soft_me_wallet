import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l/l.dart';
import 'package:wallet/setup.dart';
import '../../../common/local/app_storage.dart';
import '../../../common/server/api/api.dart';
import '../../../common/server/api/api_constants.dart';
import '../../../data/entity/category_model.dart';
import '../../../data/entity/expense_model.dart';

final homeVMProvider = ChangeNotifierProvider.autoDispose<HomeVM>((ref) => HomeVM(ref));

class HomeVM extends ChangeNotifier {
  final AutoDisposeChangeNotifierProviderRef<HomeVM> ref;
  List<Transaction> _transactions = [];
  List<CategoryModel> _categories = [];
  double _incomeSum = 0.0;
  double _expenseSum = 0.0;
  bool _isLoading = false;
  String? _error;
  bool _isLoggedIn = false;

  HomeVM(this.ref) {
    _checkLoginStatus();
  }

  List<Transaction> get transactions => _transactions;
  double get incomeSum => _incomeSum;
  double get expenseSum => _expenseSum;
  double get balance => _incomeSum - _expenseSum;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> _checkLoginStatus() async {
    final token = await AppStorage.$read(key: StorageKey.token);
    _isLoggedIn = token != null;
    notifyListeners();
    if (_isLoggedIn) {
      await _fetchExpenses();
      await _fetchCategories();
    }
  }

  Future<void> _fetchExpenses() async {
    if (!_isLoggedIn) return;

    _setLoading(true);
    try {
      final expenseModel = await getAllExpenses();
      if (expenseModel != null) {
        _transactions = expenseModel.transactions;
        _calculateIncomeSum();
        _calculateExpenseSum();
        _error = null;
      } else {
        _error = "Failed to fetch expenses";
      }
    } catch (e) {
      _error = "Error fetching expenses: $e";
    } finally {
      _setLoading(false);
    }
    notifyListeners();
  }

  Future<void> _fetchCategories() async {
    if (!_isLoggedIn) return;

    _setLoading(true);
    try {
      final categoryModel = await _getAllCategories();
      if (categoryModel != null) {
        _categories = categoryModel.categories;
        _error = null;
      } else {
        _error = "Failed to fetch categories";
        // _isLoggedIn = false;
      }
    } catch (e) {
      _error = "Error fetching categories: $e";
    } finally {
      _setLoading(false);
    }
    notifyListeners();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _calculateIncomeSum() {
    _incomeSum = _transactions
        .where((transaction) => transaction.type == "1")
        .map((transaction) => double.tryParse(transaction.amount) ?? 0.0)
        .reduce((a, b) => a + b);
  }

  void _calculateExpenseSum() {
    _expenseSum = _transactions.where((transaction) => transaction.type == "2").map((transaction) {
      final amount = double.tryParse(transaction.amount) ?? 0.0;
      return -amount;
    }).reduce((a, b) => a + b);
  }

  Future<ExpenseModel?> getAllExpenses() async {
    try {
      final String? response = await ApiService.get(ApiConst.getAllExpenses);
      if (response != null) {
        final ExpenseModel expenseModel = ExpenseModel.fromRawJson(response);
        l.i("GetAllExpenses Response: ${expenseModel.status}");
        l.i("GetAllExpenses Transactions: ${expenseModel.transactions}");
        return expenseModel;
      } else {
        _isLoggedIn = false;
        return null;
      }
    } catch (e) {
      l.e("Error fetching expenses: $e");
      _isLoggedIn = false;
      return null;
    }
  }

  Future<CategoryData?> _getAllCategories() async {
    try {
      final String? response = await ApiService.get(ApiConst.getAllCategories);
      if (response != null) {
        final CategoryData categoryModel = categoryModelFromJson(response);
        l.i("GetAllCategories Response: ${categoryModel.status}");
        l.i("GetAllCategories Categories: ${categoryModel.categories}");
        return categoryModel;
      } else {
        l.e("Failed to fetch categories");
        return null;
      }
    } catch (e) {
      l.e("Error fetching categories: $e");
      return null;
    }
  }

  String categoryNameById(String id) {
    final category = _categories.firstWhere(
          (cat) => cat.id.toString() == id,
      orElse: () => CategoryModel(id: 0, name: 'Unknown'),
    );
    return category.name.substring(0, category.name.length - 2);
  }
}
