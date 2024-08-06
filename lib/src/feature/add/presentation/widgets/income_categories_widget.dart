import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:l/l.dart';
import 'package:wallet/src/feature/add/presentation/pages/create_category_page.dart';
import 'package:wallet/src/feature/add/presentation/widgets/create_expense_widget.dart';
import 'package:wallet/src/feature/add/presentation/widgets/create_new_category_widget.dart';
import 'package:wallet/src/feature/add/presentation/widgets/random_color_for_category_widget.dart';
import 'package:wallet/src/feature/add/view_model/add_vm.dart';

import '../../../../common/local/app_storage.dart';
import '../../../../data/entity/category_model.dart';

class IncomeCategoriesWidget extends ConsumerStatefulWidget {
  const IncomeCategoriesWidget(
      {super.key, required this.addVM, required this.onTap});

  final AddVM addVM;
  final VoidCallback onTap;

  @override
  _IncomeCategoriesWidgetState createState() => _IncomeCategoriesWidgetState();
}

class _IncomeCategoriesWidgetState
    extends ConsumerState<IncomeCategoriesWidget> {
  @override
  void initState() {
    super.initState();
    widget.addVM.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categories = widget.addVM.categoryData?.categories ?? [];

    // Filter out categories whose last character is '1' or '2'
    final filteredCategories = categories.where((data) {
      if (data.name.isNotEmpty) {
        String lastChar = data.name.substring(data.name.length - 1);
        return lastChar != '2' && lastChar == '1';
      }
      return true;
    }).toList();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      child: GridView.builder(
        itemCount: filteredCategories.length + 1,
        // Adding 1 for the "Settings" column
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          if (index < filteredCategories.length) {
            final CategoryModel? data = filteredCategories[index];
            l.i("Category Name Expenses: ${data?.name}");

            if (data != null && data.name.isNotEmpty) {
              String lastChar = data.name.substring(data.name.length - 1);

              if (lastChar == '1') {
                return Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        l.i("Token: ${AppStorage.$read(key: StorageKey.token)}");
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return CreateExpenseWidget(
                              addVM: widget.addVM,
                              onTap: widget.onTap,
                              categoryId: data.id,
                              categoryName: data.name,
                            );
                          },
                        );
                      },
                      icon: const CircleAvatar(
                        child: RandomColorForCategoryWidget(),
                      ),
                    ),
                    Text(data.name.substring(0, data.name.length - 2)),
                  ],
                );
              }
              return Column(
                children: [
                  IconButton(
                    onPressed: () {
                      l.i("Token: ${AppStorage.$read(key: StorageKey.token)}");
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return CreateExpenseWidget(
                            addVM: widget.addVM,
                            onTap: widget.onTap,
                            categoryId: data.id,
                            categoryName: data.name,
                          );
                        },
                      );
                    },
                    icon: const CircleAvatar(
                      backgroundColor: Color(0xffC3C3C3),
                    ),
                  ),
                  Text(data.name.substring(0, data.name.length - 2)),
                ],
              );
            }
          } else {
            return Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateCategoryPage(
                          whichPage: 1,
                          addVM: widget.addVM,
                          onTap: widget.onTap,
                        ),
                      ),
                    );
                  },

                  icon: const CircleAvatar(
                    backgroundColor: Color(0xffC3C3C3),
                    child: Icon(
                      Icons.add_rounded,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const Text("Settings"),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
