import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repository/app_repository.dart';
import '../../../data/repository/providers.dar.dart';


final profileVM = ChangeNotifierProvider.autoDispose<ProfileVM>((ref) => ProfileVM(ref));

class ProfileVM extends ChangeNotifier {
  final AutoDisposeChangeNotifierProviderRef<ProfileVM> ref;
  final AppRepository appRepository;

  ProfileVM(this.ref) : appRepository = ref.read(appRepositoryProvider);

  bool isNotificationOn = true;
  File? profileImage;

  void changeNotification(bool v) {
    isNotificationOn = v;
    notifyListeners();
  }

  Future<void> pickAndUploadProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      log("image is being picked");
      profileImage = File(pickedFile.path);
      await appRepository.uploadProfileImage(profileImage!);
      notifyListeners();
    }
  }
}
