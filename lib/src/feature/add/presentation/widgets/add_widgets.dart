import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPageTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabTapped;

  const AddPageTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: MaterialButton(
              elevation: 0,
              height: 55.h,
              onPressed: () {
                onTabTapped(0);
              },
              color: selectedIndex == 0 ? Colors.black : Colors.amberAccent,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(10.r)),
                borderSide: BorderSide.none,
              ),
              child: Text(
                "Expenses",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: selectedIndex == 0 ? Colors.amberAccent : Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: MaterialButton(
              elevation: 0,
              height: 55.h,
              onPressed: () {
                onTabTapped(1);
              },
              color: selectedIndex == 1 ? Colors.black : Colors.amberAccent,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.horizontal(right: Radius.circular(10.r)),
                borderSide: BorderSide.none,
              ),
              child: Text(
                "Income",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: selectedIndex == 1 ? Colors.amberAccent : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpensesWidget extends StatelessWidget {
  const ExpensesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
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
        ));
  }
}

class IncomeWidget extends StatelessWidget {
  const IncomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
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
        ));
  }
}
