import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/colors.dart';
import '../constants/images.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  PageController pageController = PageController();
  //Function goToTab;
  int index = 0;

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: PageView(
      controller: pageController,
      children: [
        Column(
          children: <Widget>[
            Stack(children: [
              Container(
                height: size.height,
                width: size.width,
                color: greyBG,
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage('assets/SPLASH 1.png')),
                        ),
                        height: 0.4 * size.height,
                        width: size.width,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Welcome to Feasts Farms',
                      style: GoogleFonts.mulish(
                        textStyle: const TextStyle(
                            color: blackBG,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Farm managemement made easy.',
                      style: GoogleFonts.mulish(
                        textStyle: const TextStyle(
                            color: blackBG,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(bottom: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 150,
                              child: TextButton(
                                onPressed: () => {
                                  //Get.to(const LoginPage()),
                                },
                                child: Center(
                                  child: Text(
                                    'SKIP',
                                    style: GoogleFonts.mulish(
                                      textStyle: const TextStyle(
                                          color: blackBG,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                              )),
                          SmoothPageIndicator(
                              controller: pageController,
                              count: 3,
                              effect: WormEffect(
                                  dotHeight: 5,
                                  activeDotColor: greenBG,
                                  dotColor: Theme.of(context).dividerColor),
                              onDotClicked: (index) {}),
                          SizedBox(
                            width: 150,
                            child: TextButton(
                              onPressed: () {
                                pageController.animateToPage(1,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.ease);
                              },
                              child: Text(
                                'NEXT',
                                style: GoogleFonts.mulish(
                                  textStyle: const TextStyle(
                                      color: blackBG,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ],
        ),
        Column(
          children: <Widget>[
            Stack(children: [
              Container(
                height: size.height,
                width: size.width,
                color: greyBG,
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage('assets/Splash 2.png')),
                        ),
                        height: 0.4 * size.height,
                        width: size.width,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Your farm is at a turning point. Your decision to continue with this onboarding process will have a lasting impact on your operations. Sign Up for Convinience, Being in control and receive return on your investment with full accountability',
                        style: GoogleFonts.mulish(
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            child: TextButton(
                              onPressed: () {
                                pageController.animateToPage(0,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.ease);
                              },
                              child: Text(
                                'BACK',
                                style: GoogleFonts.mulish(
                                  textStyle: const TextStyle(
                                      color: blackBG,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ),
                          SmoothPageIndicator(
                              controller: pageController,
                              count: 3,
                              effect: WormEffect(
                                  dotHeight: 5,
                                  activeDotColor: greenBG,
                                  dotColor: Theme.of(context).dividerColor),
                              onDotClicked: (index) {}),
                          SizedBox(
                            width: 150,
                            child: TextButton(
                              onPressed: () {
                                pageController.animateToPage(2,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.ease);
                              },
                              child: Text(
                                'NEXT',
                                style: GoogleFonts.mulish(
                                  textStyle: const TextStyle(
                                      color: blackBG,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ],
        ),
        Column(
          children: <Widget>[
            Stack(children: [
              Container(
                height: size.height,
                width: size.width,
                color: greyBG,
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                              fit: BoxFit.contain, image: AssetImage(intro1)),
                        ),
                        height: 0.4 * size.height,
                        width: size.width,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sign Up for convinience',
                      style: GoogleFonts.mulish(
                        textStyle: const TextStyle(
                            fontSize: 25,
                            color: blackBG,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Be in control and receive return on investment with full accountability',
                      style: GoogleFonts.mulish(
                        textStyle: const TextStyle(
                            fontSize: 20,
                            color: blackBG,
                            fontWeight: FontWeight.normal),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 40, top: 20),
                      color: greyBG,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            child: TextButton(
                              onPressed: () {
                                pageController.animateToPage(1,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.ease);
                              },
                              child: Text(
                                'BACK',
                                style: GoogleFonts.mulish(
                                  textStyle: const TextStyle(
                                      color: blackBG,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ),
                          SmoothPageIndicator(
                              controller: pageController,
                              count: 3,
                              effect: WormEffect(
                                  dotHeight: 5,
                                  activeDotColor: greenBG,
                                  dotColor: Theme.of(context).dividerColor),
                              onDotClicked: (index) {}),
                          SizedBox(
                            width: 150,
                            child: TextButton(
                              onPressed: () {
                                //Get.to(const LoginPage());
                              },
                              child: Text(
                                'FINISH',
                                style: GoogleFonts.mulish(
                                  textStyle: const TextStyle(
                                      color: blackBG,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ],
        )
      ],
    ));
  }
}