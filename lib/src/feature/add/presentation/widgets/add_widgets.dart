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
              color: selectedIndex == 0 ? Colors.amberAccent : Colors.black,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(10.r)),
                borderSide: BorderSide.none,
              ),
              child: Text(
                "Expences",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: selectedIndex == 0 ? Colors.black : Colors.amberAccent,
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
              color: selectedIndex == 1 ? Colors.amberAccent : Colors.black,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.horizontal(right: Radius.circular(10.r)),
                borderSide: BorderSide.none,
              ),
              child: Text(
                "Income",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: selectedIndex == 1 ? Colors.black : Colors.amberAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
