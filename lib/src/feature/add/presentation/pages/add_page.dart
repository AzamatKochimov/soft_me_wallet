import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/routes/app_route_name.dart';
import '../../view_model/add_vm.dart';
import '../widgets/add_page_tab_bar.dart';
import '../widgets/expenses_categories_widget.dart';
import '../widgets/income_categories_widget.dart';

class AddPage extends ConsumerWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addVM = ref.watch(addVMProvider);

    if (addVM.isLoading) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  context.go(AppRouteName.recordsPage);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(width: 68.w),
              const Text(
                "Add",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.checklist),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Container(
              height: 40.h,
              width: double.infinity,
              margin: EdgeInsets.only(left: 30.w, bottom: 20.h, right: 30.w),
              child: AddPageTabBar(
                onTabTapped: (index) {
                  addVM.changeTab(index);
                },
                selectedIndex: addVM.currentIndex,
              ),
            ),
          ),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (addVM.error != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  context.go(AppRouteName.recordsPage);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(width: 68.w),
              const Text(
                "Add",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.checklist),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Container(
              height: 40.h,
              width: double.infinity,
              margin: EdgeInsets.only(left: 30.w, bottom: 20.h, right: 30.w),
              child: AddPageTabBar(
                onTabTapped: (index) {
                  addVM.changeTab(index);
                },
                selectedIndex: addVM.currentIndex,
              ),
            ),
          ),
        ),
        body: Center(
          child: Text(
            addVM.error!,
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                context.go(AppRouteName.recordsPage);
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(width: 68.w),
            const Text(
              "Add",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.checklist),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Container(
            height: 40.h,
            width: double.infinity,
            margin: EdgeInsets.only(left: 30.w, bottom: 20.h, right: 30.w),
            child: AddPageTabBar(
              onTabTapped: (index) {
                addVM.changeTab(index);
              },
              selectedIndex: addVM.currentIndex,
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: addVM.currentIndex,
        children: [
          ExpensesWidget(
            addVM: addVM,
            onTap: () async {
              await addVM.createCategory(categoryType: 2);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Category added successfully!')));
              await addVM.getAllCategories();
            },
          ),
          IncomeCategoriesWidget(
            addVM: addVM,
            onTap: () async {
              await addVM.createCategory(categoryType: 1);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Category added successfully!')));
              await addVM.getAllCategories();
            },
          ),
        ],
      ),
    );
  }
}
