import 'package:flutter/material.dart';

import '../widgets/custom_snackbar.dart';

class UserController extends ChangeNotifier {
  bool loading = false;

  void login({String? email, String? password}) async {
    if (loading == false) {
      loading = true;
      notifyListeners();
    }

    try {
      Future.delayed(const Duration(seconds: 3)).then((val) {
        CustomSnackBar.error("Login error");
      });
    } catch (err) {}
    loading = false;
    notifyListeners();
  }
}
