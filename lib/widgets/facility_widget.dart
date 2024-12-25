import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaccination/constants/colors.dart';
import 'package:vaccination/models/facility.dart';
import '../constants/constants.dart';

class FacilityWidget extends StatelessWidget {
  final Facility facility;
  const FacilityWidget({super.key, required this.facility});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => {
              // Get.to(ProductDetails(
              //   product: product,
              // ))
            },
            child: Container(
              height: 235,
              color: greenBG,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    child: SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset("assets/market.png"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 100,
                              child: Text(
                                "${facility.name}",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.mulish(
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.lock, size: 13),
                                if (facility.amenity != null)
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      "${facility.amenity}",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.mulish(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            if (facility.cord != null)
                              Text(
                                "${facility.cord}",
                                style: GoogleFonts.mulish(
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                          ],
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: whiteBG,
                          ),
                          child: const Icon(Icons.favorite_outline),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // const SizedBox(height: 20),
          // Container(
          //   height: 40,
          //   decoration: const BoxDecoration(
          //     color: Constants.brownBG,
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(5),
          //     ),
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       const Icon(Icons.shopping_cart_outlined, size: 18),
          //       const SizedBox(width: 10),
          //       Text(
          //         "Add to cart",
          //         style: GoogleFonts.mulish(
          //           textStyle: const TextStyle(
          //               fontSize: 15, fontWeight: FontWeight.bold),
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
