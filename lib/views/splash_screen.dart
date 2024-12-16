import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaccination/views/intro.dart';
import '../constants/colors.dart';
import '../constants/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  void startTimer() {
    timer = Timer(
      const Duration(seconds: 3),
      () async {
        Get.to(const Intro());
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBG,
      body: Center(
        child: Image.asset(
          logo,
          height: 100,
        ),
      ),
    );
  }
}
