import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../constants/images.dart';
import '../views/account.dart';
import '../views/dashboard.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: whiteBG,
      type: BottomNavigationBarType.fixed,
      fixedColor: blueBG,
      unselectedItemColor: blueBG,
      onTap: (value) {
        if (value == 1) {
          Get.to(
            const AccountScreen(),
            transition: Transition.leftToRight,
            duration: const Duration(milliseconds: 500),
          );
        }
        if (value == 0) {
          Get.to(
            const DashboardScreen(),
            transition: Transition.leftToRight,
            duration: const Duration(milliseconds: 500),
          );
        }
      },
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: SizedBox(
            height: 40,
            width: 40,
            child: Image.asset(home),
          ),
        ),
        // BottomNavigationBarItem(
        //   label: 'Wallet',
        //   icon: SizedBox(
        //     height: 40,
        //     width: 40,
        //     child: Image.asset(wallet),
        //   ),
        // ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: SizedBox(
            height: 40,
            width: 40,
            child: Image.asset(account),
          ),
        ),
      ],
    );
  }
}
