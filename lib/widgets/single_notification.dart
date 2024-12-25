import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';
import '../../constants/static_data.dart';

class SingleNotification extends StatelessWidget {
  const SingleNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(notifications.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: greyBG,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                const SizedBox(width: 20),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: notifications[index]['color'],
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      notifications[index]["name"],
                      style: GoogleFonts.mulish(
                        textStyle: const TextStyle(
                            fontSize: 13,
                            color: blackBG,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 50),
              ],
            ),
          ),
        );
      }),
    );
  }
}
