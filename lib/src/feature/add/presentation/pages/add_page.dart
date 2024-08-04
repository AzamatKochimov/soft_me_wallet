import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:soft_me_wallet/src/common/routes/app_route_name.dart';
import 'package:soft_me_wallet/src/feature/add/presentation/widgets/add_widgets.dart';
import 'package:soft_me_wallet/src/feature/home/presentation/pages/home.dart';

class AddPage extends ConsumerWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              onTabTapped: (a) {},
              selectedIndex: 0,
            ),
          ),
          // Container(
          //   height: 40.h,
          //   width: double.infinity,
          //   margin: EdgeInsets.only(left: 30.w, bottom: 20.h, right: 30.w),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(8),
          //     border: Border.all(),
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Container(
          //         child: const Text("Expences"),
          //       ),
          //       VerticalDivider(
          //         color: Colors.black,
          //       ),
          //       Container(
          //         child: const Text("Income"),
          //       ),
          //       VerticalDivider(),
          //       Container(
          //         width: MediaQuery.sizeOf(context).width*0.3,
          //         color: Colors.black,
          //         child: const Text("Transfer", style: TextStyle(color: Colors.amberAccent),),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
