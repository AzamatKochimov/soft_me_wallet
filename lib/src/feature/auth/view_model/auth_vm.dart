import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'dart:developer';

import '../../../common/local/app_storage.dart';
import '../../../common/server/api/api.dart';
import '../../../common/server/api/api_constants.dart';

AutoDisposeChangeNotifierProvider<AuthVM> authVM =
ChangeNotifierProvider.autoDispose<AuthVM>(
        (ChangeNotifierProviderRef<AuthVM> ref) => AuthVM());

class AuthVM with ChangeNotifier {
  String? _token;

  AuthVM() {
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    _token = await AppStorage.$read(key: StorageKey.token);
    notifyListeners();
  }

  bool get isLoggedIn => _token != null;

  Future<Map<String, dynamic>> login(Map<String, dynamic> map) async {
    log("login func");
    try {
      String? response = await ApiService.post(ApiConst.login, map, params: {});
      log("API response: $response");

      if (response == null) {
        throw Exception("No response from API");
      }

      Map<String, dynamic> responseObj = jsonDecode(response);
      log("response object: $responseObj");

      // Assuming the response format is always valid.
      print(responseObj['message']);
      log("message from response: ${responseObj['message']}");

      await AppStorage.$write(
          key: StorageKey.token, value: responseObj['token']);
      _token = responseObj['token'];
      log("prefs token ${await AppStorage.$read(key: StorageKey.token)}");

      notifyListeners();

      return {'status': true, 'message': 'Successfully logged in.'};
    } catch (e, stackTrace) {
      // Login failed
      log("Exception: $e");
      log("StackTrace: $stackTrace");

      return {
        'status': false,
        'message': 'Login failed. Please try again.',
      };
    }
  }

  Future<Map<String, dynamic>> register(Map<String, dynamic> map) async {
    log("register func");
    try {
      String? response = await ApiService.post(ApiConst.register, map, params: {});
      log("API response: $response");

      if (response == null) {
        throw Exception("No response from API");
      }

      Map<String, dynamic> responseObj = jsonDecode(response);
      log("response object: $responseObj");

      // Assuming the response format is always valid.
      print(responseObj['message']);
      log("message from response: ${responseObj['message']}");
      //
      // await AppStorage.$write(
      //     key: StorageKey.token, value: responseObj['token']);
      // _token = responseObj['token'];
      // log("prefs token ${await AppStorage.$read(key: StorageKey.token)}");

      notifyListeners();

      return {'status': true, 'message': 'Successfully registered.'};
    } catch (e, stackTrace) {
      // Login failed
      log("Exception: $e");
      log("StackTrace: $stackTrace");

      return {
        'status': false,
        'message': 'Register failed. Please try again.',
      };
    }
  }

  Future<void> logout() async {
    await AppStorage.$delete(key: StorageKey.token);
    _token = null;
    log(_token.toString());
    notifyListeners();
  }
}
