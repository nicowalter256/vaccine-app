import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'form_label.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? labelText;
  final bool? obscureText;
  final String? obscureCharacter;
  final String? hintText;
  final bool isRequired;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final bool isReadOnly;
  final dynamic initailValue;
  final bool showRequiredText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    this.obscureText = false,
    this.obscureCharacter = '**',
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
    required this.isRequired,
    this.maxLines,
    this.showRequiredText = true,
    this.isReadOnly = false,
    this.initailValue,
  }) : super(key: key);

  final fieldStyle = const TextStyle(fontSize: 15, color: blackBG);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          FormLabel(
            labelText: labelText.toString(),
            isRequired: isRequired,
            showRequiredText: showRequiredText,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            initialValue: initailValue,
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText!,
            obscuringCharacter: obscureCharacter!,
            maxLines: maxLines,
            readOnly: isReadOnly,
            validator: (val) {
              if (isRequired && val!.isEmpty) {
                return 'Field is required';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: fieldStyle.copyWith(
                color: blackBG.withOpacity(.5),
              ),
              filled: true,
              fillColor: blackBG.withOpacity(.05),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              errorMaxLines: 5,
              errorStyle: const TextStyle(color: redBG),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: redBG,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: redBG,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              // * Normal Styling
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: blackBG,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Colors.yellow.withOpacity(.05),
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              isDense: true,
            ),
          ),
        ],
      ),
    );
  }
}
