import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../views/dashboard.dart';
import '../widgets/custom_snackbar.dart';

class UserController extends ChangeNotifier {
  bool loading = false;
  StreamSubscription<Position>? positionStream;
  Position? currentLocation;

  void startLocationTracking() {
    positionStream = Geolocator.getPositionStream(
            // desiredAccuracy: LocationAccuracy.high,
            // intervalDuration: const Duration(seconds: 7),
            )
        .listen((Position position) {
      currentLocation = position;
    });
  }

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
