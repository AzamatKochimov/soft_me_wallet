import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l/l.dart';

import '../../../data/entity/category_model.dart';
import '../../../data/repository/app_repository_implementation.dart';

class AddVM extends ChangeNotifier {
  AddVM(this._repository) : super() {
    categoryNameController = TextEditingController();
    amountController = TextEditingController();
  }

  final AppRepositoryImpl _repository;
  late TextEditingController categoryNameController;
  late TextEditingController amountController;
  CategoryData? categoryModel;
  int _currentIndex = 0;
  bool _isLoading = false;
  String? _error;

  int get currentIndex => _currentIndex;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void changeTab(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Future<void> createCategory({required int categoryType}) async {
    _setLoading(true);
    try {
      final categoryName = categoryNameController.text;
      if (categoryName.isNotEmpty) {
        await _repository.createCategory(
            name: categoryName, categoryType: categoryType);
        categoryNameController.clear();
        _error = null;
      }
    } catch (e) {
      _error = "Error creating category: $e";
    } finally {
      _setLoading(false);
    }
  }

  Future<void> getAllCategories() async {
    _setLoading(true);
    try {
      categoryModel = await _repository.getAllCategories();
      l.i("CategoryModel Data: ${categoryModel?.categories}"); // Log categoryModel
      _error = null;
    } catch (e) {
      _error = "Error fetching categories: $e";
    } finally {
      _setLoading(false);
    }
  }

  Future<void> addExpense({
    required String date,
    required double amount,
    required int categoryId,
    required int type,
  }) async {
    if (amount > 0 && categoryId != 0) {
      _setLoading(true);
      try {
        await _repository.createExpense(
          date: date,
          amount: amount,
          type: type,
          categoryId: categoryId,
        );
        amountController.clear();
        _error = null;
      } catch (e) {
        _error = "Error adding expense: $e";
      } finally {
        _setLoading(false);
      }
      notifyListeners();
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}

final addVMProvider = ChangeNotifierProvider<AddVM>((ref) {
  final repository = AppRepositoryImpl(); // Or use dependency injection
  return AddVM(repository);
});
