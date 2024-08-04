import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotSignedPorfilePage extends ConsumerWidget {
  const NotSignedPorfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.r),
                bottomRight: Radius.circular(25.r),
              ),
            ),
            padding: EdgeInsets.only(bottom: 20.h),
            alignment: Alignment.bottomCenter,
            height: 180.h,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30.r,
                child: const Icon(Icons.person_outline),
              ),
              title: Text(
                "Sign in",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "Sign in, more exiting",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_a_photo_sharp),
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Container(
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
                          Icon(Icons.thumb_up_sharp, color: Colors.amberAccent,),
                          SizedBox(width: 20.w,),
                          Text("Recommend to Friends"),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_sharp),
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
                          Icon(Icons.star_rounded, size: 28, color: Colors.amberAccent),
                          SizedBox(width: 20.w,),
                          Text("Rate the app"),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_sharp),
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
                          Icon(Icons.block_outlined, color: Colors.amberAccent),
                          SizedBox(width: 20.w,),
                          Text("Bloc Ads"),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_sharp),
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
                          Icon(CupertinoIcons.settings, color: Colors.amberAccent),
                          SizedBox(width: 20.w,),
                          Text("Settings"),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_sharp),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
