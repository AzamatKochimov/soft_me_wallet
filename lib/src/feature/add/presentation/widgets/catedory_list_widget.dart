import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallet/src/feature/add/view_model/add_vm.dart';

class CategoryListWidget extends ConsumerStatefulWidget {
  CategoryListWidget({super.key, required this.whichPage, required this.addVM});

  AddVM addVM;

  final int whichPage;

  @override
  _CategoryListWidgetState createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends ConsumerState<CategoryListWidget> {
  @override
  void initState() {
    super.initState();
    // Initialization and data fetching
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(addVMProvider.notifier).getAllCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final addVM = ref.watch(addVMProvider);
    final dataList = widget.whichPage == 2 ? addVM.expensesList : addVM.incomeList;

    return addVM.categoryData == null
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
      shrinkWrap: true,
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        final category = addVM.categoryData!.categories[index];
        return ListTile(
          title: Text(dataList[index]
              .name
              .substring(0, dataList[index].name.length - 1)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Delete Confirmation'),
                        content: const Text(
                            'Are you sure you want to delete this category?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              ref.read(addVMProvider.notifier).deleteCategoryByID(category.id);
                            },
                            child: const Text('Delete'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.delete),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Update Category"),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 20.h, horizontal: 20.w),
                        content: TextField(
                          controller: addVM.categoryNameController,
                          decoration: const InputDecoration(
                              hintText: "Enter new name for category"),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              ref.read(addVMProvider.notifier).updateCategoryByID(
                                categoryID: category.id,
                                categoryName: addVM.categoryNameController.text,
                                categoryType: widget.whichPage,
                              );
                            },
                            child: const Text('Confirm'),
                          ),
                        ],
                        actionsAlignment: MainAxisAlignment.center,
                      );
                    },
                  );
                },
                icon: const Icon(Icons.mode_edit_outlined),
              ),
            ],
          ),
        );
      },
    );
  }
}
