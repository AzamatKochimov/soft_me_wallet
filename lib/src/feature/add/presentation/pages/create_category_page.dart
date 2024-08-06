// create_category_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallet/src/feature/add/presentation/widgets/create_new_category_widget.dart';
import 'package:wallet/src/feature/add/view_model/add_vm.dart';

class CreateCategoryPage extends StatelessWidget {
  final AddVM addVM;
  final VoidCallback onTap;
  final int whichPage;

  const CreateCategoryPage({
    required this.addVM,
    required this.onTap,
    super.key, required this.whichPage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: CreateNewCategoryWidget(
            addVM: addVM,
            onTap: onTap,
            whichPage: whichPage,
          ),
        ),
      ),
    );
  }
}
