import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l/l.dart';
import 'package:wallet/src/data/entity/category_model.dart';
import 'package:wallet/src/data/repository/app_repository_implementation.dart';

class AddVM extends ChangeNotifier {
  AddVM(this._repository) : super() {
    categoryNameController = TextEditingController();
    amountController = TextEditingController();
  }

  final AppRepositoryImpl _repository;
  late TextEditingController categoryNameController;
  late TextEditingController amountController;
  CategoryData? categoryData;
  List<CategoryModel> expensesList = <CategoryModel>[];
  List<CategoryModel> incomeList = <CategoryModel>[];
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
      categoryData = await _repository.getAllCategories();
      l.i("CategoryModel Data: ${categoryData?.categories}"); // Log categoryModel
      _error = null;
    } catch (e) {
      _error = "Error fetching categories: $e";
    } finally {
      _setLoading(false);
    }
  }


  Future<void> updateCategoryByID({required int categoryID, required String categoryName,required int categoryType }) async {
    _setLoading(true);
    try {
      await _repository.editCategory(categoryId: categoryID, name: categoryName, categoryType: categoryType);
      // Refresh the category list after deletion
      await getAllCategories();
      _error = null;
    } catch (e) {
      _error = "Error updating category: $e";
    } finally {
      _setLoading(false);
    }
    notifyListeners();
  }

  Future<void> deleteCategoryByID(int categoryId) async {
    _setLoading(true);
    try {
      await _repository.deleteCategory(categoryId);
      // Refresh the category list after deletion
      await getAllCategories();
      _error = null;
    } catch (e) {
      _error = "Error deleting category: $e";
    } finally {
      _setLoading(false);
    }
    notifyListeners();
  }


  Future<void> separateCategories() async {
    if (categoryData != null) {
      expensesList = categoryData!.categories.where((data) {
        if (data.name.isNotEmpty) {
          return data.name.trim().endsWith('2');
        }
        return false;
      }).toList();
      incomeList = categoryData!.categories.where((data) {
        if (data.name.isNotEmpty) {
          return data.name.trim().endsWith('1');
        }
        return false;
      }).toList();
    }
    notifyListeners();
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
