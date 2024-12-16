import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title == null
                  ? Image.asset(
                      'assets/logo.png',
                      height: 70,
                    )
                  : Row(
                      children: [
                        IconButton(
                          onPressed: () => {Get.back()},
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "$title",
                          style: GoogleFonts.mulish(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: blackBG),
                          ),
                        )
                      ],
                    ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => {
                      //Get.to(const NotificationScreen()),
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          color: Colors.grey, shape: BoxShape.circle),
                      child: Image.asset(
                        'assets/notifications.png',
                        height: 100,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
