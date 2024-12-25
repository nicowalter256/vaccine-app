import 'package:flutter/material.dart';
import 'package:vaccination/constants/colors.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  late String message;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              children: [
                const CustomAppBarWidget(
                  title: 'Feedback',
                ),
                const SizedBox(height: 20),
                Text(
                  'Send us your feedback!',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    'Our team is on standby to respond to you as quick as possible.'),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    maxLines: 8,
                    validator: (val) {
                      if (val!.trim().isEmpty) {
                        return 'Field is required';
                      } else {
                        return null;
                      }
                    },
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: 'Type a message here',
                      hintStyle: const TextStyle(color: Colors.black38),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(width: 1.0, color: blackBG),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              width: 1.0, color: Color(0xffcacaca))),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 1.0,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  btnColor: blueBG,
                  textColor: whiteBG,
                  icon: Icons.feedback_sharp,
                  iconColor: whiteBG,
                  name: "Send Feedback",
                  onPress: () => {
                    if (formKey.currentState!.validate())
                      {
                        formKey.currentState!.save(),
                      }
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
