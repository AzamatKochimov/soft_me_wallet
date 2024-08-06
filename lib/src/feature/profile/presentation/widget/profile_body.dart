import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 300.h,
            margin: EdgeInsets.symmetric(horizontal: 30.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0.2,
                        blurRadius: 5,
                        offset: const Offset(0, 1),
                      ),
                    ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.thumb_up_sharp, color: Colors.amberAccent,),
                          SizedBox(width: 20.w,),
                          const Text("Recommend to Friends"),
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios_sharp),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0.2,
                          blurRadius: 5,
                          offset: const Offset(0, 1),
                        ),
                      ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.star_rounded, size: 28, color: Colors.amberAccent),
                          SizedBox(width: 20.w,),
                          const Text("Rate the app"),
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios_sharp),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0.2,
                          blurRadius: 5,
                          offset: const Offset(0, 1),
                        ),
                      ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.block_outlined, color: Colors.amberAccent),
                          SizedBox(width: 20.w,),
                          const Text("Bloc Ads"),
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios_sharp),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0.2,
                          blurRadius: 5,
                          offset: const Offset(0, 1),
                        ),
                      ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(CupertinoIcons.settings, color: Colors.amberAccent),
                          SizedBox(width: 20.w,),
                          const Text("Settings"),
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios_sharp),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}