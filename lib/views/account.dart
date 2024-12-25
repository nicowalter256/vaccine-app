import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaccination/views/help_screen.dart';
import '../constants/colors.dart';
import '../constants/images.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigationWidget(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CustomAppBarWidget(
              title: 'Profile',
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Image.network(
                      profileImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Wisdom3",
                      style: GoogleFonts.mulish(
                        textStyle: const TextStyle(
                            fontSize: 20,
                            color: greenBG,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "+256776401884",
                      style: GoogleFonts.mulish(
                        textStyle: const TextStyle(
                            color: blackBG, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.edit_note,
                  color: greenBG,
                )
              ],
            ),
            const SizedBox(height: 30),
            CustomButton(
              onPress: () => {
                Get.to(const HelpScreen()),
              },
              btnColor: greenBG,
              icon: Icons.help,
              iconColor: blackBG,
              textColor: blackBG,
              name: "Help",
            ),
            const SizedBox(height: 10),
            CustomButton(
              onPress: () => {},
              btnColor: greenBG,
              icon: Icons.rotate_right_outlined,
              iconColor: blackBG,
              textColor: blackBG,
              name: "Rate Us",
            ),
            const SizedBox(height: 10),
            CustomButton(
              onPress: () => {},
              btnColor: greenBG,
              icon: Icons.control_point_duplicate_outlined,
              iconColor: blackBG,
              textColor: blackBG,
              name: "Terms and conditions",
            ),
            const SizedBox(height: 10),
            CustomButton(
              onPress: () => {},
              btnColor: greenBG,
              icon: Icons.privacy_tip,
              iconColor: blackBG,
              textColor: blackBG,
              name: "Privacy Policy",
            ),
            const SizedBox(height: 100),
            CustomButton(
              onPress: () => {},
              btnColor: redBG,
              icon: Icons.logout,
              iconColor: whiteBG,
              textColor: whiteBG,
              name: "Log out",
            ),
          ],
        ),
      )),
    );
  }
}
