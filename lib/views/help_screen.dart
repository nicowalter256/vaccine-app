import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaccination/views/feedback.dart';
import '../constants/colors.dart';
import '../constants/images.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/custom_app_bar.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigationWidget(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const CustomAppBarWidget(
              title: 'Help',
            ),
            const SizedBox(height: 30),
            Container(
              height: 100,
              decoration: const BoxDecoration(
                color: greenBG,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset(question),
                    const SizedBox(width: 10),
                    Text(
                      "Frequently Asked Questions",
                      style: GoogleFonts.mulish(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: blackBG,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => {
                Get.to(const FeedBack()),
              },
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: greenBG,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Image.asset(message),
                      const SizedBox(width: 10),
                      Text(
                        "Send Us Message",
                        style: GoogleFonts.mulish(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              color: blackBG,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
