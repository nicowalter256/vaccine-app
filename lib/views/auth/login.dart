import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vaccination/views/auth/sign_up.dart';
import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../controllers/user_controller.dart';
import '../../widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserController userController = UserController();
  TextEditingController emailController =
      TextEditingController(text: 'nico@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: '12345678');

  final formkey = GlobalKey<FormState>();
  bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    Map user = {};
    final size = MediaQuery.sizeOf(context);
    return ChangeNotifierProvider.value(
      value: userController,
      child: Consumer<UserController>(
        builder: (_, model, child) {
          return SafeArea(
            child: Scaffold(
                body: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: size.height / 3,
                        width: size.width,
                        decoration: const BoxDecoration(
                          color: whiteBG,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(logo),
                          ),
                        ),
                      )),
                  Form(
                    key: formkey,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: whiteBG,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Email",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              style: const TextStyle(color: blackBG),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onSaved: (val) {
                                user['email'] = val!.trim();
                              },
                              controller: emailController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter email or phone number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w200),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                                isDense: true,
                                contentPadding:
                                    const EdgeInsets.fromLTRB(23, 23, 23, 0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Password",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              obscureText: obsecure,
                              style: const TextStyle(
                                color: blackBG,
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onSaved: (val) {
                                user['password'] = val!.trim();
                              },
                              controller: passwordController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Password required';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: '*************',
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
                                hintStyle: const TextStyle(
                                    color: blackBG,
                                    fontWeight: FontWeight.w200),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: blackBG,
                                    width: 1.0,
                                  ),
                                ),
                                isDense: true,
                                contentPadding:
                                    const EdgeInsets.fromLTRB(23, 23, 23, 0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: whiteBG,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => {},
                                  child: const Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      'Forgot password',
                                      style: TextStyle(color: blackBG),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            if (model.loading)
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: blackBG,
                                  ),
                                  child: const CircularProgressIndicator(
                                      color: whiteBG),
                                ),
                              ),
                            if (!model.loading)
                              Align(
                                alignment: Alignment.center,
                                child: CustomButton(
                                  onPress: () {
                                    if (formkey.currentState!.validate()) {
                                      formkey.currentState!.save();
                                      model.login();
                                    }
                                  },
                                  btnColor: blackBG,
                                  textColor: whiteBG,
                                  name: "Login",
                                ),
                              ),
                            const SizedBox(
                              height: 16,
                            ),
                            if (!model.loading)
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Dont have an account",
                                  style: GoogleFonts.mulish(
                                    textStyle: const TextStyle(color: blackBG),
                                  ),
                                ),
                              ),
                            const SizedBox(
                              height: 20,
                            ),
                            if (!model.loading)
                              Align(
                                alignment: Alignment.center,
                                child: CustomButton(
                                  onPress: () {
                                    Get.to(const SignupScreen());
                                  },
                                  btnColor: blackBG,
                                  textColor: whiteBG,
                                  name: "Sign Up",
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
