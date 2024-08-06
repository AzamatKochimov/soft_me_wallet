import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/add_vm.dart';
import 'catedory_list_widget.dart';


class CreateNewCategoryWidget extends StatelessWidget {
  const CreateNewCategoryWidget({required this.addVM, required this.onTap, super.key});
  final AddVM addVM;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      width: double.infinity,
      child: Column(
        children: [
          const Text("Categories"),
          const Divider(),
          const CategoryListWidget(),
          const SizedBox(height: 20),
          const Text("Add New Category"),
          const Divider(),
          TextField(
            controller: addVM.categoryNameController,
            decoration: const InputDecoration(hintText: "Enter category name"),
          ),
          const Spacer(),
          MaterialButton(
            minWidth: double.infinity,
            height: 50.h,
            color: Colors.amberAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r)),
            onPressed: onTap,
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}
