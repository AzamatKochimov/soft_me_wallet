import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../reports/view_model/reports_vm.dart';

class SignedProfileAppBar extends ConsumerStatefulWidget {
  const SignedProfileAppBar({super.key});

  @override
  ConsumerState<SignedProfileAppBar> createState() => _SignedProfileAppBarState();
}

class _SignedProfileAppBarState extends ConsumerState<SignedProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    final profileImage = ref.watch(profileVM).profileImage;

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
          backgroundImage: profileImage != null
              ? FileImage(profileImage)
              : null,
        ),
        title: Text(
          "Name Surname",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          "username",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            ref.read(profileVM).pickAndUploadProfileImage();
          },
          icon: const Icon(Icons.add_a_photo_sharp),
        ),
      ),
    );
  }
}
