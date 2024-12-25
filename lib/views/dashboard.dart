import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/static_data.dart';
import '../controllers/user_controller.dart';
import '../helpers/facilities_search.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/custom_container.dart';
import '../widgets/vaccine_card.dart';
import 'route_set_up.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  UserController userController = UserController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBG,
      bottomNavigationBar: const BottomNavigationWidget(),
      body: ChangeNotifierProvider.value(
        value: userController,
        child: Consumer<UserController>(
          builder: (_, model, child) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const VaccineCard(),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 2.0 / 2,
                          crossAxisCount: 3,
                          crossAxisSpacing: 0.0,
                          mainAxisSpacing: 0.0,
                        ),
                        itemCount: tabsList.length,
                        itemBuilder: (BuildContext context, index) {
                          return GestureDetector(
                            onTap: () => {
                              if (tabsList[index]['id'] == 2)
                                {
                                  showSearch(
                                    context: context,
                                    delegate: FacilitySearchDelegate(),
                                  ),
                                },
                              if (tabsList[index]['id'] == 3)
                                {
                                  Get.to(const RouteSetUp()),
                                }
                            },
                            child: CustomContainer(
                              bgColor: tabsList[index]['color'],
                              name: tabsList[index]['name'],
                              icon: tabsList[index]['icon'],
                              iconData: tabsList[index]['iconData'],
                            ),
                          );
                        },
                      ),
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        height: 180,
                        viewportFraction: 1.0,
                      ),
                      items: List.generate(
                        adsList.length,
                        (index) => Builder(
                          builder: (BuildContext context) {
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Image.asset(adsList[index]['image']));
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
