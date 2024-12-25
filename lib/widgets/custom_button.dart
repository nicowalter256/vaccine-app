import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final IconData? icon;
  final VoidCallback onPress;
  final Color btnColor, textColor;
  final Color? iconColor;
  final double? width;
  const CustomButton(
      {super.key,
      required this.onPress,
      required this.name,
      required this.btnColor,
      required this.textColor,
      this.icon,
      this.width,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: onPress,
        style: TextButton.styleFrom(
          backgroundColor: btnColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
        child: icon == null
            ? Center(
                child: Text(
                  name,
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                        color: textColor, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(icon, color: iconColor ?? blackBG)
                ],
              ),
      ),
    );
  }
}
