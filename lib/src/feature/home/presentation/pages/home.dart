import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/home_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text("Money Tracker"),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.calendar_month_outlined),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0), // Adjust height as needed
          child: Container(
            color: Colors.amberAccent, // Match the AppBar color
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.w
                    ),
                    child: const DatePickerButton(),
                  ),
                  // 2nd Column: Expenses
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Expenses'),
                      Text(
                        '2002',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp),
                      ),
                    ],
                  ),
                  // 3rd Column: Income
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Income'),
                      Text(
                        '4000',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp),
                      ),
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
                          '1998',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}
