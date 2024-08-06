import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/home_vm.dart';
import 'home_widgets.dart';
class HomeAppBarBottomWidget extends ConsumerWidget {
  const HomeAppBarBottomWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeVM = ref.watch(homeVMProvider);

    return Container(
      color: Colors.amberAccent, // Match the AppBar color
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: const DatePickerButton(),
            ),
            // 2nd Column: Expenses
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Expenses'),
                Text(
                  homeVM.expenseSum.abs().toStringAsFixed(2).replaceAll(RegExp(r'\.00$'), ''),
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp),
                )
              ],
            ),
            // 3rd Column: Income
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Income'),
                Text(
                  homeVM.incomeSum.abs().toStringAsFixed(2).replaceAll(RegExp(r'\.00$'), ''),
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp),
                )
              ],
            ),
            // 4th Column: Balance
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Balance'),
                  Text(
                    homeVM.balance.toStringAsFixed(2).replaceAll(RegExp(r'\.00$'), ''), // Replace with actual balance if needed
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}