// create_category_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/add_vm.dart';
import '../widgets/create_new_category_widget.dart';

class CreateCategoryPage extends StatelessWidget {
  final AddVM addVM;
  final VoidCallback onTap;

  const CreateCategoryPage({
    required this.addVM,
    required this.onTap,
    super.key,
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
          ),
        ),
      ),
    );
  }
}
