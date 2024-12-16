import 'package:flutter/material.dart';
import '../constants/colors.dart';

class FormLabel extends StatelessWidget {
  const FormLabel({
    super.key,
    required this.labelText,
    this.labelTextColor = blackBG,
    required this.isRequired,
    this.showRequiredText = true,
  });

  // label text
  final String labelText;

  // label color
  final Color labelTextColor;

  final bool isRequired;

  final bool showRequiredText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // label
        Expanded(
          child: Text(
            labelText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: labelTextColor,
            ),
          ),
        ),

        //const HorizontalSpace(of: Constants.spacing4),

        // pill like chip to show required or optional
        // if (showRequiredText) RequiredOptionalText(isRequired: isRequired)
      ],
    );
  }
}
