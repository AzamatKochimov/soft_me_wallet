import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportsPage extends ConsumerWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Center(
          child:Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: const Text(
              "Soon, you will be able to download your transactions to excel file",
              textAlign: TextAlign.center,
            ),
          ),
        ),
    );
  }
}
