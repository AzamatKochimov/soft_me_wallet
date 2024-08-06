import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet/src/common/local/app_storage.dart';
import 'package:wallet/src/feature/home/view_model/home_vm.dart';

import '../../../../common/routes/app_route_name.dart';
import '../../../auth/view_model/auth_vm.dart';
import '../widget/not_signed_profile_appbar.dart';
import '../widget/profile_body.dart';
import '../widget/signed_profile_appbar.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authVM);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          auth.isLoggedIn
              ? const SignedProfileAppBar()
              : const NotSignedProfileAppBar(),
          SizedBox(height: 30.h),
          const ProfileBody(),          
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: auth.isLoggedIn ?
            ElevatedButton(
              onPressed: () async {
                await ref.read(authVM.notifier).logout();
                await AppStorage.$write(key: StorageKey.token, value: null);
                context.go(AppRouteName.loginPage);
              },
              child: const Text('Logout'),
            ) : const SizedBox.shrink(),
    );
  }
}
