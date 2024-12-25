import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class CustomContainer extends StatelessWidget {
  final String name;
  final String? icon;
  final Color? bgColor;
  final IconData? iconData;
  const CustomContainer({
    super.key,
    required this.name,
    this.icon,
    this.bgColor,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: iconData != null
              ? Icon(
                  iconData,
                  color: whiteBG,
                )
              : Image.asset('$icon'),
        ),
        const SizedBox(height: 7),
        Text(
          name,
          style: GoogleFonts.mulish(
            textStyle:
                const TextStyle(color: blackBG, fontWeight: FontWeight.normal),
          ),
        )
      ],
    );
  }
}
