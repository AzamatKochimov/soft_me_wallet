import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/add_vm.dart';

class CategoryListWidget extends ConsumerStatefulWidget {
  const CategoryListWidget({super.key});

  @override
  _CategoryListWidgetState createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends ConsumerState<CategoryListWidget> {
  @override
  void initState() {
    super.initState();
    // Fetch categories when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(addVMProvider.notifier).getAllCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final addVM = ref.watch(addVMProvider);

    return addVM.categoryModel == null
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
      shrinkWrap: true,
      itemCount: addVM.categoryModel?.categories.length ?? 0,
      itemBuilder: (context, index) {
        final category = addVM.categoryModel!.categories[index];
        return ListTile(
          title: Text(category.name),
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
                        content: const Text('Are you sure you want to delete this category?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              addVM.getAllCategories();
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Perform the delete operation here
                              // For example: await yourDeleteFunction();

                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Item deleted successfully!')),
                              );
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
                onPressed: (){},
                icon: const Icon(Icons.mode_edit_outlined),
              ),
            ],
          ),
          onTap: () {
            // Handle category selection if needed
          },
        );
      },
    );
  }
}
