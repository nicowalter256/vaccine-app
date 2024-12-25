import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/dashboard.dart';
import '../widgets/custom_snackbar.dart';

class UserController extends ChangeNotifier {
  bool loading = false;

  void login({String? email, String? password}) async {
    if (loading == false) {
      loading = true;
      notifyListeners();
    }

    try {
      Get.to(const DashboardScreen());
      // Future.delayed(const Duration(seconds: 3)).then((val) {
      //   CustomSnackBar.error("Login error");
      // });
    } catch (err) {}
    loading = false;
    notifyListeners();
  }
}
