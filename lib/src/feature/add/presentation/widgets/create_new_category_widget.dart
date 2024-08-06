import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallet/src/feature/add/view_model/add_vm.dart';

import 'catedory_list_widget.dart';

class CreateNewCategoryWidget extends StatefulWidget {
  const CreateNewCategoryWidget(
      {required this.addVM, required this.onTap, super.key, required this.whichPage});

  final AddVM addVM;
  final VoidCallback onTap;
  final int whichPage;

  @override
  State<CreateNewCategoryWidget> createState() => _CreateNewCategoryWidgetState();
}

class _CreateNewCategoryWidgetState extends State<CreateNewCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Categories"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        width: double.infinity,
        child: Column(
          children: [
            const Divider(),
            Expanded(
              flex: 10,
              child: CategoryListWidget(whichPage: widget.whichPage, addVM: widget.addVM,),
            ),
            // const SizedBox(height: 20),
            const Divider(
              height: 0,
              thickness: 1,
            ),
            SizedBox(
              height: 10.h,
            ),
            const Text("Add New Category"),
            const Divider(),
            TextField(
              controller: widget.addVM.categoryNameController,
              decoration: const InputDecoration(hintText: "Enter category name"),
            ),
            const Spacer(),
            MaterialButton(
              minWidth: double.infinity,
              height: 50.h,
              color: Colors.amberAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r)),
              onPressed: widget.onTap,
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
