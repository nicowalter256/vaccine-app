import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../controllers/user_controller.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_snackbar.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/form_label.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({
    super.key,
  });

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  UserController userController = UserController();

  final usernameController = TextEditingController();
  final telephoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final addressController = TextEditingController();
  bool check = false;

  bool obsecure = true;
  String? role;

  var formKey = GlobalKey<FormState>();
  File? image;
  bool isPickingImage = false;
  String gender = "male";
  int ageBracket = 1;
  int isPwd = 0;
  int roleId = 3;
  Map? user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: userController,
      child: Consumer<UserController>(
        builder: (_, model, child) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: AutofillGroup(
                    key: const ValueKey('feast_form'),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const CustomAppBarWidget(),
                          CustomTextField(
                            isRequired: true,
                            labelText: "Username",
                            controller: usernameController,
                            keyboardType: TextInputType.name,
                            hintText: 'Enter username',
                          ),
                          CustomTextField(
                            labelText: "Telephone",
                            isRequired: true,
                            controller: telephoneController,
                            keyboardType: TextInputType.name,
                            hintText: 'Enter telephone',
                          ),
                          CustomTextField(
                            labelText: "Email address",
                            isRequired: false,
                            controller: emailController,
                            keyboardType: TextInputType.name,
                            hintText: 'Enter email address',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const FormLabel(
                            labelText: 'Role',
                            isRequired: true,
                          ),
                          Column(
                            children: [
                              RadioListTile(
                                title: const Text("Health worker"),
                                value: 3,
                                groupValue: roleId,
                                onChanged: (value) {
                                  setState(() {
                                    roleId = int.parse(value.toString());
                                  });
                                },
                              ),
                              RadioListTile(
                                title: const Text("MOH"),
                                value: 4,
                                groupValue: roleId,
                                onChanged: (value) {
                                  setState(() {
                                    roleId = int.parse(value.toString());
                                  });
                                },
                              ),
                              RadioListTile(
                                title: const Text("District Health officer"),
                                value: 5,
                                groupValue: roleId,
                                onChanged: (value) {
                                  setState(() {
                                    roleId = int.parse(value.toString());
                                  });
                                },
                              ),
                              RadioListTile(
                                title: const Text("Public"),
                                value: 6,
                                groupValue: roleId,
                                onChanged: (value) {
                                  setState(() {
                                    roleId = int.parse(value.toString());
                                  });
                                },
                              ),
                            ],
                          ),
                          if (roleId == 6)
                            CustomTextField(
                              labelText: "Enter address or location",
                              isRequired: false,
                              controller: addressController,
                              keyboardType: TextInputType.text,
                              hintText: 'Enter your address or location',
                            ),
                          CustomTextField(
                            obscureText: obsecure,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obsecure = !obsecure;
                                });
                              },
                              child: obsecure
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                            maxLines: 1,
                            labelText: "Password",
                            isRequired: true,
                            controller: passwordController,
                            keyboardType: TextInputType.name,
                            hintText: '************',
                          ),
                          CustomTextField(
                            obscureText: obsecure,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obsecure = !obsecure;
                                });
                              },
                              child: obsecure
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                            maxLines: 1,
                            labelText: "Confirm Password",
                            isRequired: true,
                            controller: confirmpasswordController,
                            keyboardType: TextInputType.name,
                            hintText: '************',
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Checkbox(
                                value: check,
                                onChanged: (value) {
                                  setState(() {
                                    check = !check;
                                  });
                                },
                              ),
                              Text(
                                "Accept the terms and conditions",
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(color: blackBG),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          if (model.loading)
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: blackBG,
                              ),
                              child: const CircularProgressIndicator(
                                color: whiteBG,
                              ),
                            ),
                          if (!model.loading)
                            CustomButton(
                              name: "Create Account",
                              btnColor: blackBG,
                              textColor: whiteBG,
                              onPress: () => {
                                if (formKey.currentState!.validate())
                                  {
                                    formKey.currentState!.save(),
                                    if (passwordController.text !=
                                        confirmpasswordController.text)
                                      {
                                        CustomSnackBar.error(
                                            "Password dont match")
                                      }
                                    else
                                      {
                                        CustomSnackBar.error(
                                            "Error occurred while creating...")
                                      }
                                  }
                              },
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
