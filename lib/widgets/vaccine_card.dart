import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../widgets/custom_button.dart';
import '../views/notification_screen.dart';

class VaccineCard extends StatelessWidget {
  const VaccineCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height / 3,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: blueBG,
        image: DecorationImage(
          image: AssetImage(dashboardImg),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Welcome Nicholas",
                  style: GoogleFonts.mulish(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: whiteBG,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: Colors.blue, shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () => {
                      Get.to(
                        const NotificationScreen(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 500),
                      ),
                    },
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: whiteBG,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Facilities: 7,525",
            style: GoogleFonts.mulish(
              textStyle: const TextStyle(
                  fontSize: 30, color: whiteBG, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomButton(
              onPress: () => {},
              name: "Add Vaccine",
              btnColor: greenBG,
              textColor: whiteBG,
            ),
          ),
        ],
      ),
    );
  }
}
