import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/routes/app_route_name.dart';

class NotSignedProfileAppBar extends StatelessWidget {
  const NotSignedProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          onPressed: () {
            context.go(AppRouteName.loginPage);
          },
          icon: const Icon(Icons.login),
        ),
      ),
    );
  }
}
